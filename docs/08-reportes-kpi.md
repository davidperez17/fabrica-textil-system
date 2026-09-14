# 08 · Reportes e indicadores

## Principio

Todos los reportes se derivan de dos tablas de hechos: `corrida` (producción atribuida y verificada) y `lectura_contador` (serie cruda del contador). Nada se calcula dos veces por caminos distintos: si el reporte de nómina y el de producción dan cifras diferentes para el mismo período, el sistema perdió su razón de ser.

## Informes de puntadas por rango de fechas

Requerimiento del cliente: informes por fechas personalizadas, por día y por mes. La forma correcta es un solo motor de consulta con dimensiones y granularidad variables:

- **Granularidad**: hora, día, semana, mes, rango libre.
- **Dimensiones**: máquina, operario, diseño, producto, orden, temporada, turno.
- **Medidas**: puntadas, prendas, corridas, horas operativas, horas de paro, quetzales devengados.

Con las vistas `v_produccion_maquina_dia` y `v_produccion_operario_dia` como base, los reportes de día y de mes son agregaciones sobre lo mismo. Importa fijar la zona horaria: `America/Guatemala`, aplicada al convertir `timestamptz` a fecha. Un turno nocturno que cruza medianoche se atribuye al día de inicio del turno, no al día calendario, y esa regla debe estar escrita, no implícita.

## Indicadores por máquina

| Indicador | Cálculo | Para qué sirve |
|---|---|---|
| Producción total | Σ puntadas del período | Requerimiento directo del cliente |
| Prendas producidas | Σ (repeticiones × cabezas) | Producción real, distinta de puntadas |
| Disponibilidad | horas corriendo / horas programadas | Componente de OEE |
| Rendimiento | spm promedio real / spm nominal | Detecta máquinas corriendo lentas |
| Calidad | corridas `ok` / corridas totales | Componente de OEE desde la verificación |
| **OEE** | disponibilidad × rendimiento × calidad | Comparación entre máquinas y contra sí misma en el tiempo |
| Paros por causa | conteo y minutos de `evento_maquina` | Dónde se pierde el tiempo realmente |
| Puntadas por quetzal de mantenimiento | Σ puntadas / Σ costo de órdenes | Cuándo una máquina deja de convenir |

El OEE completo solo es posible con captura por sensor (fase 3); con captura manual se obtienen producción, prendas y calidad, que ya es la mayor parte del valor.

## Indicadores por operario

| Indicador | Nota |
|---|---|
| Puntadas del período | Base de pago |
| Ganancia devengada, con desglose | Destajo, séptimo día, complemento, bonificaciones, descuentos |
| Puntadas por hora efectiva | Comparable **solo entre operarios de máquinas equivalentes**; comparar una máquina de 1 cabeza con una de 12 no significa nada |
| Tasa de discrepancia | Corridas `discrepancia` / total. Alta y sostenida = problema de capacitación o de honestidad, y hay que distinguir cuál |
| Días trabajados | Insumo de nómina y de séptimo día |

Advertencia de uso: los indicadores por operario son insumo de nómina y de conversación, no un ranking para exhibir. Una tabla de posiciones pública en el piso convierte una herramienta de gestión en un problema de clima laboral, y en un incentivo a manipular la captura manual.

## Reportes obligatorios por ley

- **Libro de salarios** autorizado y sellado por el Departamento Administrativo del Ministerio de Trabajo (Art. 102 del Código de Trabajo, exigible con 10 o más trabajadores permanentes). Con 3 a 9 trabajadores, planillas según el modelo del IGSS.
- **Planilla del IGSS**, con cuota laboral de 4.83 % y patronal de 12.67 %.
- **Constancia de pago por trabajador** con el desglose completo del destajo, el séptimo día y el complemento al mínimo cuando exista. Es la evidencia que protege a la empresa en una inspección.

Estos tres salen del mismo `nomina_detalle`; no deben ser hojas de cálculo aparte.

## Alertas operativas

Los reportes se leen cuando alguien decide leerlos; las alertas llegan solas. Las que valen la pena:

| Alerta | Umbral sugerido |
|---|---|
| Operario por debajo del mínimo proyectado | En cualquier momento del período, si la proyección no alcanza el umbral de 2,453,721 puntadas quincenales |
| Corrida con discrepancia | Inmediata al cerrar la corrida |
| Máquina detenida sin evento de paro registrado | > 15 minutos sin pulsos (solo con sensor) |
| Mantenimiento al 90 % del intervalo | Automática desde `v_mantenimiento_pendiente` |
| Existencia bajo el mínimo | `existencia.cantidad < articulo.stock_minimo` |
| Orden de producción en riesgo | Avance proyectado < 100 % a la fecha de compromiso |
| Período de nómina con corridas sin resolver | Al intentar cerrar el período |
