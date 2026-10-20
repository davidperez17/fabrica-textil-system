# 11 · Brief de diseño del sistema

Documento de referencia para diseñar la interfaz completa. Se usa junto con
[`12-prompts-claude-design.md`](12-prompts-claude-design.md), que contiene los prompts listos para Claude Design.

Todo lo que aparece aquí sale de la investigación de los documentos 01 a 10. Cuando un dato
tenga origen (una cifra legal, un límite físico de la máquina), está citado.

---

## 1. Qué se está diseñando

Un sistema de administración para una fábrica de bordado computarizado de trajes típicos
guatemaltecos. Dos superficies muy distintas que comparten un solo sistema de diseño:

| Superficie | Quién la usa | Dónde | Densidad |
|---|---|---|---|
| **Panel de administración** | Dueño, gerencia, supervisión, RRHH, mantenimiento, bodega | Escritorio en la oficina; el dueño también lo abre en su teléfono, fuera de la planta | Alta en escritorio; en el teléfono, solo lo de ver y decidir (§6.5) |
| **PWA de piso** | Operarios | Teléfono o tableta compartida, junto a la máquina | Baja: pocos elementos, muy grandes |

No son la misma aplicación con distinto ancho. Son dos productos con distinta finalidad que
comparten tokens, tipografía y vocabulario. Diseñarlas como un solo responsive es el error
más caro que se puede cometer aquí.

El panel sí se adapta al teléfono, pero no se encoge. Ver cada máquina desde el teléfono, sin
bajar a la planta, es lo que la cotización le promete al dueño. En el teléfono el dueño **mira
y decide**: cómo va la planta, qué está detenido, autorizar un anticipo, revisar la quincena.
Lo que se **arma** (altas, catálogo, informes, configuración) queda para el escritorio. Las
reglas están en §6.5.

## 2. Dirección visual: moderna, con el dato al frente

El sistema se diseña en estilo **moderno**: lienzo gris claro, una tarjeta blanca muy
redondeada por tema, navegación en píldoras, cifras protagonistas enormes y gráficas con un
solo tramo resaltado. La referencia es un tablero financiero de ese lenguaje; se toma el
lenguaje, no el contenido. La tabla completa de qué se toma, qué se adapta y qué no está en
[`13-hoja-del-sistema.md`](13-hoja-del-sistema.md) §1.3.

Cinco reglas que hacen operativa la dirección:

| Regla | Qué implica en la pantalla |
|---|---|
| **El dato es la interfaz** | Cada tarjeta responde una pregunta y su cifra es lo más grande que contiene. La tarjeta es el marco del dato, no un adorno. |
| **Una tarjeta por tema, nunca una dentro de otra** | Dentro de la tarjeta, lo repetido va en filas de `superficie-2` sin borde. Las tarjetas no llevan borde ni sombra. |
| **El negro manda, el color señala** | Botón primario, píldora activa y tramo seleccionado van en `--tinta`. El color principal de la paleta aparece poco: la barra de hoy, la selección, los enlaces, el foco. |
| **La jerarquía la hace el tamaño** | Una sola cifra protagonista (48 px en el panel, 56 px en la app) por pantalla, y solo donde la cifra decide; el resto a 22–28 px. Saludo de 40 px, etiquetas pequeñas en `tinta-2`. No fondos de color ni barras de acento al costado. |
| **Nada compite con la alerta** | Con todo en tinta y gris, una sola mancha de color crítico se ve desde la puerta. |

Consecuencias concretas:

- La navegación entre módulos es un **riel de íconos con etiqueta debajo**; la navegación
  dentro del módulo, **píldoras** arriba. La activa, rellena en tinta.
- Cada tarjeta lleva en la esquina un botón circular **↗** que siempre significa «abrir el
  detalle».
- En el panel, los quetzales muestran los **centavos atenuados** (`Q866`**`.79`**); en la app del
  operario van completos, porque se leen al sol. Las puntadas, enteras
  y completas.
- Las variaciones van en **chip de píldora** verde o rojo suave, con la base de comparación
  escrita al lado.
- Las personas se representan con **iniciales en círculo**, nunca con fotos.
- **La planta es la protagonista.** El tablero abre con las máquinas, una fila por máquina con
  su **tira del turno**, no con una fila de cifras. Lo detenido va arriba con su acción.
- **Cada tarjeta tiene la forma de su pregunta:** planilla para la nómina, tira de tiempo para
  los trabajos, lista por urgencia para mantenimiento. La cuadrícula de tarjetas iguales es
  solo para elementos equivalentes, como el catálogo de diseños. Nunca una fila de tres o
  cuatro tarjetas con cifra gigante y etiqueta.
- La **cifra protagonista** aparece en tres lugares: «Puntadas de hoy» en el tablero, la
  tarifa vigente y la ganancia del operario en la app.
- Las píldoras de estado de máquina **no llevan relleno de color**: llevan su forma coloreada,
  dentro de un círculo neutro, y el texto en tinta.

Lo que lo moderno **no** autoriza en este proyecto: bajar el contraste, esconder acciones
detrás de menús, quitar etiquetas de los campos, íconos sin texto, abreviar cifras, ni reducir
el tamaño de los objetivos táctiles de la PWA. Estilo actual, nunca a costa de la legibilidad
en planta.

## 3. Principios, derivados de restricciones reales

1. **El número es el protagonista.** Todo en este negocio es una cifra: puntadas, quetzales,
   porcentajes de avance. Las cifras van con `tabular-nums`, alineadas a la derecha en tablas,
   sin abreviar. Nunca «5.7M puntadas»; siempre `5,725,350`.
2. **Separar producción de pago.** Puntadas y prendas son cosas distintas (una máquina de 6
   cabezas hace 6 prendas con el mismo conteo). Nunca mostrarlas en la misma columna ni con el
   mismo formato.
3. **El estado se ve antes de leerse.** Máquina corriendo, parada, en falla o en mantenimiento
   se distingue por forma y color a un metro de distancia, no por leer una palabra.
4. **La planta tiene mala luz y sol directo.** Contraste alto obligatorio. Nada de texto gris
   claro sobre fondo gris. Modo oscuro real para el turno de noche.
5. **El operario tiene las manos ocupadas.** Objetivos táctiles grandes, confirmación sonora
   al escanear, ninguna interacción que exija precisión.
6. **Sin conexión es el estado normal, no el error.** La PWA nunca muestra un error de red como
   bloqueo. Muestra una cola pendiente y sigue funcionando.
7. **Todo lo que toca dinero deja rastro.** Cambiar una tarifa, autorizar un descuento o cerrar
   una nómina exige confirmación explícita y queda firmado con nombre y hora, visible en la
   misma pantalla.
8. **Lo cerrado es exacto; lo abierto se dice abierto.** No hay sensores en las máquinas: las
   puntadas de una corrida se conocen cuando el operario la finaliza y teclea el contador.
   Ninguna pantalla presenta como medido lo que sigue bordándose (ver §9, «Dato cerrado y
   dato en curso»).
9. **Una tarjeta por tema.** Cada tarjeta responde una pregunta; nunca una tarjeta dentro de
   otra. Las tarjetas no llevan borde ni sombra: las separa el fondo gris.

## 4. Roles y permisos

Siete roles. El dueño es `admin` y tiene todo; los demás existen para que el dueño no tenga
que hacerlo todo él.

| Módulo | Dueño | Gerencia | Supervisor | RRHH | Mtto. | Bodega | Operario |
|---|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
| Tablero general | ✓ | ✓ | ✓ | — | — | — | — |
| Alta y edición de operarios | ✓ | — | — | ✓ | — | — | — |
| Ver DPI, dirección, teléfono | ✓ | — | — | ✓ | — | — | — |
| Definir tarifas de destajo | ✓ | — | — | — | — | — | — |
| Asignar máquinas a operarios | ✓ | — | ✓ | — | — | — | — |
| Alta y edición de máquinas | ✓ | — | ✓ | — | ✓ | — | — |
| Resolver discrepancias de corrida | ✓ | — | ✓ | — | — | — | — |
| Órdenes de producción | ✓ | ✓ | ✓ | — | — | — | — |
| Catálogo de diseños y productos | ✓ | ✓ | ✓ | — | — | — | — |
| Calcular y cerrar nómina | ✓ | — | — | ✓ | — | — | — |
| Autorizar descuentos y bonificaciones | ✓ | — | — | ✓ | — | — | — |
| Inventario | ✓ | ✓ | — | — | — | ✓ | — |
| Mantenimiento | ✓ | ✓ | ✓ | — | ✓ | — | — |
| Reportes | ✓ | ✓ | ✓ | ✓ | ✓ | ✓ | — |
| Usuarios, parámetros legales, auditoría | ✓ | — | — | — | — | — | — |
| PWA: abrir y cerrar corridas | — | — | — | — | — | — | ✓ |
| PWA: ver la ganancia propia | — | — | — | — | — | — | ✓ |

**Datos personales.** El DPI, la dirección y el teléfono solo son visibles para dueño y RRHH.
En cualquier otra pantalla el operario se identifica por nombre y código de gafete. Esto no es
una preferencia: es la medida mínima mientras Guatemala no tenga ley de protección de datos
vigente (ver `05-arquitectura-y-pwa.md`).

## 5. La regla de acceso por máquina asignada

Requisito explícito del dueño y pieza central del diseño:

> **Un operario solo puede operar las máquinas que tenga asignadas y vigentes.**

Cómo se traduce en interfaz:

- La pantalla de inicio de la PWA lista **únicamente** las máquinas asignadas al operario que
  inició sesión. No existe un buscador de máquinas ni una lista completa.
- Si el operario escanea el QR de una máquina que no tiene asignada, la app responde con un
  mensaje claro y accionable —«La máquina BOR-07 no está asignada a usted. Pida a su supervisor
  que se la asigne.»— nunca con un error genérico ni con una pantalla en blanco.
- La restricción se aplica **en el servidor**, no solo escondiendo botones. La interfaz refleja
  la regla; no es la regla.
- El supervisor y el dueño gestionan las asignaciones en una pantalla dedicada donde se ve, de
  un vistazo, qué máquina está a cargo de quién y cuáles quedaron sin operario en el turno.
- Una asignación puede ser permanente, de turno, temporal o de cobertura, y toda asignación
  queda firmada por quien la hizo.

## 6. Sistema de diseño

### 6.1 Color

> **Paleta pendiente de elección.** Los valores de abajo son la propuesta A · Añil. El cliente
> elige entre A · Añil, B · Jade y C · Grafito en la hoja del sistema
> ([`13-hoja-del-sistema.md`](13-hoja-del-sistema.md) §1.5); al elegir, se reemplazan aquí.

**Roles en la dirección moderna.** El botón primario, la píldora activa, el tramo seleccionado
de una gráfica y su globo van en `--tinta` (casi negro en claro, casi blanco en oscuro) en
cualquier paleta. La familia `--marca-*` es el color principal: barra destacada de las
gráficas (`--marca-500`, rayada en `--marca-700`), selección, enlaces, punto de no leído y
foco.

Los neutros están sesgados hacia el azul índigo del acento, no son grises puros. El acento
sale del azul profundo del **corte** guatemalteco; el rojo de alerta, del rojo de los huipiles
de Totonicapán. Los colores de estado son independientes del acento y no se usan nunca como
decoración.

**Tema claro**

```
--fondo          #E7E8EB    lienzo de la página, entre tarjetas (1.23:1 con la tarjeta)
--superficie     #FFFFFF    tarjetas, modales, panel de avisos
--superficie-2   #EDEFF3    filas internas, campos, botones de ícono, píldoras inactivas
--tinta          #14171C    texto principal
--tinta-2        #565D68    texto secundario
--tinta-3        #858D99    etiquetas, texto deshabilitado
--linea          #D9DDE4    bordes, divisores
--linea-suave    #E8EBF0    divisores internos
--linea-fuerte   #838A96    línea inferior de campos, barras pasadas, bordes en la app (≥ 3:1)

--marca-700      #2B3A67    color principal: enlaces, foco, rayado de la barra destacada
--marca-900      #1B2A4A    texto sobre marca-100
--marca-500      #4A63A8    barra destacada de las gráficas, punto de no leído
--marca-100      #E3E8F4    fondo de selección, avisos informativos
```

**Interruptor de modo día / noche.** El sistema tiene los dos modos y cada persona elige el
suyo con un interruptor siempre visible, sin entrar a Configuración:

- **Forma:** dos segmentos en una píldora, «☀ Día» y «☾ Noche», con el modo vigente relleno en
  tinta. Se ven los dos a la vez, así nadie tiene que adivinar si el ícono dice el modo actual
  o el siguiente, y no depende de pasar el cursor, que en el teléfono no existe. Es un grupo de
  dos botones con `aria-pressed`.
- **Panel en escritorio:** en la barra superior, entre la búsqueda y la campana, 40 px de alto,
  cada segmento con ícono y palabra.
- **Panel en el teléfono:** en la barra superior, solo los dos íconos, cada segmento de
  44 × 44 px, con su nombre en `aria-label`. Al verse sol y luna juntos, sigue sin ambigüedad.
- **App del operario:** en el encabezado de Inicio, 56 px de alto y cada segmento de 72 px de
  ancho, con ícono y palabra visibles, porque el operario lo cambia con guantes.
- **Por defecto** sigue al teléfono o a la computadora (`prefers-color-scheme`). Al tocarlo,
  la elección queda guardada **en la cuenta de la persona**, no solo en el navegador: el
  operario que usa una tableta compartida encuentra su modo al ingresar. Se guarda también en
  el dispositivo para que la app abra en el modo correcto sin conexión.
- **Al cambiar:** transición de color de 200 ms en toda la pantalla, sin destello blanco al
  cargar (el modo se aplica antes de pintar).
- En impresiones, constancias y PDF siempre se usa el modo día.

**Tema oscuro** — mismos nombres, valores redefinidos:

```
--fondo          #101318
--superficie     #22262B
--superficie-2   #2A2F36
--tinta          #E8EAEE
--tinta-2        #9BA3AF
--tinta-3        #6C7480
--linea          #363A3E
--linea-suave    #2C3035
--linea-fuerte   #707883

--marca-700      #8FA6DE
--marca-900      #B3C4EC
--marca-500      #6E86C4
--marca-100      #293553
```

**Semánticos** (claro / oscuro):

```
--ok             #2E6F4E  /  #6FBF8E      correcto, dentro de norma
--ok-suave       #E2F0E7  /  #17301F
--aviso          #9A6400  /  #E0A63C      requiere atención, no bloquea
--aviso-suave    #F7EDD9  /  #33270F
--critico        #B0322B  /  #E4837A      bloquea, o está fuera de ley
--critico-suave  #F7E4E2  /  #3A2523
```

**Estado de máquina** — vocabulario propio del dominio, cada estado con color y forma:

| Estado | Color | Indicador |
|---|---|---|
| Corriendo | `--ok` | punto lleno, con pulso lento |
| Parada | `--aviso` | punto lleno |
| En falla | `--critico` | triángulo |
| En mantenimiento | `#6D4C9F` claro / `#B49AE0` oscuro | cuadrado |
| Sin datos | `--tinta-3` | punto hueco |

El color nunca es la única señal: siempre lo acompaña la forma y la palabra.

### 6.2 Tipografía

Una sola familia, **IBM Plex**, en dos cortes. Se eligió por tres razones verificadas en el
archivo de la fuente: sus números son **tabulares de fábrica** (los diez dígitos miden lo
mismo, así que las columnas de puntadas y quetzales se alinean sin depender de `tnum`);
trae un eje de **ancho** (`wdth` 75–100) que deja condensar la planilla de nómina sin cargar
otra fuente; y su carácter de placa técnica encaja con una herramienta de planta mejor que
una geométrica de moda. La versión mono comparte esqueleto, así que los códigos no parecen
pegados de otro sistema.

| Rol | Familia | Uso |
|---|---|---|
| Interfaz y cifras | **IBM Plex Sans** variable, `wght` 400–700, `wdth` 85–100 | Todo el texto y todas las cifras. Se declara `font-variant-numeric: tabular-nums` igual, por si cae la fuente de respaldo. |
| Códigos | **IBM Plex Mono** 400/500 | Identificadores que se dictan o se copian: BOR-05, OP-007, HUI-001, DPI, hash, valores hex. |

Respaldo: `"IBM Plex Sans", system-ui, -apple-system, "Segoe UI", Roboto, sans-serif`, con
`font-display: swap`.

**Escala del panel** (px, fija, sin tamaños fluidos):

| Rol | Tamaño / interlínea | Peso | Notas |
|---|---|---|---|
| Rótulo del riel, marcas de hora | 11 / 14 | 500 | Solo en esos dos lugares |
| Etiqueta, eje de gráfica | 12 / 16 | 500 | `--tinta-2`, tipo oración |
| Migas, texto secundario | 13 / 18 | 400 | `--tinta-2` |
| Tabla, control, cuerpo del panel | 14 / 20 | 400 | Tabla densa: `wdth` 90 |
| Párrafo, nota larga | 16 / 24 | 400 | Máximo 66 caracteres por línea |
| Título de tarjeta | 18 / 24 | 600 | |
| Cifra de ficha | 22 / 28 | 500 | |
| Cifra de tarjeta, título de sección | 28 / 34 | 500 | `letter-spacing: -.01em` |
| Saludo o título de pantalla | 40 / 46 | 500 | `letter-spacing: -.02em` |
| Cifra protagonista | 48 / 52 | 500 | `letter-spacing: -.02em`; una por pantalla |

**Escala de la app del operario:** 13 · 15 · **17** (base) · 20 · 24 · 32 (código de la
máquina) · 56 (ganancia, cifra protagonista) · 64 (dígitos del teclado).

- En modo noche el texto de 16 px o menos sube a peso 450 (la fuente es variable) y
  `letter-spacing: .005em`: el texto claro sobre oscuro se ve más delgado.
- Etiquetas en tipo oración, nunca en mayúscula espaciada.
- `text-wrap: balance` en títulos; `text-wrap: pretty` en párrafos.
- En quetzales del panel, los centavos van en `--tinta-3`; en la app, completos.

### 6.3 Espaciado, forma y elevación

- Escala de espaciado base 4: `4 · 8 · 12 · 16 · 20 · 24 · 32 · 40 · 56 · 72 · 96`.
  16 px entre tarjetas en escritorio y 12 px en celular; 24 px de relleno interno (20 px en
  celular); 56 px entre bloques de una página larga.
- Radios: **28 px** en tarjetas de escritorio y **24 px** en celular, **20 px** en filas
  internas y campos, **completo** en píldoras, botones y botones de ícono. Un radio por nivel,
  sin mezclar.
- Bordes: las tarjetas y las filas internas del panel no llevan borde; la tarjeta se separa
  del fondo por aire y por un contraste de 1.23:1, suficiente porque no es un control. Todo
  lo que hay que distinguir para actuar lleva `--linea-fuerte` (≥ 3:1, WCAG 1.4.11): la línea
  inferior de 2 px de los campos, las barras de días pasados en las gráficas y el borde de
  1.5 px de las tarjetas que se tocan en la app del operario. Las tablas separan filas con
  `--linea-suave` y su encabezado con una línea inferior, sin fondo.
- `--tinta-3` solo sobre la tarjeta y en texto de 24 px o más; nunca sobre `--superficie-2`
  ni sobre el fondo.
- Enlaces siempre subrayados (1 px, separación 3 px), en cualquier paleta.
- Selección: fondo `--marca-100`, borde de 1 px en `--marca-500` y ✓. Nunca se marca con el
  mismo contorno que el foco.
- Elevación: una sola sombra en todo el producto, `0 24px 48px rgb(0 0 0 / .12)`, reservada al
  panel de avisos, menús desplegables y modales. Ninguna tarjeta proyecta sombra.
- Relleno de color: el de los estados semánticos, solo en su versión suave, para chips de
  variación, franjas de alerta y filas marcadas. Nunca como decoración.
- Foco de teclado: contorno de 2 px en `--marca-700` con 2 px de separación. Visible siempre,
  nunca suprimido.

### 6.4 Densidad

| | Escritorio | PWA |
|---|---|---|
| Alto de fila de tabla | 52 px | 64 px |
| Alto de fila interna de tarjeta | 56 px | 96 a 112 px |
| Alto de control y píldora | 40 px | 56 px |
| Botón primario | 40 px | 72 px |
| Texto base | 14 px | 17 px |
| Margen lateral | 24 px | 16 px |
| Ancho del riel lateral | 84 px | — |

El panel en el teléfono toma valores intermedios: filas de lista de 64 px, controles de 40 px
visibles con 44 px de área táctil, texto base de 15 px, margen de 16 px y barra inferior de
64 px en lugar del riel.

### 6.5 El panel en el teléfono

Tres diseños, con cortes en `em` para que el zoom al 200 % en escritorio también pase al
diseño siguiente en lugar de desbordarse:

| Ancho | Diseño |
|---|---|
| Desde 75 em (1200 px) | **Escritorio:** riel de 84 px y cuadrícula de 12 columnas. |
| 48 a 75 em (768–1199 px) | **Tableta:** el riel se queda; cuadrícula de 8 columnas; las filas de dos tarjetas se apilan; las tablas guardan sus columnas de menor prioridad detrás de ↗. |
| Menos de 48 em (768 px) | **Teléfono:** una columna, con las reglas de abajo. |

En el teléfono:

- **Navegación:** el riel pasa a una **barra inferior** de 64 px más el área segura
  (`env(safe-area-inset-bottom)`), con cinco destinos con ícono y etiqueta. Para el dueño:
  Tablero · Máquinas · Producción · Nómina · Más. «Más» abre los demás módulos en una hoja
  inferior. Los destinos cambian con el rol.
- **Barra superior:** «Bastidor», el interruptor de dos íconos, la campana y las iniciales. La
  búsqueda pasa a «Más». Sin migas: el título de la pantalla dice dónde está.
- **Píldoras de sección:** una fila que se desplaza de lado dentro de sí misma, con la activa a
  la vista al entrar. La página nunca se desplaza de lado.
- **Encabezado:** saludo y títulos de 40 px bajan a 28 px. La cifra protagonista se queda en
  48 px: «1,300,180» ocupa unos 230 px.
- **Orden:** una columna en el orden de prioridad de la pantalla, no en el del escritorio leído
  de izquierda a derecha. En el tablero: La planta ahora → Hoy → La quincena. El orden del
  código es el mismo, para que el teclado y el lector de pantalla lean igual que el ojo.
- **La planta ahora:** las máquinas **detenidas** van abiertas, en una fila de dos niveles:
  código, cabezas y estado con «desde» en la primera línea; operario y motivo en la segunda;
  la acción a todo el ancho y la tira del turno a todo el ancho, con marcas solo en 06 · 10 ·
  14 y la línea «ahora». Las que están **corriendo** van compactas: código, iniciales, puntadas
  terminadas y su tira; tocarla la abre. Nada se esconde; cambia cuánto ocupa.
- **Tablas:** pasan a lista de filas internas: la primera columna como título, dos o tres
  cifras clave a la derecha y el resto al abrir la fila. Excepción: la **planilla de nómina**
  sigue siendo planilla, porque así la conoce el dueño. Arriba va un resumen (total a pagar,
  complementos, quién no llega al mínimo) y debajo la planilla, con la primera columna fija,
  desplazamiento lateral dentro de su tarjeta y la señal visible «Deslice para ver las
  9 columnas →».
- **Gráficas:** las 15 barras de la quincena caben en la tarjeta: a 390 px, barras de 14 px
  con 7 px de separación (308 de 318 px útiles); a 360 px, barras de 12 px. El eje rotula 1 · 5 · 10 · 15 y el globo se queda. La tira del turno no baja de 12 px
  de alto.
- **Tacto:** todo control tiene al menos 44 × 44 px de área táctil, aunque se vea de 40 px; el
  botón ↗ también. Nada depende de pasar el cursor: lo que en escritorio aparece al pasar
  (el detalle de un tramo de la tira, el valor de una barra) aparece al tocar.
- **Panel de avisos:** hoja inferior a todo el ancho, con las acciones al alcance del pulgar.
  Lo que toca dinero sigue abriendo su confirmación.
- **Lo que se arma en escritorio:** las altas y ediciones largas (`C2`, `D2`, `G2`, `I3`), el
  constructor de informes (`K1`) y la configuración (`L1`, `L2`) abren en el teléfono, con la
  nota «Esta pantalla es más cómoda en una computadora», y siguen funcionando. Nunca se
  bloquean.

**La app del operario en la tableta compartida** no cambia de tamaños: una columna de 560 px
como máximo, centrada. En horizontal, «Su ganancia hoy» va a la izquierda y «Mis máquinas» a
la derecha.

## 7. Movimiento

Con todo en tinta y gris, el movimiento pesa más: en una pantalla quieta, lo único que se mueve
es lo único que mira la gente. Por eso el sistema tiene poca animación y toda ella significa
algo.

**Criterio único:** una animación se justifica si comunica **estado, causa o continuidad**.
Si solo adorna, se quita.

### 7.1 Tokens de movimiento

```
--dur-instante   90ms     retroalimentación táctil, cambio de fondo al pulsar
--dur-rapido    140ms     entrada y salida de chips, avisos, menús
--dur-base      200ms     cambio de estado, apertura de paneles
--dur-pausado   320ms     barras que crecen, transición entre pasos
--dur-cifra     420ms     conteo animado de una cifra
--dur-ambiente  2400ms    pulsos que indican que algo está vivo

--sal    cubic-bezier(.2, 0, 0, 1)     entra rápido y asienta suave. Curva por defecto.
--ent    cubic-bezier(.4, 0, 1, 1)     para salidas: acelera y se va
--suave  cubic-bezier(.4, 0, .2, 1)    para lo ambiental, simétrico
```

Reglas duras: **ningún rebote**, ninguna escala mayor a `1.02`, ninguna rotación decorativa,
ningún desplazamiento mayor a **8 px**, y nada fuera de las animaciones ambientales dura más
de 420 ms.

### 7.2 Estados de máquina · el movimiento como dato

Es la pieza más importante del sistema de movimiento: el estado de la máquina se distingue
**por color, por forma y por comportamiento**. A un metro de distancia, el comportamiento es lo
primero que se percibe.

El estado sale del **último registro**, no de un sensor, y por eso siempre va acompañado de
«desde HH:MM»:

| Estado | Se registra cuando |
|---|---|
| Corriendo | El operario tocó Comenzar o Reanudar y la corrida sigue abierta |
| Parada | No hay corrida abierta, o el operario tocó Pausar; muestra el motivo del paro |
| En falla | El operario reportó un paro por «falla de la máquina» |
| En mantenimiento | Hay una orden de mantenimiento abierta para la máquina |
| Sin datos | No hay ningún registro de la máquina en el turno |

| Estado | Forma | Movimiento | Por qué así |
|---|---|---|---|
| **Corriendo** | punto lleno | Pulso de opacidad `1 → .45 → 1`, `--dur-ambiente`, infinito, curva `--suave` | La máquina está viva. El ritmo lento late sin distraer. |
| **Parada** | punto lleno | **Ninguna.** Absolutamente quieto. | La quietud *es* la señal. Una máquina parada en una pantalla donde todo lo demás late se ve al instante. |
| **En falla** | triángulo | Doble parpadeo de 120 ms, y luego 3 s de reposo. Nunca parpadeo continuo. | Llama la atención sin agotarla ni volverse ruido de fondo. |
| **En mantenimiento** | cuadrado | Barrido diagonal lento de un brillo tenue sobre la forma, 3 s, infinito | Dice «se está trabajando en ella», distinto de «está produciendo». |
| **Sin datos** | punto hueco | Desvanecimiento muy lento `1 → .35 → 1`, 4 s | Señal de incertidumbre, no de alarma. Se nota que el sistema no sabe. |

### 7.3 Movimiento de los componentes

| Componente | Animación | Duración y curva |
|---|---|---|
| **Contador de puntadas** | Conteo animado desde el valor anterior al nuevo, dígito a dígito. Con `tabular-nums` el ancho no salta. Solo al llegar dato nuevo, nunca al cargar la página. | `--dur-cifra`, `--sal` |
| **Barra de mínimo legal** | Crece desde 0 hasta su valor al aparecer. Si el operario cruza el umbral, la marca del umbral da un destello único. | `--dur-pausado` / destello `--dur-base` |
| **Semáforo de mantenimiento** | Al superar el 90 % del intervalo, la barra late muy suave cada 4 s. Por debajo del 90 %, quieta. | ambiente, `--suave` |
| **Chip de verificación** | Al resolverse la corrida, cruza de `pendiente` a su veredicto con opacidad y 4 px de desplazamiento vertical. | `--dur-rapido`, `--sal` |
| **Fila de tabla** | Una fila nueva entra con opacidad y 4 px. Una fila que cambia de estado destaca su fondo 600 ms y vuelve. | `--dur-rapido` |
| **Franja de alerta** | Entra desde arriba con 8 px y opacidad. Al resolverse, colapsa su altura. | `--dur-base`, `--sal` |
| **Botón** | Cambio de fondo al pulsar, sin escala ni sombra. | `--dur-instante` |
| **Modal y panel lateral** | Fondo se oscurece; el panel entra 8 px. Sin escala. | `--dur-base` |
| **Panel de avisos** | Entra 8 px bajo la campana con opacidad; el punto de no leído desaparece al abrir el aviso. | `--dur-base`, `--sal` |
| **Tarjeta** | No se eleva ni escala al pasar el cursor. Solo su botón ↗ cambia de fondo. | `--dur-instante` |
| **Esqueleto de carga** | Barrido suave de 1.4 s. **Nunca un indicador giratorio** en ninguna pantalla del sistema. | ambiente |

### 7.4 Movimiento en la PWA

En el piso de planta el movimiento tiene una función extra: confirmar sin obligar a leer.

| Momento | Animación | Nota |
|---|---|---|
| **Marco de escaneo** | Respira suavemente, 2 s. Al reconocer el código, colapsa al centro en 180 ms. | Acompañado de sonido y vibración: el operario no siempre puede mirar la pantalla. |
| **Pasos de la corrida** | Avance lateral de 8 px más opacidad entre máquina → diseño → contador. Al retroceder, en sentido inverso. | Es lo único del sistema que usa transición de pantalla, porque comunica secuencia. |
| **Teclado numérico** | Cada dígito responde con cambio de fondo de 90 ms. Sin escala. | Con guantes, el rebote se percibe como error. |
| **Resultado de verificación** | La marca de veredicto entra con opacidad y 4 px; la cifra de desviación cuenta desde 0. | Un solo momento, sin celebración. |
| **Ganancia del día** | Cuando llega una corrida nueva, la cifra cuenta hacia arriba. | Es el momento que hace que el operario adopte la app. Se cuida, pero no se festeja. |
| **Cola sin conexión** | El contador de pendientes baja con un desplazamiento vertical corto por cada envío. | Nunca un spinner: se ve el progreso real. |

### 7.5 Qué no se anima

- Transiciones entre pantallas del panel de administración. Es una herramienta, no una
  presentación.
- Aparición escalonada de listas o tarjetas.
- Nada disparado por desplazamiento de la página. Todo lo que hay que leer se ve al cargar.
- Números que cuentan solos al abrir la pantalla. La cifra se anima cuando **cambia**, no
  cuando aparece.
- Cualquier animación en pantallas de nómina y de dinero, salvo la entrada de un aviso. El
  movimiento resta seriedad justo donde más se necesita.

### 7.6 Accesibilidad

Con `prefers-reduced-motion: reduce` el sistema conserva el significado y elimina el
movimiento:

- Los pulsos ambientales se detienen; **el estado sigue distinguiéndose por color y forma**,
  que es la razón de que la forma exista.
- Los conteos animados saltan directo al valor final.
- Las barras aparecen en su valor, sin crecer.
- Las transiciones se reducen a un cambio de opacidad de 90 ms.

Ninguna información depende únicamente del movimiento. Es la prueba que hay que pasar antes de
dar por buena cualquier animación de este sistema.

## 8. Componentes

**Base:** botón (primario, secundario, terciario, destructivo), campo de texto, selector,
selector de fecha y rango, casilla, interruptor, píldora de estado, etiqueta, tabla de datos,
paginación, migas, pestañas, barra lateral, modal, panel lateral, aviso en línea, notificación
temporal, estado vacío, esqueleto de carga.

**Del estilo moderno** — definen el lenguaje de §2 y se usan igual en todo el panel:

| Componente | Qué hace |
|---|---|
| **Tarjeta** | Contenedor de un tema: `--superficie`, radio 28 px, sin borde ni sombra, título arriba a la izquierda y botón ↗ arriba a la derecha. |
| **Fila interna** | Elemento repetido dentro de una tarjeta: `--superficie-2`, radio 20 px, sin borde. |
| **Riel lateral** | 84 px, un ícono en círculo de 44 px por módulo con su etiqueta de 11 px debajo; activo relleno en tinta. |
| **Píldoras de sección** | Subsecciones del módulo, máximo 5; la activa rellena en tinta. |
| **Cifra con centavos** | Cifra protagonista de 48 px en el panel y 56 px en la app, una por pantalla como máximo; en quetzales, los centavos en `--tinta-3`. |
| **Chip de variación** | Píldora verde o roja suave con el porcentaje, y la base de comparación escrita al lado. |
| **Gráfica de barras con globo** | Barras redondeadas; días cerrados en `--linea-fuerte`; hoy en dos tramos, lo terminado sólido en `--marca-500` y lo en curso rayado encima; globo en tinta con las dos cifras exactas. |
| **Iniciales apiladas** | Personas en turno en círculos de 32 px, con «+N». Nunca fotos. |
| **Panel de avisos** | Bajo la campana: pestañas Todas / Sin leer, punto de no leído en `--marca-500`, acciones en línea. Lo que toca dinero abre su confirmación. |
| **Interruptor día / noche** | Dos segmentos en píldora, «Día» y «Noche», el vigente relleno en tinta: 40 px en el panel, solo íconos de 44 px en el teléfono, 56 px de alto con palabra en la app. La elección se guarda en la cuenta (§6.1). |
| **Barra inferior** | Solo en el panel en el teléfono: 64 px más el área segura, cinco destinos con ícono y etiqueta, el activo relleno en tinta (§6.5). |

**Propios del dominio** — son los que dan identidad al sistema y hay que diseñarlos con cuidado:

| Componente | Qué hace | Movimiento |
|---|---|---|
| **Ficha de máquina** | Código, modelo, **sus cabezas dibujadas** (cuadrados llenos si está corriendo, contorno si no), estado con «desde HH:MM», operario, puntadas terminadas hoy, su tira del turno y el avance hacia el próximo mantenimiento. En la parrilla de máquinas su ancho es proporcional al número de cabezas. Es la unidad que se repite en tablero, máquinas y app. | Hereda el del estado (§7.2) |
| **Tira del turno** | Barra de 06:00 a 14:00 con un tramo por trabajo: terminado sólido en `--marca-500`, en curso rayado, paro en aviso, falla en crítico, mantenimiento en su color; huecos sin registro en la pista. Línea «ahora» y marcas de hora una vez por tarjeta. Cada tramo da diseño, horario y puntadas al tocarlo. Es la pieza que identifica al sistema. | El tramo en curso crece con el reloj, sin animación propia |
| **Contador de puntadas** | Cifra grande con `tabular-nums` y separador de miles. Muestra puntadas de corridas cerradas; las de una corrida en curso aparecen aparte como «esperadas», rayadas. | Conteo animado al cambiar |
| **Chip de verificación** | `ok` / `revisar` / `discrepancia` / `sin declarar`, con la desviación en porcentaje. Sin relleno: marca coloreada más texto en tinta. | Cruce al resolverse |
| **Firma de diseño** | Código, puntadas en 28 px y una tira con un segmento por cambio de color. Se repite en catálogo, corrida y verificación. | Ninguno |
| **Barra de mínimo legal** | Progreso del operario hacia el umbral de 2,453,721 puntadas quincenales, con marca del umbral. Pasa a `--critico` si va por debajo del ritmo. | Crece al aparecer; destello al cruzar |
| **Semáforo de mantenimiento** | Avance porcentual hacia el intervalo, con aviso al 90 %. | Latido suave por encima del 90 % |
| **Escáner QR** | Visor de cámara a pantalla completa con marco, con alternativa de tecleo manual siempre visible. | Marco que respira; colapso al leer |
| **Teclado numérico grande** | Para capturar el contador en la PWA. Dígitos de 64 px, sin teclado del sistema. | Fondo de 90 ms por dígito |
| **Selector de rango de fechas** | Con cinco atajos: hoy, esta semana, esta quincena, este mes, rango libre (ayer se elige desde el rango libre). Es el control más usado de todo el panel. | Apertura de 200 ms |

## 9. Patrones

**Vocabulario en pantalla.** La interfaz dice **trabajo** («Comenzar trabajo», «Trabajos de
hoy»), como la cotización que conoce el cliente. «Corrida» es el término interno de estos
documentos y no aparece en pantalla.

**Dato cerrado y dato en curso.** La captura es manual: el operario declara el diseño, toca
Comenzar, Pausar, Reanudar o Finalizar, y al finalizar teclea el contador de la máquina. Por
eso:

- Toda cifra de «hoy» o del período cuenta **solo corridas cerradas** y lo dice en su
  etiqueta («Puntadas de hoy · de trabajos terminados»).
- Una corrida abierta muestra su hora de inicio, el tiempo transcurrido y sus puntadas
  **esperadas** (repeticiones planeadas × puntadas del diseño), con la palabra «en curso».
- En gráficas y fichas, lo cerrado va **sólido** y lo en curso **rayado** encima. El rayado
  significa siempre «todavía no medido» y no se usa para nada más.
- El tablero dice cuándo fue el último registro («Último registro: 13:20 · BOR-06 comenzó
  HUI-002 · hace 30 min»), para que nadie confunda una planta tranquila con una pantalla sin
  datos nuevos.
- No hay tasas por minuto ni pulsos derivados de la velocidad real: el sistema no la conoce.

**Tablas de datos.** Encabezado fijo. Números a la derecha con `tabular-nums`. Fila con `hover`
sutil. Ordenamiento por columna. Filtros arriba, no en un panel escondido. Total al pie cuando
la columna es sumable. Nunca paginación menor a 50 filas en escritorio: el dueño quiere ver.

**Formularios.** Una columna. Etiqueta arriba del campo, nunca dentro. Validación al salir del
campo, no mientras se escribe. El error dice qué pasó y cómo arreglarlo. Los campos con formato
propio —DPI, teléfono, puntadas— validan y dan formato en vivo.

**Estados vacíos.** Dicen qué falta y ofrecen la acción. «Aún no hay trabajos terminados hoy.
Aparecen aquí cuando un operario finaliza uno en su teléfono.» Si hay trabajos en curso, el
vacío lo dice: «Aún no hay trabajos terminados hoy · 3 en curso desde las 06:05».

**Nómina como planilla.** El cálculo de la quincena se ve como la planilla de papel que ya
conoce el dueño: encabezado en dos niveles con los grupos Operario · Producción · Devengado ·
Descuentos · A pagar, primera columna fija, fila de totales sobre línea doble. Las
explicaciones de ley van en subfilas visibles, no al pasar el cursor, porque el dueño revisa
desde el teléfono.

**Máximo cinco píldoras en una fila.** Si un filtro necesita más opciones, pasa a selector.

**Confirmaciones destructivas o financieras.** Modal que nombra la consecuencia exacta y exige
una acción deliberada. Cerrar una nómina: «Se cerrará la quincena del 1 al 15 de septiembre
con 5 operarios y Q11,982.63 a pagar. Después de cerrar no se pueden editar los trabajos de
este período. Hay 2 trabajos en curso: se pagarán en la quincena en que se finalicen.» Si
quedan discrepancias sin resolver, el botón no cierra: lleva a resolverlas.

**Errores.** Nunca códigos. Nunca «algo salió mal». Siempre qué pasó, qué se hizo con los datos
y qué puede hacer la persona.

### Casos límite

Lo que pasa en una planta real y cada pantalla tiene que resistir. Cada regla nombra la
pantalla donde se diseña.

**Sin conexión en la app (`P8`).** Es el estado normal, no un error.

- Una franja fija arriba, en `--aviso-suave`, nunca un modal: «Sin conexión · 1 registro
  guardado en este teléfono. Se enviará solo al volver la señal. Puede seguir trabajando.»
  Al tocarla, la lista de lo pendiente.
- Cada registro pendiente lleva un reloj y «pendiente»; al enviarse, ✓ y «enviado 13:14».
  La franja desaparece sola cuando la cola llega a cero; no hay botón de reintentar porque
  el reintento es automático.
- Todo se registra con la **hora del toque**, no la de llegada. El servidor guarda las dos.
  Si el reloj del teléfono difiere más de 5 minutos del servidor, el registro llega marcado
  para el supervisor; nunca se corrige en silencio.
- La ganancia del día se calcula en el teléfono y lo dice: «calculada en este teléfono · se
  confirma al enviar».
- Ingreso con gafete sin señal: el teléfono reconoce a los operarios asignados a sus máquinas
  en la última sincronización. Un teléfono nuevo dice «Este teléfono necesita conexión la
  primera vez» y no deja empezar a medias.
- Diseño que no está en el teléfono: «Este diseño no está guardado en el teléfono. Puede
  comenzar igual; se confirma al volver la señal.» El trabajo queda `sin declarar` hasta
  entonces.
- Conflictos al sincronizar (la misma máquina comenzada desde dos teléfonos): se guardan los
  dos registros y el caso va a la bandeja `F2`. Nunca se descarta uno sin avisar.

**Sin noticias de un teléfono (`B1`, `D1`).** Sin sensores, un trabajo largo no manda nada
durante horas, y una planta tranquila se confunde con un teléfono apagado. La app avisa que
sigue viva cada 5 minutos mientras tiene señal. Si una máquina tiene un trabajo en curso y su
teléfono lleva más de 15 minutos sin avisar, la ficha agrega una línea en `tinta-2`: «Sin
noticias del teléfono desde 12:41». No cambia el estado de la máquina, porque no se sabe que
haya cambiado.

**Panel sin conexión.** El dueño en su teléfono con mala señal: franja «Sin conexión. Lo que ve
es de las 13:50.» Las cifras se quedan, con su hora. Lo que toca dinero (autorizar, cerrar,
cambiar tarifas) queda desactivado con la razón escrita: «Autorizar necesita conexión».

**Contador al finalizar (`P5`).** El número se revisa antes de guardar, en la misma hoja,
debajo del número, nunca en un modal:

| Caso | Qué dice la app | Qué puede hacer |
|---|---|---|
| Final menor que el inicial | «Este número es menor que el del inicio (8,412,300). Revise el número que marca la máquina.» | «Corregir número» (principal) o «La máquina se reinició»: pide el número de ahora y el trabajo queda `revisar` para el supervisor. |
| Final igual al inicial | «La máquina no marcó puntadas.» | Corregir el número o «Cancelar el trabajo», que pide motivo. |
| Más de lo que la máquina puede bordar | «Ese número da 527,940 puntadas. BOR-06 no puede bordar tantas en 2 h 7 min: como máximo 101,600. Revise el número.» El máximo es puntadas por minuto × minutos bordando, sin pausas. | Solo corregir. Si el supervisor confirma que el número es correcto, lo registra él en `F2`. |
| Número válido | El resultado de la verificación, ya calculado. | «Guardar». |

El teclado acepta hasta 9 dígitos y pone el separador de miles mientras se teclea. «Guardar»
se desactiva al tocarlo y muestra «Guardando…»; cada registro lleva un identificador propio,
así que un doble toque o un reenvío con mala señal nunca crea dos trabajos.

**Discrepancia vista por el operario (`P5`, `P2`).** La desviación mayor a 3 % no es una falta
del operario: casi siempre es un diseño o unas repeticiones mal declarados.

- En la app se muestra con la forma y el color de aviso, nunca de falla: «Diferencia de
  +4.97 % con lo esperado. Su supervisor lo revisará. Esto no es una falta: a veces el
  diseño declarado no es el que se bordó.»
- Tres botones grandes para decir qué pasó, opcionales: «Cambié de diseño» · «Se rompió el
  hilo y repetí» · «Otra cosa».
- La ganancia de ese trabajo **cuenta con lo medido**, marcada «en revisión». Nunca se le
  quita al operario sin avisar: si el supervisor la corrige, la diferencia aparece en «Mi
  ganancia» como ajuste con su motivo, y el operario recibe el aviso («Su supervisor revisó
  FAJ-010: se pagan 148,800 puntadas»).
- En Inicio, mientras no se resuelva, una fila: «1 trabajo en revisión».

**Corregir después de guardar (`P2`, `F2`).** El operario puede corregir su último registro
durante 15 minutos: la tarjeta del trabajo terminado muestra «Corregir · hasta 13:25». Pasado
ese tiempo, solo el supervisor corrige, desde `F2`, con motivo obligatorio. Toda corrección
deja rastro visible en el trabajo: el valor anterior tachado, el nuevo, quién y a qué hora
(principio 7). Con la quincena cerrada ya no se corrige: la diferencia entra en la quincena
siguiente como ajuste, con referencia al trabajo.

**Turno de noche.** Un turno que cruza la medianoche cuenta para el día en que empezó: «hoy»
de las 02:00 es el turno que comenzó ayer a las 22:00, y la pantalla lo dice («turno nocturno
del domingo 13»).

**Quincena con trabajos abiertos.** Al cerrar, los trabajos en curso no se pagan a medias: se
pagan en la quincena en que se finalizan. La confirmación de cierre lo dice.

**Tableta compartida.** Tras 30 minutos sin uso o al terminar el turno, la app vuelve a pedir
el gafete. Los registros pendientes se conservan aunque cambie la persona.

**Nombres y cifras largas.** Los nombres completos se escriben enteros en fichas, nómina y
constancias, en dos líneas si hace falta («María de los Ángeles Xiloj Tzoc de Chávez»); solo
las filas compactas usan iniciales, con el nombre completo para el lector de pantalla. Las
columnas de cifras se miden para 99,999,999 puntadas y Q999,999.99.

**Carga.** Esqueletos con la forma de lo que viene (filas, barras, tiras), nunca un indicador
giratorio. Si tarda más de 10 segundos, el esqueleto dice qué espera: «Calculando la
quincena…».

**Permisos.** Lo que un rol no puede ver no aparece; lo que puede ver pero no cambiar se
muestra sin el control y con la razón: «Solo el dueño cambia tarifas».

## 10. Inventario de pantallas

37 pantallas. Los identificadores se usan en los prompts del documento 12.

### Panel de administración (escritorio y teléfono)

| ID | Pantalla | Rol |
|---|---|---|
| `A1` | Ingreso al panel | todos |
| `B1` | Tablero general: estado de las máquinas según el último registro, producción cerrada del día, corridas en curso, alertas | dueño, gerencia, supervisor |
| `C1` | Operarios · listado | dueño, RRHH |
| `C2` | Operario · alta y edición, con validación de DPI | dueño, RRHH |
| `C3` | Operario · ficha: producción, ganancia, asignaciones, historial | dueño, RRHH |
| `D1` | Máquinas · parrilla de estado | dueño, supervisor, mtto. |
| `D2` | Máquina · alta y edición | dueño, supervisor |
| `D3` | Máquina · ficha: producción, OEE, mantenimiento | dueño, supervisor, mtto. |
| `D4` | **Asignación de máquinas a operarios** | dueño, supervisor |
| `E1` | **Tarifas de destajo · definir la ganancia** | dueño |
| `E2` | Simulador de ganancia | dueño |
| `E3` | Descuentos y bonificaciones · catálogo | dueño, RRHH |
| `F1` | Corridas del día | dueño, supervisor |
| `F2` | Bandeja de discrepancias | dueño, supervisor |
| `F3` | Órdenes de producción · listado | dueño, gerencia, supervisor |
| `F4` | Orden de producción · detalle y avance | dueño, gerencia, supervisor |
| `G1` | Diseños · catálogo | dueño, gerencia, supervisor |
| `G2` | Diseño · alta desde archivo DST | dueño, supervisor |
| `G3` | Productos · catálogo | dueño, gerencia |
| `G4` | Temporadas · calendario de ferias y fechas | dueño, gerencia |
| `H1` | Nómina · períodos | dueño, RRHH |
| `H2` | Nómina · cálculo del período | dueño, RRHH |
| `H3` | Constancia de pago del operario | dueño, RRHH |
| `H4` | Libro de salarios y planilla IGSS | dueño, RRHH |
| `I1` | Inventario · existencias | dueño, bodega |
| `I2` | Inventario · movimientos | dueño, bodega |
| `I3` | Artículo · alta y edición | dueño, bodega |
| `J1` | Mantenimiento · semáforo por máquina | dueño, mtto. |
| `J2` | Mantenimiento · órdenes | dueño, mtto. |
| `J3` | Mantenimiento · planes y tareas | dueño, mtto. |
| `K1` | Reportes · constructor con rango de fechas | todos menos operario |
| `L1` | Configuración · usuarios y roles | dueño |
| `L2` | Configuración · parámetros legales | dueño |
| `L3` | Auditoría | dueño |

Todas se adaptan al teléfono con las reglas de §6.5. Cuatro se diseñan también en teléfono,
porque son las que el dueño abre fuera de la oficina: `B1` tablero, `D1` máquinas, `H2`
planilla de la quincena y el panel de avisos.

### PWA del operario (móvil)

| ID | Pantalla |
|---|---|
| `P1` | Ingreso por QR de gafete |
| `P2` | Inicio: mis máquinas asignadas y mi ganancia de hoy |
| `P3` | Abrir corrida: escanear máquina, escanear diseño, contador inicial |
| `P4` | Corrida en curso: tiempo, puntadas esperadas, Pausar / Reanudar / Finalizar |
| `P5` | Cerrar corrida y resultado de la verificación |
| `P6` | Reportar paro |
| `P7` | Mi ganancia: día y quincena, con desglose |
| `P8` | Sin conexión y cola de sincronización |

## 11. Contenido real para los diseños

Nada de texto de relleno. Estos son los datos que deben aparecer en todas las pantallas, para
que sean consistentes entre sí. Son **datos de ejemplo** de un solo momento, el **lunes 14 de
septiembre de 2026 a las 13:50**; el detalle completo (trabajos del día, tiras del turno,
puntadas por día, nómina) está en [`13-hoja-del-sistema.md`](13-hoja-del-sistema.md),
prompt 1, y manda sobre esta sección si alguna cifra difiere.

**Fábrica:** planta en Chimaltenango, circunscripción CE2, categoría no agrícola.
Salario mínimo aplicable **Q3,816.90** más bonificación incentivo de **Q250.00**.
Tarifa vigente: **1,500 puntadas = Q1.00**, vigente desde el 1 de enero de 2026.

**Operarios**

| Código | Nombre | DPI | Máquina asignada | Puntadas quincena |
|---|---|---|---|---|
| OP-014 | Juana Ixchop Tzoc | 3056 78914 0401 | BOR-04 | 2,918,400 |
| OP-021 | Marta Chocoj Sical | 4567 81234 0401 | BOR-02 | 3,412,700 |
| OP-007 | Diego Puac Ajanel | 1928 37465 0805 | BOR-01, BOR-06 | 4,105,220 |
| OP-033 | Rosa Elena Batz Quiej | 2233 44556 0803 | BOR-05 | 1,884,900 |
| OP-018 | Manuel Tzunún Coyoy | 6677 88999 0401 | BOR-03 | 2,451,180 |

Rosa Elena Batz Quiej va por debajo del umbral: es el caso que muestra la alerta de complemento
al mínimo.

**Máquinas**

| Código | Marca y modelo | Controlador | Cabezas | spm | Estado |
|---|---|---|---|---|---|
| BOR-01 | Feiya FY-1206 | Dahao BECS-A15 | 6 | 850 | corriendo |
| BOR-02 | Feiya FY-1206 | Dahao BECS-A15 | 6 | 850 | corriendo |
| BOR-03 | Ricoma EM-1010 | propio | 1 | 1,000 | parada |
| BOR-04 | Tajima TMEZ-1501 | Tajima | 1 | 1,000 | corriendo |
| BOR-05 | Yuemei YM-904 | Dahao BECS-285A | 4 | 750 | en falla |
| BOR-06 | Feiya FY-1202 | Dahao BECS-A15 | 2 | 800 | corriendo |
| BOR-07 | Barudan BEXT-Y904 | Barudan | 4 | 900 | en mantenimiento |
| BOR-08 | Richpeace RPEM-1201 | Dahao BECS-A18 | 1 | 900 | sin datos |

**Diseños**

| Código | Nombre | Puntadas | Cambios de color | Región |
|---|---|---|---|---|
| HUI-001 | Huipil Sololá cuello grande | 42,500 | 9 | Sololá |
| HUI-002 | Huipil Quetzaltenango aves | 38,900 | 11 | Quetzaltenango |
| TZU-004 | Tzute Chichicastenango | 21,300 | 7 | Quiché |
| FAJ-010 | Faja Totonicapán greca | 12,400 | 5 | Totonicapán |
| COR-021 | Randa para corte | 8,600 | 3 | Totonicapán |

**Órdenes de producción**

| Código | Producto | Objetivo | Producidas | Compromiso | Temporada | Estado al 14 sep |
|---|---|---|---|---|---|---|
| OP-2026-122 | Huipil Quetzaltenango aves | 120 | 88 | 15 sep 2026 | Feria de Xelajú | **Vence mañana**: faltan 32 y hay 16 en curso |
| OP-2026-119 | Faja Totonicapán greca | 500 | 132 | 25 sep 2026 | Feria de Totonicapán (29 sep) | **En riesgo**: necesita 37 prendas por día; hoy hizo 36 con BOR-05 en falla |
| OP-2026-114 | Huipil Sololá cuello grande | 240 | 186 | 2 oct 2026 | Regular | A tiempo |
| OP-2026-121 | Tzute Chichicastenango | 90 | 90 | 20 jul 2026 | Regular | Entregada |

Una orden con el compromiso vencido y sin terminar se marca **Vencida** en `--critico`, con
los días de atraso; ninguna lo está hoy.

**Corrida de ejemplo con discrepancia:** BOR-05, Rosa Elena Batz Quiej, diseño declarado
FAJ-010, 12 repeticiones, esperado `148,800`, medido `156,200`, desviación **+4.97 %**,
veredicto `discrepancia`.

**Mantenimiento pendiente:** BOR-01, lubricación de barras de aguja, intervalo `2,500,000`
puntadas, lleva `2,372,500`, avance **94.9 %**, en aviso: le faltan 127,500, justo las
esperadas del trabajo en curso. El aceite diario de la lanzadera no va en el semáforo (avisaría
cada día): es parte de la lista de arranque del turno.

**Inventario:** HIL-1147 hilo rojo granate **agotado** (0 de un mínimo de 20 conos), causa del
paro de BOR-03; HIL-1520 verde quetzal y AGU-7511 agujas 75/11, bajo el mínimo.

**Nómina al 14 de septiembre:** 5 operarios, destajo Q9,848.26, séptimo Q1,641.38,
complementos al mínimo Q444.40 (Rosa Q442.42, Manuel Q1.98), bonificación incentivo Q625.00,
IGSS laboral Q576.41, **neto Q11,982.63**; cuotas patronales (IGSS 10.67 %, INTECAP 1 %, IRTRA
1 %) Q1,512.04.

## 12. Qué evitar

- Terracota sobre crema, degradados morado-azul, tipografías Inter o Space Grotesk, emoji como
  marcadores de sección, todo centrado, tarjetas dentro de tarjetas, sombras en las tarjetas,
  efecto vidrio y tarjetas con barra de acento a la izquierda. Es el aspecto que delata un diseño generado sin criterio.
- **Patrones de huipil como textura de fondo.** El textil es el producto de la fábrica, no la
  decoración del software. Si aparece un motivo, es una fotografía real de una prenda dentro de
  la ficha del diseño que le corresponde, nunca un adorno de la interfaz.
- Iconos alegres o ilustraciones simpáticas en pantallas de dinero. Una nómina no se ilustra.
- Rankings públicos de operarios. Los indicadores individuales son insumo de nómina y de
  conversación, no un marcador para exhibir en el piso.
- Abreviar cifras. `5.7M` no es aceptable en ninguna pantalla de este sistema.
- **Movimiento decorativo.** Rebotes, escalas grandes, rotaciones, parallax, aparición
  escalonada de listas, animaciones disparadas por desplazamiento y cualquier indicador
  giratorio. Con todo en tinta y gris, el movimiento gratuito se nota el doble.
- **Copiar la referencia:** textos en inglés, fotos de personas, íconos sin etiqueta, verde lima
  como color principal (se confunde con «corriendo»), gráficas que no responden una pregunta.
- **Encoger el escritorio en el teléfono.** Una pantalla de 1280 px reducida a 360 px deja el
  texto de 14 px en menos de 4 px. En el teléfono se reordena (§6.5), no se reduce.
- **Moderno mal entendido:** bajar el contraste, esconder acciones detrás de menús, quitar
  las etiquetas de los campos o encoger los objetivos táctiles de la PWA. El estilo es visual;
  la legibilidad en planta no se negocia.
