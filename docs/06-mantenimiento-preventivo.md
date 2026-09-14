# 06 · Mantenimiento preventivo por puntadas

## Por qué disparar por puntadas y no por calendario

El desgaste de una bordadora sigue al trabajo hecho, no al tiempo transcurrido. Una máquina que estuvo parada tres semanas no necesita engrase; una que corrió a 900 spm en temporada de feria lo necesita antes de lo que dice el calendario.

Como el sistema ya lleva el acumulado exacto de puntadas por máquina (`maquina.puntadas_acumuladas`), el disparador natural del preventivo es ese contador. Es la métrica correcta y sale gratis.

## Equivalencia horas ↔ puntadas

Los manuales de fabricante expresan los intervalos en horas de operación. Hay que convertirlos. La tabla de conversión depende de la velocidad y la eficiencia real de cada máquina:

| Velocidad | Eficiencia | Puntadas/hora | 8 h | 40 h | 200 h |
|---:|---:|---:|---:|---:|---:|
| 650 spm | 60 % | 23,400 | 187,200 | 936,000 | 4,680,000 |
| 650 spm | 70 % | 27,300 | 218,400 | 1,092,000 | 5,460,000 |
| 750 spm | 70 % | 31,500 | 252,000 | 1,260,000 | 6,300,000 |
| 850 spm | 70 % | 35,700 | 285,600 | 1,428,000 | 7,140,000 |
| 1,000 spm | 70 % | 42,000 | 336,000 | 1,680,000 | 8,400,000 |

Regla práctica: en una máquina típica de este segmento, **8 horas de operación ≈ 250,000 puntadas**.

## Intervalos de referencia

Tomados de guías de mantenimiento de bordadoras industriales. **Son punto de partida; el manual del fabricante de las máquinas instaladas manda sobre esta tabla.**

| Tarea | Intervalo típico | Equivalente en puntadas (≈750 spm, 70 %) |
|---|---|---:|
| Limpieza de pelusa y restos de hilo bajo la placa de aguja | cada turno / 8 h | 250,000 |
| Aceite en la pista de la lanzadera (rotary hook race) | cada 4–8 h de uso intenso | 125,000–250,000 |
| Aceite en el brazo cilíndrico (frente) | cada 8 h | 250,000 |
| Lubricación de barras de aguja | cada 40 h | 1,250,000 |
| Revisión de tensiones y cambio de agujas | según rotura / semanal | 1,250,000 |
| Revisión de correas, guías y engrase general | mensual | 5,000,000–7,000,000 |
| Servicio mayor / calibración | anual | 60,000,000–80,000,000 |

Estas cifras se cargan en `tarea_mantenimiento` con `intervalo_puntadas`, `intervalo_horas` o `intervalo_dias`, lo que aplique. El modelo acepta los tres disparadores porque hay tareas que sí son de calendario (revisión eléctrica, por ejemplo) y no deben esperar a que la máquina acumule uso.

## Mecánica del módulo

```
Para cada (máquina, tarea) en plan_mantenimiento:
    puntadas_desde_ultima = maquina.puntadas_acumuladas − plan.puntadas_ultima
    avance_pct = 100 × puntadas_desde_ultima / tarea.intervalo_puntadas

    si avance_pct ≥ tarea.aviso_pct  (por defecto 90 %)  → generar aviso
    si avance_pct ≥ 100                                  → generar orden_mantenimiento
    al completar la orden: plan.puntadas_ultima = maquina.puntadas_acumuladas
                           plan.fecha_ultima    = hoy
```

La vista `v_mantenimiento_pendiente` del esquema ya entrega el semáforo listo para la pantalla de mantenimiento.

El aviso al 90 % es lo que convierte el módulo en preventivo de verdad: da margen para programar el paro en un hueco de producción en vez de detener una máquina en plena entrega de temporada.

## Detalle que no se debe pasar por alto

`plan_mantenimiento.puntadas_ultima` guarda el valor del **acumulado del sistema**, no del panel de la máquina. Los paneles se reinician; el acumulado del sistema, no. Si el mantenimiento se anclara al número del panel, un reinicio borraría todo el historial de servicio de esa máquina. Es la razón por la que el esquema mantiene `maquina.puntadas_acumuladas` como suma de deltas validados y nunca como copia de la lectura cruda.

## Valor añadido casi gratuito

Con las mismas tablas se obtienen, sin trabajo adicional:

- **Costo de mantenimiento por máquina y por millón de puntadas** — permite decidir cuándo una máquina vieja ya no conviene.
- **Correlación entre roturas de hilo y proximidad al servicio** — los eventos de `evento_maquina` con tipo `rotura_hilo` cruzados con `avance_pct` suelen anticipar la necesidad de servicio antes de que el intervalo se cumpla.
- **Disponibilidad por máquina** — horas operativas contra horas de paro por mantenimiento, insumo directo del cálculo de OEE.
