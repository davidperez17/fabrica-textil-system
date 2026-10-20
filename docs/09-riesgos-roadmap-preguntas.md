# 09 · Riesgos, hoja de ruta y preguntas abiertas

> **Nota de vigencia (20 oct 2026).** Investigación previa a la cotización. Desde el 16 de
> septiembre de 2026 la captura es **solo manual**: el operario ingresa con el QR de su gafete,
> declara el diseño con su QR, toca Comenzar, Pausar, Reanudar o Finalizar y teclea el contador.
> No hay sensores, gateway en planta ni «Fase 3», y el sistema corre en la nube. La hoja de ruta se alineó con las fases de la cotización; las preguntas abiertas siguen pendientes para la Fase 0.
> En pantalla se dice «trabajo»; «corrida» queda como término interno. Para diseñar mandan los
> documentos 11 a 13.

## Preguntas que hay que responder antes de escribir código de producción

Están ordenadas por cuánto cambian el diseño si la respuesta es distinta a la supuesta.

### Bloqueantes

1. **¿La tarifa de Q1 / 1,500 puntadas se aplica sobre el contador del panel o sobre puntadas multiplicadas por número de cabezas?**
   Con el contador del panel, un operario de máquina de 6 cabezas gana lo mismo que uno de 1 cabeza produciendo seis veces más. Multiplicando por cabezas, ese operario ganaría más de Q22,000 mensuales, lo cual no es plausible. La aritmética sugiere fuertemente que se paga por contador de panel, pero hay que confirmarlo con la boca del cliente, no deducirlo.

2. **¿Cuántas cabezas tiene cada máquina y de qué marca/modelo/controlador son?**
   Determina la viabilidad de la captura por red, el cálculo de prendas y la conversión horas↔puntadas del mantenimiento. Se necesita un inventario con foto del panel de cada máquina.

3. **¿La empresa está acogida al régimen de maquila y exportación (Decreto 29-89)?**
   Cambia el salario mínimo aplicable de Q3,816.90 a Q3,221.10 mensuales, y con él todo el cálculo de complementos.

4. **¿Cuál es el período de pago: semanal o quincenal?**
   El séptimo día del Art. 126 se calcula sobre lo devengado **en la semana**. Si se paga quincenal, el cálculo debe hacerse semana por semana y sumarse, no aplicar 1/6 sobre el total de la quincena. Da resultados distintos cuando la producción es despareja entre semanas.
   *Precisión (20 oct 2026):* un sexto es proporcional, así que la suma de los sextos semanales
   es igual al sexto de la quincena. La diferencia aparece en las semanas que caen entre dos
   quincenas, en las ausencias que hacen perder el día de descanso y si el complemento al
   mínimo se calcula por semana. La cotización promete el cálculo por semana; los ejemplos de
   diseño (brief 11 §11, hoja 13) lo simplifican sobre la quincena y deben ajustarse cuando se
   confirme la regla.

### Importantes

5. ¿Cuántas máquinas, cuántos operarios y cuántos turnos? Define el dimensionamiento y si hace falta gateway o basta con WiFi directo.
6. ¿Hay conectividad estable en el piso de planta? ¿Hay tabletas o teléfonos disponibles, y cuántos por máquina?
7. ¿Cuántos diseños activos tiene el catálogo y en qué formato están (DST, DSB, EMB)? ¿Existen los archivos o solo están cargados en las máquinas?
8. ¿Cómo se identifica hoy la producción de cada operario? Entender el proceso actual en papel evita diseñar contra un proceso imaginario.
9. ¿Qué descuentos y bonificaciones se aplican en la práctica, y quién los autoriza?
10. ¿El sistema debe emitir facturas? Si sí, FEL es un proyecto aparte con certificador contratado.
11. ¿Qué idiomas hablan los operarios? Define si la PWA necesita traducción o solo iconografía.
12. ¿Hay contabilidad o ERP existente con el que haya que conciliar?

## Riesgos y mitigaciones

| Riesgo | Impacto | Probabilidad | Mitigación |
|---|---|---|---|
| El protocolo de red del controlador resulta inaccesible | Alto | **Alta** | No depender de él: la captura es manual. La abstracción de `fuente` permitiría sumar otra vía más adelante sin rehacer nada. |
| Captura manual manipulada para inflar el pago | Alto | Media | Verificación por diseño (una cifra inventada no cuadra con las puntadas esperadas), validación de delta contra capacidad física de la máquina, foto del panel, cotejo periódico contra el acumulado real del panel |
| Nómina mal calculada → contingencia laboral | **Muy alto** | Media | Séptimo día como 1/6 según Art. 126; complemento automático al mínimo; tarifa y parámetros legales versionados; período cerrable; revisión por contador antes de producción |
| La tarifa deja al operario bajo el mínimo de forma sistemática | Alto | **Alta** (la aritmética lo muestra) | Alerta temprana de proyección en la PWA y en el panel de RRHH; conversación con el cliente sobre recalibrar la tarifa |
| Rechazo de los operarios al sistema | Alto | Media | La PWA les muestra su ganancia en tiempo real. El sistema tiene que darles algo, no solo vigilarlos |
| Pérdida de datos por corte de red o energía | Alto | Media | Outbox en IndexedDB, gateway con almacenamiento local, idempotencia obligatoria |
| Contador del panel reiniciado | Medio | Alta | El acumulado lo lleva el sistema por deltas, nunca copiando el panel; deltas negativos se marcan para revisión |
| Fuga de datos personales (DPI, dirección) | Alto | Baja | Cifrado, control por rol, auditoría de accesos, retención definida |
| Alcance que crece hacia ERP completo | Medio | **Alta** | Fases cerradas con entregable útil cada una; FEL explícitamente fuera de la fase 1 |

## Hoja de ruta

Alineada con la cotización (rev. 2): siete semanas en total, tres pagos ligados a entregas.

### Fase 0 — Levantamiento y acuerdo de detalles (semana 1)
Inventario de máquinas con marca, modelo, controlador, cabezas y velocidad. Fotos de los
paneles. Recolección de los archivos de diseño. Entrevista con administración sobre nómina y
con supervisión sobre el proceso actual. Respuestas a las preguntas bloqueantes de arriba.
Diseño, con el cliente, de las pantallas de configuración (catálogos, campos personalizados,
reportes).
**Entregable:** especificación cerrada.

### Fase 1 — Núcleo con captura manual (semanas 2 a 4)
Operarios (con validación de DPI), máquinas, diseños (importados desde DST) y productos. App
del operario para comenzar, pausar, reanudar y finalizar trabajos con el contador tecleado.
Verificación de diseño por puntadas. Reportes de producción. Configuración de catálogos y
campos personalizados.
**Entregable:** el dato de producción deja de vivir en papel. Ya es útil por sí solo.

### Fase 2 — Nómina, inventario y mantenimiento (semanas 5 a 7)
Destajo con séptimo día y complemento al mínimo, cierre de período y constancias. Inventario.
Mantenimiento preventivo por puntadas. Reportes configurables. Copia diaria automática a una
computadora de la fábrica.
**Entregable:** el sistema sustituye las hojas de cálculo de planilla.

### Fuera de la cotización
Se cotizan aparte si el negocio las pide: captura automática con sensores (descartada por
ahora), planeación por temporada con demanda estimada, costeo por prenda y facturación FEL con
certificador.

## Criterio de éxito

El sistema funciona si, al cerrar una quincena, nadie tiene que abrir una hoja de cálculo para verificar un pago; y si un supervisor puede responder «¿cuánto produjo la máquina 4 la semana pasada y qué prendas eran?» en menos de un minuto y con confianza en la respuesta.
