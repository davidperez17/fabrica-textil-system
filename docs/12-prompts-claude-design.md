# 12 · Prompts para Claude Design

Prompts listos para copiar. Se apoyan en el [brief de diseño](11-brief-de-diseno.md), que es
donde viven los tokens completos, la matriz de permisos y los datos de ejemplo.

## Cómo usarlos

1. **Pegar primero el prompt base (§1).** Establece el sistema de diseño y los datos de la
   fábrica. Sin él, cada lote saldrá con una identidad distinta.
2. **Luego un lote a la vez (§2).** Cada lote produce un lienzo con varias mesas de trabajo
   relacionadas. No pedir los catorce de golpe: la calidad cae y las pantallas dejan de
   parecerse entre sí.
3. **Refinar con §3** cuando el lote ya esté aprobado.

Regla que conviene repetir en cada lote: **datos reales, nunca texto de relleno.** Los nombres,
códigos de máquina, cifras de puntadas y montos en quetzales del prompt base son los que deben
aparecer en todas las pantallas, siempre iguales.

---

## §1 · Prompt base

> Pegar al inicio de cada sesión de diseño, antes de cualquier lote.

```
Vas a diseñar la interfaz de un sistema de administración para una fábrica de bordado
computarizado de trajes típicos guatemaltecos, ubicada en Totonicapán.

El sistema tiene dos superficies distintas que comparten el mismo sistema de diseño:
un PANEL DE ADMINISTRACIÓN de escritorio, denso en datos, para el dueño y su equipo;
y una PWA MÓVIL de piso de planta, con muy pocos elementos y muy grandes, para los
operarios que están junto a la máquina. No son la misma pantalla en dos anchos.

DIRECCIÓN VISUAL: MINIMALISMO

El estilo es minimalista, y aquí eso no significa vacío ni bonito: significa que cada
elemento tiene que ganarse su lugar, y el criterio para ganárselo es que ayude a
decidir algo.

  · El dato es la interfaz. La cifra, no el contenedor. Un tablero es una retícula de
    números bien compuestos, no una cuadrícula de tarjetas.
  · El espacio separa antes que la línea, y la línea antes que la caja. Primero aire.
    Si no alcanza, una hairline de 1px. La caja con relleno y borde es el último
    recurso y hay que justificarla.
  · Un solo acento: el índigo marca-700. Todo lo demás es tinta y neutros. Los colores
    semánticos aparecen solo cuando hay algo que atender.
  · La jerarquía la hace la tipografía: tamaño, peso y espacio. No fondos de color, no
    bordes de énfasis, no barras de acento al costado.
  · Nada compite con la alerta. Si la pantalla está tranquila, una sola mancha de color
    crítico se ve desde la puerta.

Consecuencias concretas:
  · Los encabezados de tabla NO llevan fondo gris: llevan línea inferior y mayúscula
    pequeña en Plex Mono.
  · Las píldoras de estado NO llevan relleno de color: llevan su forma coloreada y el
    texto en tinta normal.
  · El tablero NO usa tarjetas: retícula con hairlines y mucho aire.
  · Radios: 2px en controles, 0 en tablas y contenedores. Ningún redondeo completo.
  · Espaciado en el extremo alto de la escala: 56px entre bloques, 96px entre secciones.
  · Iconos reducidos a los indispensables: las cinco formas de estado de máquina y poco más.

Lo que el minimalismo NO autoriza: bajar el contraste, esconder acciones en menús,
quitar etiquetas de los campos, ni encoger los objetivos táctiles de la PWA.

SISTEMA DE DISEÑO

Color, tema claro:
  fondo #F4F5F7 · superficie #FFFFFF · superficie-2 #EDEFF3
  tinta #14171C · tinta-2 #565D68 · tinta-3 #858D99
  línea #D9DDE4 · línea-suave #E8EBF0
  marca-700 #2B3A67 (primario) · marca-900 #1B2A4A (hover)
  marca-500 #4A63A8 · marca-100 #E3E8F4

Color, tema oscuro:
  fondo #101318 · superficie #171B21 · superficie-2 #1E232B
  tinta #E8EAEE · tinta-2 #9BA3AF · tinta-3 #6C7480
  línea #2A3039 · línea-suave #21262E
  marca-700 #8FA6DE · marca-900 #B3C4EC · marca-500 #6E86C4 · marca-100 #1E2740

Semánticos (claro / oscuro), independientes del acento:
  ok #2E6F4E / #6FBF8E · fondo suave #E2F0E7 / #17301F
  aviso #9A6400 / #E0A63C · fondo suave #F7EDD9 / #33270F
  crítico #B0322B / #E4837A · fondo suave #F7E4E2 / #3A2523

Estado de máquina, cada uno con color Y forma:
  corriendo = ok, punto lleno · parada = aviso, punto lleno
  en falla = crítico, triángulo · en mantenimiento = #6D4C9F, cuadrado
  sin datos = tinta-3, punto hueco

Tipografía:
  Interfaz: Source Sans 3 (400/600/700)
  Datos: IBM Plex Mono (400/500/600) con tabular-nums, para toda cifra:
  puntadas, quetzales, códigos, DPI, horas, porcentajes
  Escala: 11 12 14 16 18 21 26 32 42
  Etiquetas en mayúscula: 11px, Plex Mono 500, letter-spacing .1em

Forma y espacio:
  Espaciado base 4: 4 8 12 16 20 24 32 40 56 72
  Radios: 2px en controles y tablas, 4px en contenedores grandes,
  redondeo completo SOLO en píldoras de estado. Ninguna esquina muy redondeada.
  Elevación: una sola sombra en todo el producto, solo para menús y modales.
  Los objetos se separan con línea de 1px, no con sombra.
  Foco de teclado: contorno 2px marca-700, siempre visible.

Densidad:
  Escritorio: fila de tabla 40px, control 34px, texto base 14px, margen 24px
  PWA: fila 64px, control 56px, botón primario 72px, texto base 17px, margen 16px

MOVIMIENTO

En una pantalla quieta, lo único que se mueve es lo único que mira la gente. Poca
animación, y toda ella significa algo. Una animación se justifica solo si comunica
estado, causa o continuidad.

Tokens:
  --dur-instante   90ms    retroalimentación al pulsar
  --dur-rapido    140ms    chips, avisos, menús
  --dur-base      200ms    cambio de estado, paneles
  --dur-pausado   320ms    barras que crecen, paso a paso
  --dur-cifra     420ms    conteo animado de una cifra
  --dur-ambiente 2400ms    pulsos de "esto está vivo"
  --sal    cubic-bezier(.2,0,0,1)    curva por defecto
  --ent    cubic-bezier(.4,0,1,1)    salidas
  --suave  cubic-bezier(.4,0,.2,1)   ambiental

Reglas duras: ningún rebote, ninguna escala mayor a 1.02, ninguna rotación decorativa,
ningún desplazamiento mayor a 8px, nada dura más de 420ms fuera de lo ambiental.

Estado de máquina: el movimiento ES un dato, junto al color y a la forma.
  Corriendo         punto lleno · pulso de opacidad 1 → .45 → 1, 2.4s, infinito.
                    En la versión avanzada el ciclo se deriva de las puntadas por
                    minuto reales: más rápida la máquina, más rápido el latido,
                    acotado entre 1.2s y 3s.
  Parada            punto lleno · NINGUNA animación. La quietud es la señal.
  En falla          triángulo · doble parpadeo de 120ms y luego 3s de reposo.
                    Nunca parpadeo continuo.
  En mantenimiento  cuadrado · barrido diagonal lento de un brillo tenue, 3s.
  Sin datos         punto hueco · desvanecimiento muy lento 1 → .35 → 1, 4s.

Componentes:
  Contador de puntadas   cuenta del valor anterior al nuevo, 420ms, con tabular-nums
                         para que el ancho no salte. Solo al llegar dato nuevo.
  Barra de mínimo legal  crece desde 0 al aparecer, 320ms; destello único en la marca
                         del umbral al cruzarlo.
  Semáforo de mtto.      late suave cada 4s solo por encima del 90% del intervalo.
  Chip de verificación   cruza de pendiente a veredicto con opacidad y 4px.
  Fila de tabla          entra con opacidad y 4px; al cambiar de estado su fondo
                         destaca 600ms y vuelve.
  Franja de alerta       entra desde arriba 8px; al resolverse colapsa su altura.
  Botón                  cambio de fondo al pulsar, sin escala ni sombra.
  Modal y panel          el panel entra 8px, sin escala.
  Carga                  esqueleto con barrido de 1.4s. NUNCA un indicador giratorio.

PWA:
  Marco de escaneo       respira 2s; al leer el código colapsa al centro en 180ms,
                         con sonido y vibración.
  Pasos de la corrida    avance lateral de 8px más opacidad entre máquina, diseño y
                         contador. Es la única transición de pantalla del sistema.
  Teclado numérico       cada dígito responde con cambio de fondo de 90ms, sin escala.
  Ganancia del día       la cifra cuenta hacia arriba al llegar una corrida nueva.
  Cola sin conexión      el contador de pendientes baja con un desplazamiento corto por
                         cada envío. Nunca un spinner.

NO se anima: transiciones entre pantallas del panel, aparición escalonada de listas,
nada disparado por desplazamiento de la página, números que cuentan solos al abrir una
pantalla, ni nada en las pantallas de nómina salvo la entrada de un aviso.

Con prefers-reduced-motion los pulsos se detienen y el estado sigue distinguiéndose por
color y forma; los conteos saltan al valor final; las barras aparecen en su valor.
Ninguna información depende únicamente del movimiento.

PRINCIPIOS

1. El número es el protagonista. Cifras en monoespaciada, tabular, alineadas a la
   derecha, con separador de miles y SIN abreviar nunca. Se escribe 5,725,350,
   jamás "5.7M".
2. Puntadas y prendas son magnitudes distintas y nunca comparten columna: una
   máquina de 6 cabezas produce 6 prendas con el mismo conteo de puntadas que una
   de 1 cabeza produce 1.
3. El estado se ve antes de leerse, a un metro de distancia, por color Y forma.
4. La planta tiene mala luz y sol directo: contraste alto obligatorio.
5. Sin conexión es normal, no un error.
6. Todo lo que toca dinero exige confirmación explícita y queda firmado con nombre
   y hora, visible en la misma pantalla.
7. Nada de tarjetas por defecto: se separa con línea de 1px.

QUÉ EVITAR

Terracota sobre crema, degradados morado-azul, Inter o Space Grotesk, emoji como
marcadores de sección, todo centrado, esquinas muy redondeadas, tarjetas con barra
de acento a la izquierda. Nada de patrones de huipil como textura de fondo: el
textil es el producto, no la decoración del software. Ninguna ilustración simpática
en pantallas de dinero. Ningún movimiento decorativo: sin rebotes, sin parallax, sin
aparición escalonada, sin spinners.

DATOS REALES — usar estos exactos en todas las pantallas

Fábrica en Totonicapán, circunscripción CE2, categoría no agrícola.
Salario mínimo Q3,816.90 más bonificación incentivo Q250.00.
Tarifa de destajo vigente: 1,500 puntadas = Q1.00, desde el 1 de enero de 2026.

Operarios (código, nombre, máquina asignada, puntadas de la quincena):
  OP-014 Juana Ixchop Tzoc — BOR-04 — 2,918,400
  OP-021 Marta Chocoj Sical — BOR-02 — 3,412,700
  OP-007 Diego Puac Ajanel — BOR-01 y BOR-06 — 4,105,220
  OP-033 Rosa Elena Batz Quiej — BOR-05 — 1,884,900  ← bajo el umbral legal
  OP-018 Manuel Tzunún Coyoy — BOR-03 — 2,451,180

Máquinas (código, modelo, controlador, cabezas, spm, estado):
  BOR-01 Feiya FY-1206 · Dahao BECS-A15 · 6 cabezas · 850 spm · corriendo
  BOR-02 Feiya FY-1206 · Dahao BECS-A15 · 6 cabezas · 850 spm · corriendo
  BOR-03 Ricoma EM-1010 · 1 cabeza · 1,000 spm · parada
  BOR-04 Tajima TMEZ-1501 · 1 cabeza · 1,000 spm · corriendo
  BOR-05 Yuemei YM-904 · Dahao BECS-285A · 4 cabezas · 750 spm · en falla
  BOR-06 Feiya FY-1202 · Dahao BECS-A15 · 2 cabezas · 800 spm · corriendo
  BOR-07 Barudan BEXT-Y904 · 4 cabezas · 900 spm · en mantenimiento
  BOR-08 Richpeace RPEM-1201 · Dahao BECS-A18 · 1 cabeza · 900 spm · sin datos

Diseños (código, nombre, puntadas, cambios de color):
  HUI-001 Huipil Sololá cuello grande — 42,500 — 9
  HUI-002 Huipil Quetzaltenango aves — 38,900 — 11
  TZU-004 Tzute Chichicastenango — 21,300 — 7
  FAJ-010 Faja Totonicapán greca — 12,400 — 5
  COR-021 Randa para corte — 8,600 — 3

Órdenes de producción:
  OP-2026-114 Huipil Sololá cuello grande — 186 de 240 — entrega 8 ago 2026 — Feria de Sololá
  OP-2026-119 Faja Totonicapán greca — 132 de 500 — entrega 1 sep 2026 — Independencia
  OP-2026-121 Tzute Chichicastenango — 90 de 90 — entrega 20 jul 2026 — Regular

Umbral legal de referencia: un operario necesita 2,453,721 puntadas por quincena para
alcanzar el salario mínimo. Por debajo de eso, el patrono debe completar la diferencia.

Confirma que entendiste el sistema de diseño y espera el primer lote de pantallas.
```

---

## §2 · Lotes de pantallas

### Lote 1 · Fundamentos y muestrario

```
Diseña un lienzo con 2 mesas de trabajo.

MESA 1 — "Muestrario de componentes", 1440×1600
Un catálogo visual del sistema, agrupado con títulos de sección en mayúscula:
· Botones: primario, secundario, terciario y destructivo, en estados normal,
  hover, activo, foco y deshabilitado.
· Campos: texto, texto con formato (DPI 3056 78914 0801), numérico de puntadas
  (2,918,400), selector, selector de rango de fechas, casilla, interruptor.
  Mostrar también un campo con error: "El DPI no es válido. Revise el dígito
  verificador." y uno validado con marca de correcto.
· Indicadores de estado de máquina: corriendo, parada, en falla, en mantenimiento,
  sin datos. Cada uno con su color Y su forma, SIN relleno de fondo: la forma va
  coloreada y el texto en tinta normal. Anotar junto a cada uno su comportamiento
  según la sección MOVIMIENTO: pulso de 2.4s, quieto, doble parpadeo, barrido
  diagonal, desvanecimiento de 4s.
· Chips de verificación de corrida: ok +0.12%, revisar +2.4%, discrepancia +4.97%,
  sin declarar.
· Contador de puntadas: cifra grande 2,918,400 en Plex Mono, con su delta del día
  +187,200 y su tasa 412 ppm.
· Barra de mínimo legal: la de Diego Puac Ajanel al 167% del umbral en verde, y la
  de Rosa Elena Batz Quiej al 77% en rojo, ambas con la marca del umbral
  2,453,721 visible sobre la barra.
· Semáforo de mantenimiento: BOR-01 al 94.9% en aviso, BOR-04 al 31% normal.
· Fila de tabla de datos con encabezado, dos filas normales y una seleccionada.

MESA 2 — "Ingreso al panel", 1440×900
Pantalla de ingreso para el dueño y el personal de oficina. Columna izquierda con
el formulario en un ancho máximo de 380px: nombre de usuario, contraseña, botón
primario "Entrar". Sin ilustración. El nombre de la fábrica en tipografía de
interfaz, no un logotipo inventado. Debajo del formulario, una línea discreta:
"¿Es operario? Use la aplicación de piso en su teléfono."
La mitad derecha es un plano de color marca-900 con un dato real en Plex Mono
grande, como una pizarra de planta: "8 máquinas · 5 operarios · turno diurno".
```

### Lote 2 · Tablero general

```
Diseña 1 mesa de trabajo de 1440×1400: "Tablero general" (pantalla B1), la primera
que ve el dueño al entrar.

Barra lateral izquierda de 220px, fija, con los módulos: Tablero, Operarios,
Máquinas, Producción, Catálogo, Nómina, Inventario, Mantenimiento, Reportes,
Configuración. El activo es Tablero. Al pie, el usuario en sesión con su rol.

Contenido, de arriba abajo:

1. Encabezado con el título, la fecha (lunes 7 de septiembre de 2026), el turno en
   curso y un selector de rango con atajos: hoy, ayer, esta semana, esta quincena,
   este mes, rango libre. "Hoy" está activo.

2. Cuatro cifras de la jornada, separadas por líneas verticales, no en tarjetas:
   Puntadas del día 1,847,300 · Prendas terminadas 412 · Máquinas corriendo 4 de 8 ·
   Ganancia devengada del día Q1,231.53. Cada una en Plex Mono grande con su
   etiqueta en mayúscula pequeña arriba y su comparación contra ayer debajo.

3. Franja de alertas, la sección más importante: tres avisos en línea, cada uno con
   su color semántico, su ícono de forma y un botón de acción a la derecha.
   · crítico — "BOR-05 en falla desde las 09:14. Rosa Elena Batz Quiej sin máquina
     hace 2 h 40 min." → "Reasignar máquina"
   · crítico — "Rosa Elena Batz Quiej va por debajo del mínimo legal: lleva
     1,884,900 de 2,453,721 puntadas de la quincena." → "Ver nómina"
   · aviso — "BOR-01 al 94.9% del intervalo de engrase de la lanzadera." →
     "Programar mantenimiento"

4. Retícula de 8 fichas de máquina en 4 columnas, separadas por hairline y aire, sin
   tarjetas ni sombras. Los estados están vivos: las cuatro máquinas corriendo laten
   con su pulso de 2.4s, BOR-03 está completamente quieta, BOR-05 da su doble
   parpadeo, BOR-07 tiene el barrido de mantenimiento y BOR-08 se desvanece muy
   lento. Cada ficha muestra: código grande, estado con punto y palabra, operario a
   cargo, diseño en curso con su código, puntadas del día en Plex Mono, y una barra
   fina de avance hacia el próximo mantenimiento. BOR-05 se ve en falla, BOR-07 en
   mantenimiento sin operario, BOR-08 sin datos y en gris.

5. Al pie, tabla compacta "Últimas corridas cerradas" con seis filas: hora, máquina,
   operario, diseño, repeticiones, puntadas y chip de verificación. Una fila con
   discrepancia, en rojo suave.
```

### Lote 3 · Máquinas y asignación

```
Diseña 1 lienzo con 3 mesas de 1440 de ancho.

MESA 1 — "Máquinas · parrilla" (D1)
Encabezado con filtros: estado, controlador, número de cabezas, y un conmutador
entre vista de parrilla y vista de tabla. Botón primario "Agregar máquina".
Vista de tabla con las 8 máquinas y columnas: código, modelo, controlador, cabezas,
spm nominal, estado, operario a cargo, puntadas de hoy, puntadas acumuladas
históricas, próximo mantenimiento en porcentaje. Los números a la derecha en Plex
Mono. La columna de cabezas es relevante y debe leerse claro: es lo que separa
puntadas de prendas.

MESA 2 — "Máquina · ficha BOR-01" (D3), alto 1500
Encabezado con el código en grande, el modelo Feiya FY-1206, el controlador Dahao
BECS-A15, 6 cabezas, 850 spm y la píldora de estado "corriendo".
Debajo, cuatro cifras: puntadas de hoy 312,400 · prendas de hoy 108 ·
puntadas acumuladas 41,882,300 · disponibilidad del mes 87.4%.
Una gráfica de puntadas por hora del turno, de 06:00 a 14:00, con barras y los
huecos de paro marcados en el color de aviso; el eje etiquetado con valores reales.
Sección "Mantenimiento" con tres tareas y su semáforo: engrase de lanzadera 94.9%
en aviso, lubricación de barras de aguja 41%, revisión de correas 12%. Botón
"Generar orden de mantenimiento".
Sección "Corridas de hoy" en tabla.
Pestañas arriba: Resumen · Producción · Mantenimiento · Historial.

MESA 3 — "Asignación de máquinas a operarios" (D4), alto 1100
La pantalla que controla quién puede operar qué. Dos columnas.
Izquierda, lista de las 8 máquinas: cada una con su estado y el operario asignado,
o la marca "sin asignar" en color de aviso cuando no lo tiene (BOR-07 y BOR-08).
Derecha, panel de la máquina seleccionada (BOR-05): operario actual Rosa Elena Batz
Quiej, tipo de asignación "permanente", vigente desde el 12 de febrero de 2026,
asignada por "Dueño · 12 feb 2026 08:41".
Debajo, el formulario para reasignar: selector de operario, tipo de asignación
(permanente, de turno, temporal, cobertura), rango de vigencia, campo de motivo, y
botón primario "Asignar máquina".
Un aviso en línea, informativo, explica la consecuencia con claridad:
"El operario asignado será el único que pueda abrir corridas en esta máquina desde
la aplicación de piso."
Al pie del panel, historial de asignaciones de esa máquina, con quién la asignó y
cuándo.
```

### Lote 4 · Operarios

```
Diseña 1 lienzo con 3 mesas de 1440 de ancho.

MESA 1 — "Operarios · listado" (C1)
Tabla de los 5 operarios con columnas: código, nombre, teléfono, máquinas asignadas,
puntadas de la quincena, ganancia devengada, estado del mínimo legal y estado
activo. La fila de Rosa Elena Batz Quiej muestra su indicador de mínimo en rojo.
Filtros arriba: activo, máquina, rango de fechas. Botón primario "Agregar operario".
Al pie, totales de columna sumables.

MESA 2 — "Operario · alta" (C2), alto 1400
Formulario de una sola columna, ancho máximo 640px, con secciones separadas por
línea y título en mayúscula:
· Identificación: DPI de 13 dígitos con formato en vivo 3056 78914 0801 y validación
  del dígito verificador; al validar, muestra debajo, en texto pequeño, el
  departamento y municipio deducidos ("Totonicapán · Totonicapán"). Nombres y
  apellidos en campos separados, incluido apellido de casada. Fecha de nacimiento.
· Contacto: teléfono, dirección, departamento, municipio.
· Laboral: fecha de ingreso, modalidad de pago (destajo, tiempo, mixto), turno,
  número de IGSS, NIT.
· Acceso: máquinas asignadas, con un selector múltiple que muestra cuáles están
  libres y cuáles ya tienen operario. Aviso en línea: "El operario solo podrá abrir
  corridas en las máquinas que se le asignen aquí."
· Gafete: vista previa del código QR con el código OP-041 y botón "Imprimir gafete".
Barra de acciones fija al pie: "Cancelar" y botón primario "Guardar operario".
Mostrar además un campo de DPI con error de validación:
"El dígito verificador no corresponde. Revise el número del DPI."

MESA 3 — "Operario · ficha" (C3), alto 1400
Ficha de Diego Puac Ajanel. Encabezado con nombre, código OP-007, máquinas BOR-01 y
BOR-06, fecha de ingreso. El DPI aparece parcialmente oculto con un control para
revelarlo, con la nota "Visible solo para dueño y RRHH".
Cuatro cifras: puntadas de la quincena 4,105,220 · ganancia devengada Q3,192.39 ·
prendas 1,842 · días trabajados 11.
Barra de mínimo legal al 167% del umbral, en verde.
Gráfica de puntadas por día de la quincena, con la línea del ritmo necesario
(188,748 por día) sobrepuesta y etiquetada.
Tabla de corridas recientes y, al pie, historial de asignaciones y de movimientos de
nómina.
```

### Lote 5 · Ganancias: tarifas, simulador y conceptos

```
Diseña 1 lienzo con 3 mesas de 1440 de ancho. Este lote es exclusivo del dueño y es
donde define cuánto gana la gente. Debe transmitir peso y consecuencia.

MESA 1 — "Tarifas de destajo" (E1), alto 1200
Arriba, la tarifa vigente destacada sin ser una tarjeta decorativa: una franja con
línea superior de 2px en color marca, que dice "1,500 puntadas = Q1.00", con
"Q0.00066667 por puntada" debajo en texto secundario, alcance "Global", vigente
desde el 1 de enero de 2026, autorizada por "Dueño · 28 dic 2025 16:20".
Junto a ella, un bloque de consecuencia calculada, en Plex Mono:
"Con esta tarifa, un operario necesita 2,453,721 puntadas por quincena para alcanzar
el salario mínimo de Q3,816.90. Equivale a 393 puntadas por minuto sostenidas."
Debajo, tabla de tarifas con columnas: nombre, alcance (global, por operario, por
máquina, por diseño, por producto), referencia, puntadas por quetzal, vigente desde,
vigente hasta, autorizada por. Dos filas históricas ya cerradas y una vigente.
Una nota de precedencia visible: "Al liquidar gana la tarifa más específica:
operario, luego máquina, luego diseño, luego producto, luego global."
Botón primario "Nueva tarifa".
Incluir también el modal de confirmación al crear una tarifa nueva, que nombra la
consecuencia exacta: "Se cerrará la tarifa vigente el 30 de septiembre de 2026 y la
nueva regirá desde el 1 de octubre. Las quincenas ya cerradas no cambian."

MESA 2 — "Simulador de ganancia" (E2), alto 900
Herramienta para que el dueño vea el efecto de una tarifa antes de aplicarla.
Panel de entradas a la izquierda: puntadas por quetzal (1,500), velocidad de la
máquina (850 spm), eficiencia estimada (70%), días trabajados en la quincena (13),
categoría salarial (CE2 no agrícola).
Resultado a la derecha, en Plex Mono con etiquetas claras: puntadas proyectadas
3,714,600 · destajo Q2,476.40 · séptimo día Q412.73 · complemento al mínimo Q0.00 ·
bonificación incentivo Q125.00 · IGSS laboral Q139.51 · NETO Q2,874.62 ·
costo patronal Q4,208.15.
Debajo, una gráfica de barras horizontales con el destajo mensual a 650, 750, 850 y
1,000 spm, y una línea vertical marcada en Q3,816.90 que es el salario mínimo. La
barra de 650 spm queda por debajo de la línea y va en color crítico.

MESA 3 — "Descuentos y bonificaciones" (E3), alto 900
Dos tablas separadas por título. Bonificaciones: puntualidad, producción, antigüedad.
Descuentos: anticipo, préstamo, pérdida de material, con su tope como porcentaje del
salario y la marca de "requiere autorización".
Panel lateral para aplicar un movimiento a un operario, con selector de concepto,
monto, motivo obligatorio y la línea de firma "Autorizado por · Dueño".
Un aviso en línea, en color de aviso: "Un descuento no puede dejar el pago neto por
debajo del salario mínimo protegido."
```

### Lote 6 · Producción y verificación

```
Diseña 1 lienzo con 4 mesas de 1440 de ancho.

MESA 1 — "Corridas del día" (F1)
Tabla en vivo con columnas: hora de inicio, hora de cierre, máquina, operario,
diseño declarado, repeticiones, prendas, puntadas medidas, puntadas esperadas,
desviación, chip de verificación y fuente del dato (manual, sensor, red, archivo).
Filtros de máquina, operario y estado de verificación. Un indicador discreto arriba
dice "3 corridas abiertas ahora".
Incluir la corrida con discrepancia: BOR-05, Rosa Elena Batz Quiej, FAJ-010,
12 repeticiones, esperado 148,800, medido 156,200, +4.97%, en rojo suave.

MESA 2 — "Bandeja de discrepancias" (F2), alto 1000
La cola de trabajo del supervisor. Lista a la izquierda con las corridas por
resolver; detalle a la derecha de la seleccionada.
El detalle muestra, lado a lado, lo declarado y lo medido, con la diferencia grande
en Plex Mono. Debajo, los candidatos alternativos que el sistema propone según el
conteo, ordenados por cercanía, cada uno con su código, nombre, puntadas y
desviación.
Explicación en texto pequeño y honesto: "El conteo por sí solo no identifica el
diseño; solo verifica el declarado. Estos candidatos son una sugerencia."
Acciones: "Confirmar el diseño declarado", "Cambiar al diseño sugerido",
"Marcar como reproceso por rotura de hilo", "Anular la corrida". La última pide
motivo obligatorio.
Un aviso fijo arriba: "2 corridas sin resolver bloquean el cierre de la quincena."

MESA 3 — "Órdenes de producción" (F3)
Tabla de las tres órdenes con avance en barra, cantidad producida sobre objetivo,
fecha de compromiso, temporada asociada y estado. La orden OP-2026-119 va al 26% con
entrega el 1 de septiembre y aparece marcada como en riesgo.

MESA 4 — "Orden · detalle" (F4), alto 1200
Detalle de OP-2026-114, huipil Sololá cuello grande, 186 de 240.
Encabezado con avance grande, días restantes y ritmo necesario para llegar.
Diseños que componen el producto, con su firma de puntadas.
Consumo de hilo proyectado contra el real.
Tabla de corridas atribuidas a la orden, agrupadas por máquina.
```

### Lote 7 · Catálogo

```
Diseña 1 lienzo con 4 mesas de 1440 de ancho.

MESA 1 — "Diseños · catálogo" (G1)
Parrilla de fichas de diseño en 4 columnas. Cada ficha: miniatura real del bordado,
código, nombre, puntadas en Plex Mono, número de cambios de color, región cultural y
dimensiones en milímetros. Filtros por región, por tipo de prenda y por rango de
puntadas. El rango de puntadas importa porque es la firma de verificación.

MESA 2 — "Diseño · alta desde archivo" (G2), alto 1000
Zona para soltar un archivo DST. Después de leerlo, el sistema muestra la firma
extraída en dos columnas comparadas: lo declarado en el encabezado del archivo
contra lo contado realmente en los registros.
  Puntadas declaradas 42,500 · contadas 42,500 · coinciden
  Cambios de color declarados 9 · contados 9 · coinciden
  Saltos 214 · ancho 186.4 mm · alto 203.1 mm
  Hash SHA-256 truncado, en Plex Mono
Incluir también el caso de discrepancia, con aviso: "El encabezado declara 42,500
puntadas pero el archivo contiene 42,731. Se usará el conteo real. El archivo
probablemente fue editado."
Campos: código, nombre, versión, región cultural, producto asociado. Vista previa
del QR del código de diseño y botón "Imprimir etiqueta para el bastidor".

MESA 3 — "Productos" (G3)
Tabla de productos con SKU, nombre, tipo de prenda (huipil, sobrehuipil, corte,
faja, tzute, perraje, tocoyal), región, talla, diseños que lo componen, puntadas
totales por prenda, costo estimado y precio de venta.

MESA 4 — "Temporadas" (G4), alto 1000
Calendario anual en franja horizontal con las temporadas marcadas: ferias patronales
por municipio, Semana Santa, Día de la Madre, Independencia el 15 de septiembre,
graduaciones y Navidad. Hoy es 7 de septiembre de 2026, así que Independencia está
a 8 días y debe verse inminente.
Debajo, tabla de temporadas con producto asociado, demanda estimada y producción
comprometida. La Feria de Sololá del 15 de agosto ya pasó; la de Independencia está
activa.
```

### Lote 8 · Nómina

```
Diseña 1 lienzo con 4 mesas. Este lote es el de mayor consecuencia legal: todo
número debe verse verificable y todo cierre debe verse deliberado.

MESA 1 — "Nómina · períodos" (H1), 1440×900
Tabla de quincenas con estado (abierto, calculado, aprobado, pagado, cerrado),
rango de fechas, operarios incluidos, total bruto, total neto, costo patronal y
quién aprobó. La quincena del 1 al 15 de septiembre de 2026 está abierta.

MESA 2 — "Nómina · cálculo del período" (H2), 1440×1300
La pantalla central del módulo. Encabezado con el período, el estado y el resumen:
5 operarios · total neto Q14,247.83 · costo patronal Q20,884.11.
Aviso crítico arriba, que bloquea: "2 corridas con discrepancia impiden cerrar el
período." con enlace a la bandeja.
Tabla por operario con columnas en Plex Mono, alineadas a la derecha: puntadas,
días, destajo, séptimo día, complemento al mínimo, bonificación incentivo,
bonificaciones, descuentos, IGSS 4.83%, neto y costo patronal.
La fila de Rosa Elena Batz Quiej muestra complemento Q567.53 y una marca de alerta;
al pasar el cursor, la explicación: "Su destajo no alcanza el salario mínimo. El
patrono completa la diferencia, según el artículo 91 del Código de Trabajo."
Una columna debe dejar claro que el séptimo día es un sexto de lo devengado, con la
nota al pie: "Séptimo día calculado como una sexta parte de lo devengado en la
semana, artículo 126 del Código de Trabajo."
Totales al pie. Acciones: "Recalcular", "Exportar", y botón primario "Cerrar
período", deshabilitado mientras haya discrepancias.
Incluir el modal de cierre, que nombra la consecuencia:
"Se cerrará la quincena del 1 al 15 de septiembre de 2026 con 5 operarios y
Q14,247.83 de pago neto. Después de cerrar no se podrán editar las corridas de este
período. Esta acción queda registrada a su nombre."

MESA 3 — "Constancia de pago" (H3), 900×1200, formato de impresión
Boleta de Rosa Elena Batz Quiej. Encabezado con la fábrica, el período y el
operario con su código. Desglose línea por línea de devengado y deducido, con el
complemento al mínimo nombrado explícitamente. Total neto grande. Al pie, espacio
de firma y la referencia legal de la tarifa aplicada.

MESA 4 — "Libro de salarios y planilla IGSS" (H4), 1440×1000
Vista de exportación con dos pestañas. Formato tabular sobrio, pensado para
imprimir. Nota visible: "Libro de salarios autorizado por el Ministerio de Trabajo,
obligatorio con 10 o más trabajadores permanentes, artículo 102 del Código de
Trabajo."
```

### Lote 9 · Inventario y mantenimiento

```
Diseña 1 lienzo con 4 mesas de 1440 de ancho.

MESA 1 — "Inventario · existencias" (I1)
Tabla por bodega y artículo: SKU, nombre, clase (hilo, tela, aguja, entretela, avío,
repuesto, producto terminado), unidad, existencia, mínimo, y estado. Tres artículos
bajo el mínimo, marcados en aviso. Filtro por bodega: materia prima, producto
terminado, repuestos.
Para los hilos, mostrar la columna "consumo por mil puntadas", que es lo que permite
proyectar el hilo de una orden.

MESA 2 — "Inventario · movimientos" (I2)
Registro cronológico con tipo (entrada, salida, ajuste, traslado, consumo de
producción, merma), artículo, cantidad, bodega, referencia a la corrida u orden que
lo originó, usuario y fecha. Los consumos de producción enlazan a su corrida.

MESA 3 — "Mantenimiento · semáforo" (J1), alto 1000
Las 8 máquinas en filas, y por cada una las tareas con su barra de avance hacia el
intervalo. Ordenadas por urgencia: BOR-01 engrase de lanzadera al 94.9% arriba, en
aviso. Cada barra muestra el intervalo en puntadas y las puntadas transcurridas.
Un conmutador permite ver los intervalos en puntadas o en horas equivalentes, con la
nota: "8 horas de operación equivalen a unas 250,000 puntadas."
Botón por fila: "Generar orden".

MESA 4 — "Mantenimiento · órdenes" (J2)
Tabla de órdenes preventivas y correctivas con máquina, tarea, disparador
(puntadas, horas, días, falla), estado, programada para, ejecutada por y costo de
repuestos. La orden correctiva de BOR-05 por la falla de hoy está en proceso.
```

### Lote 10 · Reportes y configuración

```
Diseña 1 lienzo con 3 mesas de 1440 de ancho.

MESA 1 — "Reportes" (K1), alto 1300
Constructor de informes. Barra superior con el selector de rango de fechas y sus
atajos, que es el control más usado del sistema entero: hoy, ayer, esta semana,
esta quincena, este mes, rango libre. Está en "del 1 al 15 de septiembre de 2026".
Panel de configuración a la izquierda: granularidad (hora, día, semana, mes),
dimensión (máquina, operario, diseño, producto, orden, temporada, turno) y medidas
(puntadas, prendas, corridas, horas operativas, horas de paro, quetzales
devengados), en casillas.
Resultado a la derecha: una gráfica de puntadas por día del período, con el eje
etiquetado con valores reales, y debajo la tabla con totales al pie.
Botones de exportación a PDF y a hoja de cálculo.
Debajo, en pestañas, los dos informes fijos: "Producción por máquina" y "Producción
por operario".

MESA 2 — "Configuración · parámetros legales" (L2), alto 1000
Los valores que cambian por acuerdo gubernativo y nunca deben estar en el código.
Tabla con: salario mínimo CE1 y CE2 en sus tres categorías, bonificación incentivo
Q250.00, IGSS laboral 4.83%, patronal 10.67%, INTECAP 1%, IRTRA 1%, provisiones de
aguinaldo, Bono 14, vacaciones e indemnización. Cada valor con su vigencia y su
fuente citada: "Acuerdo Gubernativo 256-2025".
Aviso en línea: "Cambiar un parámetro no altera los períodos de nómina ya cerrados."

MESA 3 — "Configuración · usuarios y auditoría" (L1 y L3), alto 1100
Arriba, tabla de usuarios con nombre, rol, operario vinculado, último ingreso y
estado. Los siete roles visibles: dueño, gerencia, supervisor, RRHH, mantenimiento,
bodega, operario.
Abajo, registro de auditoría en tabla densa: usuario, acción, tabla afectada,
registro, antes y después, fecha y hora, dirección IP. Filtrable. Entradas reales
como "Dueño cambió tarifa_destajo #3: puntadas_por_quetzal 1,600 → 1,500".
```

### Lote 11 · PWA · abrir corrida

```
Diseña 1 lienzo con 4 mesas de 390×844, para teléfono. Esta es la aplicación del
piso de planta: pocos elementos, muy grandes, contraste alto, pensada para usarse de
pie junto a una máquina y con las manos ocupadas. Texto base 17px, botón primario
72px de alto, objetivos táctiles generosos.

MESA 1 — "Ingreso por gafete" (P1)
Pantalla casi vacía. Instrucción corta: "Escanee su gafete". Un visor de cámara
grande con marco de enfoque. Debajo, alternativa siempre visible: "Ingresar mi
código". Nada más.

MESA 2 — "Inicio" (P2)
Encabezado con "Buenos días, Diego" y el código OP-007.
Bloque de ganancia del día, lo primero y lo más grande: "Q184.20 hoy" en Plex Mono
enorme, con "276,300 puntadas" debajo, y una barra fina hacia la meta de la quincena
con el texto "Va al 167% del mínimo".
Luego el título "Mis máquinas" y SOLO las dos máquinas asignadas a Diego: BOR-01 y
BOR-06, cada una como una fila alta de 96px con su código grande, su estado con
punto y palabra, el diseño en curso y las puntadas del día. BOR-01 tiene una corrida
abierta y muestra el botón "Continuar"; BOR-06 muestra "Abrir corrida".
No hay buscador de máquinas ni lista completa: solo estas dos.
Al pie, una barra de navegación de tres destinos: Inicio, Mi ganancia, Paros.

MESA 3 — "Abrir corrida · escanear" (P3)
Tres pasos numerados en la parte superior, con el segundo activo: máquina, diseño,
contador.
Visor de cámara a pantalla completa con marco. Texto: "Escanee el código del
diseño". Debajo, botón secundario "Escribir el código".
Incluir además, como variante en la misma mesa o en un recuadro contiguo, el caso de
máquina no asignada, que es la regla de acceso hecha visible:
mensaje claro con ícono de aviso, "La máquina BOR-07 no está asignada a usted",
y debajo "Pida a su supervisor que se la asigne", con botón "Volver a mis máquinas".

MESA 4 — "Abrir corrida · contador" (P4)
Confirmación de lo escaneado arriba: máquina BOR-06, diseño HUI-002 Huipil
Quetzaltenango aves con su miniatura y "38,900 puntadas por repetición".
Campo grande para el contador inicial de la máquina, con teclado numérico propio de
dígitos de 64px, no el del sistema. El número tecleado se ve enorme en Plex Mono con
separador de miles: 8,412,300.
Campo de repeticiones planeadas.
Botón primario de 72px: "Abrir corrida".
Enlace discreto: "Tomar foto del panel".
```

### Lote 12 · PWA · cerrar corrida, paros y ganancia

```
Diseña 1 lienzo con 4 mesas de 390×844.

MESA 1 — "Corrida en curso" (P4 continuación)
Máquina BOR-06 y diseño HUI-002 arriba. Cronómetro de la corrida: 2 h 14 min.
Cifra grande de puntadas avanzadas 71,400 y su barra hacia lo esperado
(2 repeticiones = 77,800), con el porcentaje. Debajo, ganancia acumulada de la
corrida Q47.60.
Dos botones grandes: "Reportar paro" en secundario y "Cerrar corrida" en primario.

MESA 2 — "Cerrar corrida · verificación" (P5)
Campo del contador final con el teclado numérico grande. Campo de repeticiones
terminadas: 2.
Al confirmar, el resultado de la verificación ocupa la pantalla:
Variante correcta: marca en verde, "Corrida verificada", esperado 77,800,
medido 77,940, desviación +0.18%, prendas 4 (2 repeticiones × 2 cabezas), ganancia
de la corrida Q51.96.
Variante con discrepancia, en la misma mesa o contigua: marca en rojo, "Revisar con
el supervisor", esperado 148,800, medido 156,200, +4.97%, y el texto "La corrida
quedó registrada. Su supervisor la revisará." Nunca se pierde el dato ni se culpa al
operario.
Hacer explícita en pantalla la distinción entre repeticiones y prendas: es lo que
diferencia una máquina de 1 cabeza de una de 6.

MESA 3 — "Reportar paro" (P6)
Cinco botones grandes de 88px de alto, uno por causa, cada uno con su forma y color:
rotura de hilo, falta de material, cambio de bastidor, falla de la máquina, fin de
turno. Debajo, campo opcional de nota. El paro se registra con la hora exacta y se
muestra confirmación breve.

MESA 4 — "Mi ganancia" (P7)
Conmutador entre "Hoy" y "Esta quincena". En la vista de quincena:
Cifra grande Q3,192.39 en Plex Mono, con "4,105,220 puntadas" debajo.
Barra hacia el mínimo legal con la marca del umbral 2,453,721 y el texto "Va al 167%
del mínimo".
Desglose en filas de etiqueta y valor: destajo Q2,736.81 · séptimo día Q456.14 ·
bonificación incentivo Q125.00 · descuentos Q0.00 · IGSS Q154.19 · neto estimado
Q3,163.76. Nota al pie: "Estimado. El monto final se confirma al cerrar la quincena."
Al pie, lista de los días con sus puntadas.
Incluir también, como recuadro contiguo, el estado sin conexión (P8): franja
discreta en la parte superior, no un bloqueo, que dice "Sin conexión · 3 corridas
pendientes de enviar", con la lista de lo encolado y la nota "Se enviarán solas
cuando vuelva la señal. Puede seguir trabajando."
```

### Lote 13 · Movimiento y estados vivos

```
Diseña 1 lienzo dedicado al sistema de movimiento. Es una especificación visual: cada
animación se muestra con su nombre, su duración, su curva y una tira de fotogramas que
la explica sin necesidad de verla correr.

MESA 1 — "Estados de máquina en movimiento", 1440×900
Cinco filas, una por estado. Cada fila lleva: el indicador a tamaño real, el nombre del
estado, y una tira de 5 fotogramas que muestra el ciclo completo con su tiempo marcado
debajo de cada uno.
  Corriendo — punto lleno, opacidad 1 → .45 → 1, 2.4s, curva suave, infinito
  Corriendo avanzado — el mismo pulso con la duración derivada de las puntadas por
    minuto reales: mostrar tres máquinas en paralelo, BOR-04 a 1,000 spm latiendo a
    1.4s, BOR-01 a 850 spm a 1.8s y BOR-05 a 750 spm a 2.2s
  Parada — punto lleno, sin animación; dejar la fila de fotogramas idéntica a
    propósito, con la anotación "la quietud es la señal"
  En falla — triángulo, doble parpadeo de 120ms y 3s de reposo
  En mantenimiento — cuadrado, barrido diagonal de brillo tenue, 3s
  Sin datos — punto hueco, desvanecimiento 1 → .35 → 1, 4s

MESA 2 — "Movimiento de componentes", 1440×1100
Una fila por componente, cada una con estado inicial, estado intermedio y estado final,
más su duración y curva anotadas en Plex Mono:
  Contador de puntadas — de 276,300 a 312,400 en 420ms, dígito a dígito, ancho fijo
  Barra de mínimo legal — de 0 a 167% en 320ms, con destello en la marca del umbral
  Semáforo de mantenimiento — BOR-01 al 94.9% latiendo cada 4s; BOR-04 al 31% quieto
  Chip de verificación — de "pendiente" a "verificada +0.18%", opacidad y 4px
  Fila de tabla — entrada de una corrida nueva, y el destaque de 600ms al cambiar
  Franja de alerta — entrada desde arriba 8px, y colapso de altura al resolverse
  Esqueleto de carga — barrido de 1.4s; incluir una nota tachada que diga
    "nunca un indicador giratorio"

MESA 3 — "Movimiento en la PWA", 3 pantallas de 390×844 en secuencia
  Marco de escaneo respirando a 2s y su colapso al centro en 180ms al leer el código,
  con los indicadores de sonido y vibración anotados al margen.
  Los tres pasos de la corrida —máquina, diseño, contador— con el avance lateral de
  8px entre ellos, dibujado con una flecha y su duración.
  La ganancia del día contando de Q147.90 a Q184.20.

MESA 4 — "Movimiento reducido", 1440×600
La misma tira de los cinco estados de máquina con prefers-reduced-motion activo:
sin pulsos, con el estado distinguiéndose solo por color y forma. Al lado, la lista de
lo que cambia: los conteos saltan al valor final, las barras aparecen en su valor, las
transiciones se reducen a 90ms de opacidad.
Encabezar la mesa con la regla: "Ninguna información de este sistema depende
únicamente del movimiento."

Todo el lienzo en estilo minimalista: fondo limpio, anotaciones en Plex Mono pequeño,
sin marcos decorativos alrededor de los ejemplos.
```

---

## §3 · Prompts de refinamiento

Usar después de aprobar un lote.

### Auditoría minimalista

```
Revisa las mesas de trabajo aprobadas contra la dirección minimalista y quita lo que no
se gane su lugar. En concreto:
· Elimina toda tarjeta que pueda ser una retícula con hairline y aire.
· Quita los fondos grises de encabezado de tabla y déjalos con línea inferior.
· Quita el relleno de color de los indicadores de estado: forma coloreada más texto
  en tinta.
· Sube el espaciado entre bloques a 56px y entre secciones a 96px.
· Reduce los iconos a los indispensables.
· Comprueba que en cada pantalla haya como máximo un elemento con color semántico
  cuando no hay nada que atender.
Devuelve la versión depurada y una lista corta de qué quitaste y por qué.
```

### Modo oscuro

```
Toma las mesas de trabajo aprobadas y produce su versión en tema oscuro, usando los
tokens oscuros del prompt base. No inviertas los colores mecánicamente: revisa que
el contraste del texto sobre superficie siga siendo alto, que los colores semánticos
sigan distinguiéndose entre sí y que el acento marca-700 #8FA6DE funcione sobre el
fondo #101318. Las gráficas y los indicadores de estado deben tomar su color de los
mismos tokens, no de valores fijos.
Prioriza la PWA: el turno de noche es cuando más se usa.
```

### Estados de cada pantalla

```
Para las pantallas del lote anterior, diseña sus estados:
· Vacío, con el texto que dice qué falta y ofrece la acción. Ejemplo para corridas:
  "Aún no hay corridas hoy. Aparecerán aquí cuando un operario abra una desde la
  aplicación de piso."
· Cargando, con esqueletos que respetan la forma final, no con un indicador giratorio.
· Error de servidor, que dice qué pasó, qué se hizo con los datos y qué puede hacer
  la persona. Nunca un código ni "algo salió mal".
· Sin permiso, cuando un rol entra a una pantalla que no le corresponde: explica de
  qué rol depende y a quién pedirlo.
· Sin conexión, solo en la PWA: nunca bloquea, siempre muestra la cola pendiente.
```

### Responsivo del panel

```
Adapta las pantallas del panel de administración a 1024px y a 768px de ancho.
La barra lateral se colapsa a iconos y luego a un menú. Las tablas conservan sus
columnas de identificación y de cifras y desplazan horizontalmente el resto dentro
de su propio contenedor: el cuerpo de la página nunca se desplaza de lado.
No conviertas las tablas en tarjetas apiladas: el dueño necesita comparar filas.
```

### Impresión

```
Diseña las versiones para imprimir de la constancia de pago, el libro de salarios,
la planilla del IGSS y la orden de mantenimiento. Tamaño carta, tinta negra sobre
blanco, sin fondos de color, con las cifras en monoespaciada tabular y espacio de
firma. Encabezado con la fábrica, el período y el folio; pie con la fecha de emisión
y quién la generó.
```

### Impresos de planta

```
Diseña las etiquetas físicas que conectan el mundo real con el sistema:
· Gafete del operario: nombre, código OP-007, foto y código QR grande.
· Rótulo de máquina: código BOR-01 muy grande, legible a varios metros, con el QR
  debajo y el modelo en letra pequeña.
· Etiqueta de bastidor con el código de diseño: HUI-001, nombre, puntadas 42,500,
  cambios de color 9 y su QR.
Los tres deben resistir una fotocopia en blanco y negro y seguir escaneándose.
```
