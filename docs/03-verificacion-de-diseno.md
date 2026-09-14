# 03 · Verificación del código de diseño

## El problema, planteado con precisión

La máquina reporta puntadas. No reporta prenda. Se quiere saber qué se bordó.

Cada diseño de bordado es un archivo (normalmente DST de Tajima, formato que lee alrededor del 95 % de las máquinas comerciales) cuyo encabezado de 512 bytes declara, entre otros campos, el total de puntadas (`ST`) y el número de cambios de color (`CO`). Ese número es una **firma estable**: bordar el diseño HUI-001 siempre consume ~42,500 puntadas del contador.

La tentación es invertir la relación: dado un conteo, deducir el diseño. Se probó y no funciona.

## Por qué la inferencia pura falla

Con un catálogo de *N* diseños y hasta *R* repeticiones, el conjunto de valores alcanzables `{n × S_d}` es denso. Sobre un acumulado grande, cualquier cifra cae dentro de la tolerancia de muchísimas combinaciones.

Medición (script `tools/verificar_diseno.py`, catálogo simulado de 200 diseños entre 4,000 y 60,000 puntadas):

| Conteo medido | Repeticiones consideradas | Tolerancia | Candidatos |
|---:|---:|---:|---:|
| 1,000,000 | hasta 300 | 2.0 % | 390 |
| 1,000,000 | hasta 300 | 0.5 % | 100 |
| 12,000 | 1 | 2.0 % | 2 |
| 12,000 | 1 | 0.5 % | 0–1 |

Y con un catálogo pequeño de 5 diseños, el acumulado de turno de 1,000,000 puntadas todavía admite 11 combinaciones distintas. La inferencia sobre acumulados no es un problema de afinar la tolerancia; es un problema de espacio de soluciones.

## El diseño correcto: declarar y verificar

```
1. El operario escanea el QR de la máquina.
2. El operario escanea el QR del código de diseño (impreso en la hoja de ruta
   o en el bastidor). La PWA muestra el nombre y la foto del diseño para
   confirmación visual.
3. El operario teclea el contador inicial. Abre la corrida.
4. Al terminar, teclea el contador final y las repeticiones.
5. El sistema compara:
       esperado = diseno.puntadas × repeticiones
       medido   = contador_fin − contador_inicio
       desviación = (medido − esperado) / esperado
```

Veredictos:

| Desviación | Veredicto | Acción |
|---|---|---|
| ≤ 0.5 % | `ok` | Corrida aceptada, entra a nómina y producción |
| ≤ 3 % | `revisar` | Se acepta pero queda marcada; el supervisor la ve en su bandeja |
| > 3 % | `discrepancia` | Requiere resolución antes de cerrar el período de nómina |
| sin diseño declarado | `sin_declarar` | Producción contabilizada, prenda desconocida |

La desviación esperada es **positiva y pequeña**: cuando se rompe el hilo, la máquina retrocede y repite puntadas, lo que suma al contador sin producir bordado nuevo. Una desviación negativa grande significa que el diseño se abortó a medias; una positiva grande, que se bordó otra cosa o que las repeticiones declaradas están mal.

## Cuándo sí sirve la inferencia

Sobre una **corrida cerrada de un solo diseño**, el conteo identifica bien (0–1 candidatos con tolerancia de 0.5 %). Usos legítimos:

- **Rescate de corridas sin declarar**: proponer al supervisor el diseño más probable en vez de perder el dato.
- **Segunda señal de verificación**: si el operario declaró HUI-001 pero el conteo coincide mejor con HUI-002, se levanta una alerta aunque la desviación contra lo declarado esté dentro de tolerancia.
- **Auditoría retroactiva** de datos históricos capturados sin código de diseño.

Nunca como fuente primaria de verdad.

## Señales adicionales para desempatar

Cuando el conteo por sí solo deja varios candidatos, hay más firmas disponibles sin costo extra:

| Señal | De dónde sale | Poder discriminante |
|---|---|---|
| Cambios de color | campo `CO` del DST y eventos del sensor | alto: dos diseños con igual conteo rara vez tienen igual número de paradas de color |
| Tiempo de ciclo | `puntadas / spm` esperado vs. duración real | medio |
| Orden de producción abierta | qué se está fabricando esa semana | alto: acota el catálogo de cientos a unos pocos |
| Máquina | ciertos diseños solo corren en ciertas máquinas | medio |
| Historial del operario | qué suele bordar | bajo, solo para ordenar candidatos |

Acotar por orden de producción abierta es la mejora más barata y la de mayor efecto: reduce el catálogo candidato de 200 diseños a los 3–8 vigentes.

## Catalogación de diseños

El alta de un diseño no debe ser manual. `tools/dst_info.py` lee el archivo DST y extrae la firma completa sin dependencias externas:

```
$ python3 tools/dst_info.py HUIPIL-SOLOLA.dst
{
  "nombre_encabezado": "HUIPIL-TEST",
  "puntadas_encabezado": 1000,
  "puntadas_contadas": 1000,
  "saltos": 0,
  "cambios_color_contados": 2,
  "cambios_color_encabezado": 2,
  "ancho_mm": 100.1,
  "alto_mm": 100.1,
  "sha256": "1ee2a19b..."
}
```

Dos controles importantes en el alta:

1. **Comparar `ST` del encabezado contra el conteo real de registros.** Si difieren, el archivo fue editado y el encabezado quedó desactualizado; la firma buena es la contada.
2. **Guardar el `sha256`.** Si alguien reemplaza el archivo del diseño sin cambiar el código, el hash lo delata y todas las corridas anteriores de ese código quedan invalidadas para efectos de verificación. Por eso `diseno` lleva `version` y clave única `(codigo, version)`.
