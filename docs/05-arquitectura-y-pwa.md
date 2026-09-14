# 05 · Arquitectura del sistema y PWA para operarios

## Restricciones que mandan sobre el diseño

1. **Planta industrial, conectividad irregular.** WiFi con zonas muertas entre máquinas, cortes de energía. La app no puede depender de la red para funcionar.
2. **Usuarios con alfabetización digital variable** y posible idioma materno distinto del español (k'iche', kaqchikel, mam según la región). La interfaz del operario debe ser casi sin texto: escanear, ver una foto, tocar un botón grande.
3. **Dispositivos compartidos.** Puede haber una tableta por cada 2–4 máquinas, no un teléfono por persona. Login rápido por QR de gafete, no por contraseña tecleada.
4. **El dato es dinero.** Cada puntada perdida o duplicada es un error de pago. La sincronización tiene que ser idempotente, no "mejor esfuerzo".
5. **Presupuesto de PyME.** Debe correr en un servidor modesto o un VPS barato, sin licencias por asiento.

## Forma general

```
   ┌──────────────────────────────────────────────────────────┐
   │  PISO DE PLANTA                                          │
   │                                                          │
   │   [Máquina 1] ──┐                                        │
   │   [Máquina 2] ──┼── sensores (fase 3) ──► gateway local ─┼──┐
   │   [Máquina N] ──┘                                        │  │
   │                                                          │  │
   │   Tabletas / teléfonos ── PWA offline ───────────────────┼──┤
   └──────────────────────────────────────────────────────────┘  │
                                                                 ▼
                                       ┌──────────────────────────────────┐
                                       │  API (REST/JSON)                 │
                                       │  · ingesta idempotente           │
                                       │  · verificación de diseño        │
                                       │  · cálculo de nómina             │
                                       │  · reportes                      │
                                       └──────────────┬───────────────────┘
                                                      ▼
                                       ┌──────────────────────────────────┐
                                       │  PostgreSQL                      │
                                       │  lectura_contador · corrida ·    │
                                       │  nómina · inventario · mtto      │
                                       └──────────────────────────────────┘
                                                      ▲
                                       Panel web de administración
                                       (gerencia, RRHH, supervisión, bodega)
```

El gateway local es importante: si se instalan sensores, deben poder seguir contando y almacenando aunque se caiga el internet, y volcar al servidor cuando vuelva. Un contador que pierde datos durante un corte de red es un contador que produce reclamos de pago.

## Stack recomendado

| Capa | Recomendación | Por qué |
|---|---|---|
| Base de datos | PostgreSQL 16 | Transaccional, gratuito, maneja bien series de tiempo moderadas con índices por `(maquina_id, ts)`. Sin necesidad de una base especializada al volumen de una fábrica. |
| Backend | Node.js + TypeScript, o Python + FastAPI | Ambos con buen soporte de PWA y de despliegue barato. La elección puede seguir a quién dé mantenimiento. |
| Frontend admin | React o Svelte, SPA sencilla | Tablas, filtros por fecha, gráficas. |
| PWA operario | La misma base, build separado | Service worker + IndexedDB. Instalable desde el navegador; no requiere tienda de aplicaciones ni MDM. |
| Autenticación | Sesión por token, login por QR de gafete para operarios | Sin contraseñas tecleadas en el piso. |
| Reportes | Generación en servidor a PDF/XLSX | El libro de salarios y las planillas del IGSS se imprimen. |

Una PWA es la elección correcta frente a una app nativa: se instala sin tienda, se actualiza sola, corre en Android barato y no obliga a mantener dos bases de código. La contrapartida —acceso limitado a hardware— no pesa aquí, porque lo único que necesita del dispositivo es la cámara para escanear QR, que la PWA sí puede usar.

## Modelo offline: outbox con idempotencia

Patrón: la interfaz **nunca** espera al servidor. Escribe local y encola.

```
1. El operario cierra una corrida.
2. La PWA genera un UUID en el cliente (idempotency_key)
   y escribe la operación en una cola (outbox) en IndexedDB.
3. La UI confirma de inmediato y muestra la corrida como "pendiente de sincronizar".
4. Un proceso de fondo (Background Sync, con reintento propio como respaldo)
   drena la cola contra la API.
5. El servidor guarda la fila con esa idempotency_key con restricción UNIQUE.
   Un reintento del mismo envío no crea una segunda fila: devuelve la existente.
6. La PWA marca la operación como sincronizada y la saca de la cola.
```

La restricción `UNIQUE` sobre `lectura_contador.idempotency_key` es la pieza que hace el sistema seguro contra duplicados. Sin ella, una red intermitente infla la producción y la planilla.

Política de conflictos: **el servidor es la autoridad para todo lo derivado** (nómina, inventario, estado de orden); el cliente solo aporta hechos crudos con marca de tiempo y clave. Con eso no hay conflictos de escritura que resolver: no hay dos clientes editando el mismo registro, hay muchos clientes agregando hechos distintos. Es lo que hace que este dominio sea más fácil que un editor colaborativo.

Datos que la PWA cachea para trabajar sin conexión: catálogo de diseños vigentes (código, nombre, puntadas, foto), catálogo de máquinas, órdenes abiertas, y el operario en sesión. Todo lo demás puede esperar a la red.

## La PWA del operario: qué debe hacer y qué no

**Debe hacer, en este orden de importancia:**

1. Abrir y cerrar corridas (escanear máquina, escanear diseño, teclear contador).
2. Mostrar al operario **sus propias puntadas y su ganancia acumulada** del día y de la quincena, en quetzales, en letra grande. Este es el rasgo que hace que los operarios adopten el sistema en vez de resistirlo: convierte una caja negra en un marcador visible.
3. Reportar paros: rotura de hilo, falta de material, falla. Un botón por causa, con ícono.
4. Consultar la hoja de ruta: qué diseño toca ahora, cuántas repeticiones.

**No debe hacer:** captura de datos personales, edición de tarifas, consulta de nómina de terceros, nada administrativo. Cada campo extra en el piso es un campo que se llena mal.

Detalles de campo que importan más de lo que parecen: botones grandes con área táctil generosa (se opera con las manos ocupadas o con guante), alto contraste (hay planta con iluminación pobre y con brillo directo), retroalimentación sonora en el escaneo (no siempre se puede mirar la pantalla), y todos los números en quetzales con dos decimales, sin abreviar.

## Datos personales: obligación práctica aunque la ley esté pendiente

Guatemala **no tiene todavía una ley general de protección de datos personales en vigor**; existe una iniciativa de Ley de Protección de Datos Personales y Garantía de Derechos Digitales en trámite en el Congreso, complementaria a la iniciativa 6514 de transformación digital. Que no haya ley no elimina el riesgo: el sistema va a almacenar DPI, dirección y teléfono de trabajadores, y eso es material sensible por sí mismo.

Medidas mínimas, que además dejan el sistema listo para cuando la ley entre en vigor:

- Cifrado en tránsito (TLS) y de la base en reposo.
- El DPI y la dirección solo visibles para los roles `rrhh` y `admin`; nunca en pantallas de piso ni en reportes de producción.
- Toda lectura o modificación de datos personales queda en `auditoria`.
- Retención definida: qué se conserva y por cuánto tiempo tras la baja del trabajador (la obligación contable y laboral marca el piso).
- Respaldos cifrados y probados. Un respaldo que nunca se restauró no es un respaldo.
