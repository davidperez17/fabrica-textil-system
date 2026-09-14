# 07 · Catálogo de producto, temporadas e inventario

## Taxonomía del traje típico guatemalteco

El catálogo no puede ser una lista plana de "prendas". El traje tradicional es un conjunto de piezas con nombres propios, y cada pieza tiene identidad regional. El modelo lo refleja con `producto.tipo_prenda` y `producto.region_cultural`.

| Pieza | Qué es |
|---|---|
| **Huipil** (güipil) | Blusa de origen maya, tejida en telar, bordada con símbolos y elementos de la naturaleza propios de cada región. Es la pieza donde más se concentra el bordado y, por tanto, el trabajo de la fábrica. |
| **Sobrehuipil** | Se usa sobre el huipil en el traje ceremonial. |
| **Corte** | Falda que se envuelve en la cintura, formada por dos paneles unidos por una costura llamada **randa**. |
| **Faja** | Banda de unos 2 metros que ajusta el corte en la cintura. |
| **Tzute / sut** | Tela rectangular multiuso: cargar al bebé, cubrir la cabeza. |
| **Perraje / chalina** | Se coloca sobre los hombros. |
| **Tocoyal** | Cinta que se enrolla en la cabeza. |

La dimensión regional es de negocio, no decorativa: los diseños de Totonicapán, Sololá, Quetzaltenango, Chichicastenango, Nebaj o Patzún son productos distintos, con clientela distinta y con demanda ligada a fechas distintas. `diseno.region_cultural` y `producto.region_cultural` permiten reportar por región y detectar qué origen se vende mejor.

## Estacionalidad

La demanda de traje típico no es plana. El modelo la captura con la tabla `temporada`, que admite alcance nacional o de un municipio específico:

| Tipo de temporada | Cuándo | Nota para el modelo |
|---|---|---|
| `feria_patronal` | fecha propia de cada municipio, todo el año | Es la temporada más importante y la más fragmentada: cada localidad tiene su santo patrono y su fecha. Las ferias duran de 3 a 8 días y son motor de la economía artesanal local. Por eso `temporada` lleva `municipio` y `departamento`. |
| `semana_santa` | variable (marzo–abril) | Fecha móvil; el sistema debe permitir cargarla año por año, no calcularla. |
| `dia_madre` | 10 de mayo | Fecha fija. |
| `independencia` | 15 de septiembre | Pico nacional de uso de traje típico. |
| `graduaciones` | octubre–noviembre | Demanda de traje ceremonial. |
| `navidad` | diciembre | |
| `exportacion` | según cliente | Pedidos con fecha de embarque, no cultural. |
| `regular` | resto | Base de producción. |

Uso operativo: `producto_temporada.demanda_estimada` permite planear producción con anticipación. El reporte que importa es **"faltan N semanas para la feria de X, la orden va al M %"**, no un total anual.

## Órdenes de producción

`orden_produccion` es lo que conecta el catálogo con el piso. Su valor no es solo seguimiento: **acota el catálogo de diseños candidatos** para la verificación por puntadas (ver `03-verificacion-de-diseno.md`). Con 3–8 diseños vigentes en vez de 200, la inferencia pasa de inútil a confiable.

Un producto puede requerir varios diseños (cuello, mangas, pecho del huipil); lo modela `producto_diseno` con `piezas_por_prenda`. De ahí sale el conteo de puntadas teórico por prenda completa, que es la base del costeo.

## Inventario

Dos flujos distintos que comparten tablas:

**Materia prima.** Hilo, tela, agujas, entretela, avíos. El campo interesante es `articulo.consumo_por_mil_puntadas`: con él, una orden de producción proyecta automáticamente cuánto hilo va a necesitar, y el consumo real se descarga contra las puntadas efectivamente bordadas (`movimiento_inventario.tipo = 'consumo_produccion'`, ligado a `corrida_id`). Esa liga es la que permite comparar consumo teórico contra real y detectar desperdicio o merma anormal.

**Producto terminado.** Cada corrida verificada genera `prendas = repeticiones × cabezas`, que entran a la bodega de producto terminado. La cadena queda cerrada: puntadas → prendas → existencia → venta.

`existencia` mantiene el saldo por bodega y artículo; `movimiento_inventario` es el libro de todos los movimientos. El saldo siempre debe poder reconstruirse sumando movimientos: si no cuadra, hay un problema y el sistema debe poder demostrarlo.

## Facturación electrónica: dependencia a tener en cuenta

Si el sistema va a emitir documentos de venta, en Guatemala eso pasa obligatoriamente por el régimen **FEL (Factura Electrónica en Línea)** de la SAT. Desde 2023 es obligatorio para todo contribuyente con NIT activo que emita documentos tributarios, sin excepción por tamaño de empresa. Un documento tributario electrónico (DTE) no tiene validez fiscal si no lo valida previamente un **certificador autorizado** por la SAT.

Implicación de alcance: **la facturación no debe estar en la fase 1.** Requiere contratar un certificador, integrar su API y cumplir la documentación técnica del régimen FEL. Es un proyecto en sí mismo. La recomendación es dejar el inventario y el catálogo listos para alimentar facturación después, y no meter FEL en el alcance inicial.
