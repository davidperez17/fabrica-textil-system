# 09 · Riesgos, hoja de ruta y preguntas abiertas

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
| El protocolo de red del controlador resulta inaccesible | Alto | **Alta** | No depender de él. Fase 1 manual, fase 3 con sensor retrofit. La abstracción de `fuente` permite cambiar sin rehacer nada. |
| Captura manual manipulada para inflar el pago | Alto | Media | Verificación por diseño (una cifra inventada no cuadra con las puntadas esperadas), validación de delta contra capacidad física de la máquina, foto del panel, cotejo periódico contra el acumulado real del panel |
| Nómina mal calculada → contingencia laboral | **Muy alto** | Media | Séptimo día como 1/6 según Art. 126; complemento automático al mínimo; tarifa y parámetros legales versionados; período cerrable; revisión por contador antes de producción |
| La tarifa deja al operario bajo el mínimo de forma sistemática | Alto | **Alta** (la aritmética lo muestra) | Alerta temprana de proyección en la PWA y en el panel de RRHH; conversación con el cliente sobre recalibrar la tarifa |
| Rechazo de los operarios al sistema | Alto | Media | La PWA les muestra su ganancia en tiempo real. El sistema tiene que darles algo, no solo vigilarlos |
| Pérdida de datos por corte de red o energía | Alto | Media | Outbox en IndexedDB, gateway con almacenamiento local, idempotencia obligatoria |
| Contador del panel reiniciado | Medio | Alta | El acumulado lo lleva el sistema por deltas, nunca copiando el panel; deltas negativos se marcan para revisión |
| Fuga de datos personales (DPI, dirección) | Alto | Baja | Cifrado, control por rol, auditoría de accesos, retención definida |
| Alcance que crece hacia ERP completo | Medio | **Alta** | Fases cerradas con entregable útil cada una; FEL explícitamente fuera de la fase 1 |

## Hoja de ruta propuesta

### Fase 0 — Levantamiento en planta
Inventario de máquinas con marca, modelo, controlador, cabezas y velocidad. Fotos de los paneles. Recolección de los archivos de diseño. Entrevista con administración sobre nómina y con supervisión sobre el proceso actual. Respuestas a las preguntas bloqueantes.
**Entregable:** especificación cerrada y decisión sobre la vía de captura.

### Fase 1 — Núcleo con captura manual
Catálogo de máquinas, operarios (con validación de DPI), diseños (importados desde DST) y productos. Apertura y cierre de corridas desde la PWA. Verificación de diseño por puntadas. Reportes de producción por máquina, operario y fecha.
**Entregable:** el dato de producción deja de vivir en papel. Ya es útil por sí solo.

### Fase 2 — Nómina, inventario y mantenimiento
Cálculo de destajo con séptimo día y complemento al mínimo. Descuentos y bonificaciones. Cierre de período y constancias de pago. Inventario de materia prima y producto terminado. Mantenimiento preventivo por puntadas con avisos.
**Entregable:** el sistema sustituye las hojas de cálculo de planilla.

### Fase 3 — Automatización de la captura
Prueba de sensor retrofit en una máquina. Si funciona, despliegue al resto. Tiempo real, detección de paros, OEE.
**Entregable:** desaparece el tecleo, aparece la visibilidad en vivo.

### Fase 4 — Extensiones
Planeación por temporada con demanda estimada, costeo por prenda, y —si el negocio lo pide— facturación FEL con certificador.

## Criterio de éxito

El sistema funciona si, al cerrar una quincena, nadie tiene que abrir una hoja de cálculo para verificar un pago; y si un supervisor puede responder «¿cuánto produjo la máquina 4 la semana pasada y qué prendas eran?» en menos de un minuto y con confianza en la respuesta.
