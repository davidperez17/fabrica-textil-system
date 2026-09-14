# 02 · Captura de puntadas y estado de máquina

## Cómo cuenta una bordadora

Todas las cabezas de una bordadora multicabezal cuelgan del mismo eje principal. Una revolución del eje produce una puntada en cada cabeza al mismo tiempo. El contador del panel avanza **una** unidad.

De ahí se derivan tres hechos que el sistema debe modelar explícitamente:

1. `puntadas del contador` ≠ `puntadas físicas totales`. Las físicas son `contador × cabezas`.
2. `prendas producidas` = `repeticiones del diseño × cabezas activas`.
3. Un sensor colocado en el eje principal produce **exactamente la misma cuenta que el panel**. Esto es lo que hace viable el retrofit: no hay que interpretar el panel, hay que contar vueltas.

## Las cuatro vías de captura

### A. Captura manual asistida (PWA)

El operario lee el contador del panel y lo teclea al abrir y cerrar la corrida. Puede adjuntar foto del panel.

- Costo: cero hardware.
- Tiempo de implementación: días.
- Debilidad: depende de la disciplina del operario y es manipulable. Se mitiga con la verificación de diseño (una cifra inventada difícilmente cuadra con las puntadas esperadas del diseño declarado) y con la foto del panel como evidencia.
- **Es el punto de partida recomendado.** Todo lo demás se puede añadir después sin rehacer el modelo de datos.

### B. Sensor retrofit sobre el eje principal

Un sensor inductivo o fotoeléctrico detecta el paso de un punto de referencia del eje/volante; un microcontrolador (ESP32 con WiFi) cuenta pulsos y los envía a un gateway local.

- Un pulso por vuelta = una puntada del contador. La correspondencia con el panel es directa y auditable: se comparan las dos cifras al final del turno.
- Es no invasivo: no toca la electrónica de la máquina, no invalida garantía.
- Da además, gratis, lo que la captura manual no da:
  - **puntadas por minuto en tiempo real** → detección de máquina corriendo vs. parada,
  - **duración y hora de cada paro** → rotura de hilo, cambio de bastidor, falta de material,
  - marca temporal exacta de inicio y fin de cada corrida.
- Costo estimado por máquina: bajo (sensor + microcontrolador + fuente). Requiere un electricista para montaje y un gateway WiFi en planta.
- Es la vía recomendada para la fase 3, sobre todo si hay máquinas viejas o de marcas mezcladas.

Definición de "máquina funcionando": hay pulsos en los últimos *N* segundos (N ≈ 5). El corte entre micro-paro y paro real se define por parámetro (p. ej. > 120 s = paro registrable).

### C. Red del panel de control

Los controladores Dahao BECS (A15, A18, A58, A98, 285A, series 18/41) traen un apéndice de "conexión en red de máquinas de bordar" en su manual, y Tajima ofrece red LAN con reportes de producción a través de su software DG/Pulse (estadísticas de puntadas por minuto, eficiencia, roturas de hilo, exportables a XLS).

- Ventaja: el dato viene de la fuente oficial, sin hardware añadido.
- Problema: **el protocolo es propietario y no está documentado públicamente.** El software de reporte es del fabricante y no expone API abierta. En el caso de Tajima, la funcionalidad está atada a su ecosistema de licencias.
- Conclusión práctica: no se puede comprometer esta vía sin ir a la planta, ver el modelo exacto del controlador y probar. Si funciona, es la mejor; si no, no bloquea nada porque las vías A y B existen.
- Acción pendiente: inventariar marca, modelo y versión de firmware de cada controlador (ver `09-riesgos-roadmap-preguntas.md`).

### D. Archivo exportado a USB

Los paneles Dahao permiten entrada y salida de datos por memoria USB y llevan contadores acumulados de puntadas y de producción en pantalla. Si el modelo instalado exporta estadísticas (no solo diseños), se puede importar el archivo al sistema una vez por turno.

- Es un buen respaldo intermedio: no necesita red ni hardware, pero sí una rutina diaria.
- Requiere confirmar contra el manual del modelo exacto.

## Matriz de decisión

| Criterio | A · Manual | B · Sensor | C · Red panel | D · USB |
|---|---|---|---|---|
| Hardware necesario | ninguno | sensor + ESP32 + gateway | cableado de red | memoria USB |
| Tiempo real | no | sí | sí | no |
| Detecta paros | no | sí | sí | parcial |
| Riesgo de manipulación | alto | bajo | bajo | medio |
| Riesgo técnico | nulo | bajo | **alto** (protocolo cerrado) | medio |
| Dependencia del fabricante | ninguna | ninguna | total | media |
| Recomendación | **fase 1** | **fase 3** | evaluar en sitio | respaldo |

## Consecuencia de arquitectura

El origen del dato se abstrae detrás de una sola interfaz. Toda lectura entra al sistema con el mismo contrato:

```
registrar_lectura(maquina_id, ts, contador_acumulado, fuente, idempotency_key)
```

`fuente` ∈ {`manual`, `sensor`, `panel_red`, `archivo`} queda guardada en cada fila (`lectura_contador.fuente`, `corrida.fuente`), de modo que un reporte puede decir qué porcentaje de la producción está respaldada por sensor y qué porcentaje por captura manual. Esa columna es lo que permite migrar de fase sin reescribir nómina ni reportes.

`idempotency_key` es obligatoria: la PWA trabaja sin conexión y reintenta envíos; sin clave de idempotencia se duplican puntadas y se duplica el pago.

## Reglas de integridad del contador

El contador físico del panel se puede reiniciar. El sistema no debe confiar en que sea monótono:

- Si `contador_fin < contador_inicio`, la corrida se marca para revisión en lugar de producir un delta negativo.
- El acumulado histórico de la máquina (`maquina.puntadas_acumuladas`) lo lleva el sistema sumando deltas válidos, nunca copiando el número del panel. De ese acumulado depende el mantenimiento preventivo.
- Un salto de contador que exceda la capacidad física de la máquina en el tiempo transcurrido (`delta > spm_max × minutos`) se rechaza como imposible. Esta validación es barata y atrapa tanto errores de dedo como fraude.
