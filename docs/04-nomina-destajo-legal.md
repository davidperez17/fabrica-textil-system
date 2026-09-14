# 04 · Nómina a destajo y cumplimiento legal (Guatemala)

> Este documento resume la investigación normativa aplicable al cálculo. No es asesoría legal. Antes de producción, la parametrización debe revisarla un abogado laboralista guatemalteco o el contador de la empresa.

## Marco legal aplicable

| Norma | Contenido relevante |
|---|---|
| Código de Trabajo, Art. 88 b) | El salario puede pactarse **por unidad de obra: por pieza, tarea, precio alzado o a destajo**. El esquema de Q1 / 1,500 puntadas es legal. |
| Código de Trabajo, Art. 91 | El monto pactado **no puede ser inferior al salario mínimo**. |
| Código de Trabajo, Art. 92 | Plazo máximo de pago: **una quincena** para trabajadores manuales. |
| Código de Trabajo, Art. 93 | El salario se liquida completo en cada período; incluye el equivalente a jornada ordinaria y extraordinaria también en el caso del Art. 88 b). |
| Código de Trabajo, Art. 103 | La fijación del salario mínimo debe tomar en cuenta si se paga por unidad de obra, «adoptando las medidas necesarias para que no salgan perjudicados los trabajadores que ganan por pieza, tarea, precio alzado o a destajo». |
| Código de Trabajo, Art. 116 | Jornada diurna: máximo 8 h diarias y 48 h semanales; la labor diurna normal semanal es de 45 h efectivas. |
| Código de Trabajo, Art. 121 | Trabajo fuera de jornada = extraordinario, con recargo de **al menos 50 %**. |
| Código de Trabajo, Art. 126 | Día de descanso semanal remunerado. **A quienes laboran por unidad de obra se les adiciona una sexta parte de los salarios totales devengados en la semana.** |
| Código de Trabajo, Art. 127 | Días de asueto pagados: 1 enero; jueves, viernes y sábado santos; 1 mayo; 30 junio; 15 septiembre; 20 octubre; 1 noviembre; 24 diciembre (medio día desde las 12); 25 diciembre; 31 diciembre (medio día desde las 12); y el día de la fiesta de la localidad. |
| Código de Trabajo, Art. 130 | Vacaciones: mínimo **15 días hábiles** por año continuo. |
| Código de Trabajo, Art. 102 | Con 10 o más trabajadores permanentes: **libro de salarios autorizado** por el Ministerio de Trabajo. Con 3 a 9: planillas según modelo del IGSS. |
| Acuerdo Gubernativo 256-2025 | Salarios mínimos vigentes del 1 de enero al 31 de diciembre de 2026. |
| Decreto 78-89 | Bonificación incentivo de **Q250 mensuales**; no integra el salario para prestaciones ni cotiza al IGSS. |
| Decreto 76-78 y Decreto 42-92 | Aguinaldo y Bono 14: un salario mensual cada uno. |

## Salarios mínimos 2026 (AG 256-2025, vigentes desde el 01/01/2026)

| Circunscripción | Categoría | Salario base | + Bonificación | Total mensual |
|---|---|---:|---:|---:|
| CE1 (dpto. Guatemala) | Agrícola | Q3,791.20 | Q250.00 | Q4,041.20 |
| CE1 | No agrícola | Q4,002.28 | Q250.00 | Q4,252.28 |
| CE1 | Exportadora y de maquila | Q3,409.73 | Q250.00 | Q3,659.73 |
| CE2 (resto del país) | Agrícola | Q3,625.89 | Q250.00 | Q3,875.89 |
| CE2 | **No agrícola** | **Q3,816.90** | Q250.00 | Q4,066.90 |
| CE2 | Exportadora y de maquila | Q3,221.10 | Q250.00 | Q3,471.10 |

La circunscripción se determina por el lugar del centro de trabajo. Una fábrica de típicos fuera del departamento de Guatemala cae en **CE2**. La categoría **no agrícola** aplica salvo que la empresa esté formalmente acogida al régimen de maquila y exportación, en cuyo caso el mínimo baja a Q3,221.10; esa clasificación hay que confirmarla con el contador porque cambia todos los cálculos.

Estos montos son parámetros versionados en la tabla `parametro_legal`, nunca constantes en código: cambian cada año por acuerdo gubernativo.

## Cargas sociales

| Concepto | Tasa | Sobre |
|---|---:|---|
| IGSS cuota laboral (descuento al trabajador) | 4.83 % | salario ordinario y extraordinario |
| IGSS cuota patronal | 10.67 % | ídem |
| INTECAP | 1.00 % | ídem |
| IRTRA | 1.00 % | ídem |
| **Total patronal** | **12.67 %** | |

La bonificación incentivo de Q250 no forma parte de la base de cotización.

ISR: un operario en el rango del salario mínimo queda por debajo de la deducción personal anual de Q48,000, por lo que normalmente no genera retención. El sistema debe contemplar el cálculo de todos modos para casos de alta producción.

## Aritmética de la tarifa Q1 / 1,500 puntadas

Tarifa unitaria: **Q0.00066667 por puntada**.

Puntadas necesarias para igualar el salario mínimo base CE2 no agrícola (Q3,816.90), **solo con destajo, sin contar el séptimo día**:

| Base | Puntadas |
|---|---:|
| Al mes | 5,725,350 |
| Por día (26 días laborados) | 220,206 |
| Por hora (jornada de 8 h) | 27,526 |
| **Por minuto sostenido** | **459** |

Incluyendo el séptimo día del Art. 126 (+1/6), el umbral real baja:

| Base | Puntadas |
|---|---:|
| Por quincena | 2,453,721 |
| Por día (13 días laborados) | 188,748 |
| Por hora | 23,593 |
| **Por minuto sostenido** | **393** |

### Contraste con la capacidad real de la máquina

| Velocidad | Eficiencia | Puntadas/hora | Puntadas/mes (8 h × 26 d) | Destajo mensual |
|---:|---:|---:|---:|---:|
| 650 spm | 70 % | 27,300 | 5,678,400 | Q3,785.60 |
| 750 spm | 70 % | 31,500 | 6,552,000 | Q4,368.00 |
| 850 spm | 70 % | 35,700 | 7,425,600 | Q4,950.40 |
| 1,000 spm | 70 % | 42,000 | 8,736,000 | Q5,824.00 |

Lectura: **la tarifa está calibrada al filo del salario mínimo para una máquina de gama baja.** A 650 spm y 70 % de eficiencia el destajo puro (Q3,785.60) queda por debajo del mínimo base; solo el séptimo día lo salva. Una caída de eficiencia al 60 % obliga a complemento patronal casi con certeza.

Esto tiene dos consecuencias de producto:

1. El complemento al mínimo **no es un caso excepcional**, es un cálculo de rutina. Debe estar automatizado y visible.
2. El sistema es, de hecho, una herramienta de defensa ante una inspección del Ministerio de Trabajo: demuestra período por período que ningún trabajador quedó bajo el mínimo.

## Algoritmo de liquidación quincenal

```
destajo        = puntadas_del_periodo / puntadas_por_quetzal
septimo_dia    = destajo / 6                             (Art. 126)
devengado      = destajo + septimo_dia
minimo_periodo = salario_minimo_mensual / 2
complemento    = max(0, minimo_periodo − devengado)      (Art. 91)
base           = devengado + complemento                 ← base de IGSS y prestaciones
bonificacion   = 250 / 2                                 (Dto. 78-89, fuera de base)
igss_laboral   = base × 4.83 %
bruto          = base + bonificacion + bonificaciones_extra
neto           = bruto − igss_laboral − descuentos
costo_patronal = base × 1.1267 + bonificacion + provisiones
```

Provisiones incluidas en el costo patronal: aguinaldo 8.33 %, Bono 14 8.33 %, vacaciones 4.17 % (15 días hábiles), indemnización 8.33 %. Total de sobrecosto aproximado sobre la base: **41.8 %**.

## Casos calculados

Con `tools/nomina.py`, categoría CE2 no agrícola, quincena:

| Puntadas | Destajo | Séptimo día | Complemento | Base | Bonif. | IGSS | **Neto** | Costo patronal |
|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| 1,200,000 | Q800.00 | Q133.33 | **Q975.12** | Q1,908.45 | Q125.00 | Q92.18 | **Q1,941.27** | Q2,831.88 |
| 2,000,000 | Q1,333.33 | Q222.22 | **Q352.89** | Q1,908.45 | Q125.00 | Q92.18 | **Q1,941.27** | Q2,831.88 |
| 2,453,721 | Q1,635.81 | Q272.64 | Q0.00 | Q1,908.45 | Q125.00 | Q92.18 | **Q1,941.27** | Q2,831.88 |
| 3,000,000 | Q2,000.00 | Q333.33 | Q0.00 | Q2,333.33 | Q125.00 | Q112.70 | **Q2,345.63** | Q3,434.52 |
| 4,500,000 | Q3,000.00 | Q500.00 | Q0.00 | Q3,500.00 | Q125.00 | Q169.05 | **Q3,455.95** | Q5,089.05 |
| 6,000,000 | Q4,000.00 | Q666.67 | Q0.00 | Q4,666.67 | Q125.00 | Q225.40 | **Q4,566.27** | Q6,743.73 |

Nótese el efecto de meseta en las tres primeras filas: por debajo del umbral, producir más **no aumenta el pago**, solo reduce el complemento que paga el patrono. Es un problema de incentivos real, no un defecto del cálculo. Si la fábrica quiere que el destajo motive, la tarifa tiene que dejar al operario promedio claramente por encima del mínimo, no encima del filo.

## Descuentos y bonificaciones

La tabla `concepto` cataloga ambos con tres campos que evitan problemas:

- `clase`: bonificación o descuento.
- `tope_pct_salario`: los descuentos por anticipos, préstamos o pérdida de material tienen límites; el sistema debe impedir que un descuento deje el neto por debajo del mínimo protegido.
- `requiere_autorizacion`: todo descuento queda con `autorizado_por` y sello de tiempo en `movimiento_nomina`. Sin trazabilidad, un descuento es una disputa laboral esperando ocurrir.

## Requisitos de auditoría no negociables

1. **La tarifa se versiona** (`tarifa_destajo` con `vigente_desde` / `vigente_hasta`). Recalcular una quincena de hace seis meses debe dar exactamente lo que se pagó.
2. **Los parámetros legales se versionan** (`parametro_legal`). El salario mínimo de 2026 no puede sobrescribir al de 2025 en los históricos.
3. **El período se cierra** (`periodo_nomina.estado`). Una vez pagado, no se editan corridas de ese rango; las correcciones van como ajuste al período siguiente.
4. **Toda corrida en estado `discrepancia` bloquea el cierre** hasta que un supervisor la resuelva. Pagar sobre datos no verificados es el peor escenario posible para el módulo.
