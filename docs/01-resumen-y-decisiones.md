# 01 · Resumen ejecutivo y decisiones críticas

Fecha de la investigación: 7 de septiembre de 2026.
Estado: investigación previa al diseño. Nada de esto está validado todavía en el piso de planta.

## Qué se quiere construir

Un sistema de administración para una fábrica de bordado de trajes típicos guatemaltecos que cubra:

| Módulo | Función |
|---|---|
| Captura de puntadas | Leer el contador de cada máquina y convertirlo en producción atribuible |
| Verificación de diseño | Confirmar qué prenda se bordó, ya que la máquina no lo reporta |
| Producción | Total por máquina, por operario, por orden, por período |
| Nómina a destajo | Q1 por cada 1,500 puntadas, con cumplimiento del Código de Trabajo |
| Operarios | Registro por DPI, dirección, teléfono; PWA para el trabajador |
| Catálogo | Productos por temporada (ferias patronales, Semana Santa, graduaciones) |
| Inventario | Materia prima (hilo, tela) y prenda terminada |
| Mantenimiento | Preventivo disparado por puntadas acumuladas |

## Los cinco hallazgos que condicionan todo el diseño

### 1. El contador de la máquina cuenta puntadas del diseño, no prendas

En una bordadora multicabezal todas las cabezas comparten un solo eje principal. Una vuelta del eje = una puntada en cada cabeza, simultáneamente. El contador del panel avanza una sola vez.

Consecuencia directa: **una máquina de 6 cabezas produce 6 prendas con el mismo conteo de puntadas que una de 1 cabeza produce 1.** Si se paga Q1 por cada 1,500 puntadas del contador, el operario de la máquina de 6 cabezas gana lo mismo que el de 1 cabeza mientras entrega seis veces más producto.

Esto no es un detalle de implementación: define si la tarifa es justa y si el sistema mide producción o mide esfuerzo. **Es la pregunta número uno para el cliente** (ver `09-riesgos-roadmap-preguntas.md`).

El sistema debe registrar `cabezas` por máquina y calcular **dos** magnitudes separadas:
- `puntadas` — lo que marca el contador; base de pago actual.
- `prendas` = repeticiones × cabezas; base de producción real y de costeo.

### 2. La tarifa de Q1 / 1,500 puntadas está calibrada para una sola cabeza

Con el salario mínimo no agrícola CE2 de 2026 (Q3,816.90 mensuales), un operario necesita **5,725,350 puntadas al mes** para igualarlo solo con destajo, equivalente a **393 puntadas por minuto sostenidas** durante toda la jornada.

Una bordadora que corre a 650–850 spm con 60–70 % de eficiencia real produce entre 23,400 y 35,700 puntadas por hora. Es decir: la tarifa deja al operario justo alrededor del salario mínimo. No hay margen. Cualquier caída de eficiencia (roturas de hilo, cambios de bastidor, falta de material) lo empuja por debajo y **obliga al patrono a completar la diferencia**.

El sistema debe calcular ese complemento automáticamente y alertarlo, no descubrirlo en una inspección.

### 3. Identificar el diseño solo por puntadas no funciona sobre acumulados; sí funciona sobre corridas

Se probó numéricamente (`tools/verificar_diseno.py`):

| Escenario | Candidatos compatibles |
|---|---|
| Acumulado de turno (1,000,000 puntadas), 5 diseños, tolerancia 2 % | 11 |
| Acumulado de turno, 200 diseños, tolerancia 2 % | 390 |
| Acumulado de turno, 200 diseños, tolerancia 0.5 % | 100 |
| Corrida cerrada de un diseño (42,500 puntadas), tolerancia 0.5 % | 1 |

La conclusión es tajante: el conteo de puntadas **verifica** una declaración, no la sustituye. El operario debe declarar el diseño (escaneando un QR en la PWA) y el sistema compara lo medido contra lo esperado. Por eso el requerimiento del cliente está bien planteado como *verificación* de código de diseño.

Requisito derivado: el sistema **tiene que capturar corridas** (inicio y fin de cada diseño), no solo totales de turno. Si solo se captura el total del día, el módulo de verificación no puede existir.

### 4. El séptimo día del trabajo a destajo es una sexta parte, no una séptima

Artículo 126 del Código de Trabajo, texto literal:

> «A quienes laboran por unidad de obra o por comisión, se les adicionará una sexta parte de los salarios totales devengados en la semana.»

Es +16.67 % sobre lo devengado a destajo cada semana. Es un error de nómina frecuente y caro. Está implementado en `tools/nomina.py`.

### 5. La captura de datos de las máquinas es el riesgo técnico principal

Los controladores usados en este segmento (Dahao BECS en máquinas chinas; Tajima, Barudan, SWF en máquinas de marca) tienen función de red documentada en sus manuales, pero el protocolo es **propietario y no está publicado**. No se puede diseñar el sistema asumiendo que se va a poder leer el contador por red.

La arquitectura debe tratar el origen del dato como intercambiable, con cuatro implementaciones posibles (captura manual, sensor retrofit, red del panel, archivo exportado) detrás de una sola interfaz. Detalle en `02-captura-de-puntadas.md`.

## Recomendación de enfoque

Arrancar por el **camino manual con verificación**, que no depende de ninguna integración y ya entrega el 80 % del valor:

1. El operario abre corrida en la PWA: escanea QR de máquina y QR de diseño, teclea el contador inicial del panel.
2. Al terminar, teclea el contador final y las repeticiones.
3. El sistema verifica puntadas medidas contra esperadas, calcula prendas, alimenta nómina, producción y mantenimiento.

Sobre esa base, el sensor retrofit (fase 3) elimina el tecleo y cierra el hueco de confianza sin cambiar el modelo de datos.
