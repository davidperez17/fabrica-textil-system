# 13 · Hoja del sistema: estilo moderno, color añil y una pantalla por sección

Brief y prompts para producir la **hoja del sistema**: una página que Servicios Digitales le
envía a Josue Chuc para que vea cómo se verá Bastidor —el estilo, su color y una pantalla de
cada sección de la aplicación— y dé el visto bueno antes de diseñar el resto de pantallas.

La dirección visual es **moderna**, tomada como referencia (no como copia) de un tablero
financiero de tarjetas blancas sobre gris claro, navegación en píldoras y cifras grandes. Lo
que se toma, lo que se adapta y lo que no se toma está en §1.3. La dirección completa vive en
el [brief de diseño](11-brief-de-diseno.md) §2; este documento la aplica a la hoja.

> **Color aprobado: A · Añil** (20 oct 2026). Las propuestas B · Jade y C · Grafito quedan
> descartadas; las razones están en §1.4 para no reabrir la decisión.

---

## 1. Brief

### 1.1 Objetivo

Una sola decisión, comunicada por WhatsApp: el **visto bueno del estilo**, viéndolo aplicado
a pantallas reales de su fábrica, una por sección, en día y en noche, sin tener que imaginar
nada. El color ya está aprobado.

### 1.2 Público

- **Quien decide:** el dueño de la fábrica (Josue Chuc). No es diseñador: decide por lo que ve,
  no por códigos hexadecimales.
- **Dónde la abre:** en el teléfono, desde el enlace de WhatsApp. Debe verse bien primero en
  celular, luego en escritorio, y poder guardarse en PDF. A 360 px, una pantalla de escritorio
  reducida queda a un cuarto de su tamaño y un texto de 14 px se ve de 3.6 px: en celular la
  hoja no puede confiar en reducir (§1.8).
- **Tono:** trato de usted, frases cortas, sin jerga («color principal», no «acento»;
  «modo noche», no «tema oscuro»).

### 1.3 La referencia: qué se toma y qué no

| De la referencia se toma | En Bastidor se adapta así | No se toma |
|---|---|---|
| Lienzo gris claro con tarjetas blancas muy redondeadas, sin borde ni sombra | Una tarjeta por tema. Nunca una tarjeta dentro de otra: dentro de la tarjeta, filas en `superficie-2` | Sombras en las tarjetas, efecto vidrio, degradados |
| Navegación de sección en píldoras; la activa rellena en negro | Píldoras para las subsecciones del módulo (Resumen · Máquinas · Trabajos) | Más de 5 píldoras en una fila |
| Riel lateral de íconos en círculo; el activo en negro | El riel lleva **etiqueta corta debajo de cada ícono**: el dueño no tiene que adivinar | Íconos sin etiqueta |
| Saludo grande con migas encima («Inicio → Tablero») | «Buenas tardes, Josue» (según la hora) y la fecha con el turno | Texto en inglés |
| Cifra protagonista enorme, con los decimales atenuados | En el panel, quetzales con centavos atenuados (`Q866`**`.79`**); en la app del operario, completos, porque se leen al sol; puntadas siempre enteras | Abreviar (`5.7M`), decimales en puntadas |
| Chip de variación en píldora (+7.5 %, −11 %) | Verde suave si mejora, rojo suave si empeora, con la base de comparación escrita al lado | Variaciones sin decir contra qué se comparan |
| Barras grises con un tramo en negro y una barra destacada rayada en color, con globo negro encima | Puntadas por día de la quincena: días cerrados en gris, hoy en el color principal; **lo cerrado sólido y lo que sigue en curso rayado encima**, con globo «1,300,180 cerradas · 368,300 en curso». El rayado significa siempre «en curso, todavía no medido» | Gráficas de adorno que no responden a una pregunta |
| Botón circular ↗ en la esquina de cada tarjeta | Significa siempre «abrir el detalle» de esa tarjeta | Usarlo con otro significado |
| Avatares apilados con «+5» | **Iniciales** en círculo de los operarios en turno | Fotos de personas (datos personales; ver brief 11 §4) |
| Panel de avisos con pestañas Todas / Sin leer, punto de no leído y acciones en línea | Avisos de planta: falla de máquina, discrepancia, anticipo por autorizar. Las acciones de dinero abren su confirmación: **nada que toque dinero se autoriza con un solo toque** | Punto de no leído en rojo (el rojo es «crítico») |
| Rango de fechas en píldora con ícono de calendario | Con los atajos del brief: hoy, ayer, esta semana, esta quincena, este mes, rango libre | — |
| Acento verde lima | El color principal es el **añil** del corte guatemalteco | Verde como color principal: se confunde con «corriendo» y con «correcto» |

### 1.4 Por qué añil

Se eligió entre tres propuestas que cumplían AA. El criterio no fue el gusto sino lo que la
planta necesita: que el color principal **no se confunda con ningún color de estado**, que el
sistema se vea **propio** y no como la referencia, y que la selección y los enlaces se
distingan sin depender solo del subrayado. Distancia de color (ΔE, CIELAB) entre el color de
las barras (`marca-500`) y cada color de estado, día · noche:

| | Corriendo (`ok`) | Atención (`aviso`) | Falla (`critico`) | Mantenimiento |
|---|---|---|---|---|
| **A · Añil** | 66 · 69 | 95 · 97 | 84 · 64 | **21 · 20** |
| B · Jade | **26 · 33** | 76 · 81 | 85 · 68 | 61 · 51 |
| C · Grafito | 36 · 43 | 65 · 68 | 66 · 46 | 45 · 35 |

- **B · Jade, descartada:** queda a 26 del verde de «corriendo», el estado más frecuente. En
  la tira del turno, los tramos terminados en jade quedarían junto a los puntos verdes de las
  máquinas que corren: «terminado» y «corriendo» se confunden justo en la pieza que
  identifica al sistema. No se arregla sin mover el verde, que es universal para «en marcha».
- **C · Grafito, descartada:** el mejor contraste, pero sin color la selección queda casi
  igual que una fila interna (1.03:1), los enlaces solo se distinguen por el subrayado
  (1.22:1 contra el texto) y la barra de hoy solo por el gris. Además es la más parecida a la
  referencia, y la dirección pide un sistema propio.
- **A · Añil, elegida:** lejos de los estados que importan (corriendo, atención, falla); la
  selección y los enlaces se distinguen por color además de por forma; sale del azul del
  corte, así que es propia. Su único acercamiento es al morado de mantenimiento (21), que no
  se corrige: llevar mantenimiento hacia el ciruela lo acercaría al rojo de falla (35 a 49),
  y confundir falla con mantenimiento es peor. Se resuelve con forma: mantenimiento siempre
  con su cuadrado, y el añil nunca se usa para un estado.

### 1.5 La paleta: A · Añil

Medida a WCAG 2.1. Texto normal ≥ 4.5:1; la barra destacada de las gráficas, como elemento
gráfico, ≥ 3:1.

| Par medido | Día · noche |
|---|---|
| Botón primario: superficie sobre tinta (día) · fondo sobre tinta (noche) | 18.0 · 15.5 |
| Color principal (`marca-700`) sobre superficie | 11.0 · 6.3 |
| Selección (`marca-900` sobre `marca-100`) | 11.6 · 7.0 |
| Barra destacada y tramos terminados (`marca-500` sobre superficie) | 5.8 · 4.3 |
| Texto secundario sobre fila interna (`tinta-2` sobre `superficie-2`) | 5.8 · 5.3 |
| Texto secundario sobre fondo (migas, fecha) | 5.4 · 7.3 |
| **Línea fuerte** sobre fila interna y sobre tarjeta (campos, barras pasadas, bordes de la app) | ≥ 3.0 |
| Tarjeta sobre fondo | 1.23 · 1.22 |

La tarjeta sobre el fondo no pasa de 1.23:1 a propósito: la separa el aire y no es un
control. Todo lo que el usuario tiene que distinguir para actuar —campos, barras de una
gráfica, tarjetas que se tocan en la app— lleva `linea-fuerte` (≥ 3:1, WCAG 1.4.11).

`tinta-3` mide entre 3.1 y 3.4:1 sobre la tarjeta: solo se usa en texto de 24 px o más (los
centavos atenuados de una cifra grande) o en texto no esencial. Nunca en etiquetas ni en datos.

**A · Añil.** Azul profundo del corte guatemalteco. Sobria, formal, neutros fríos azulados.

```
claro   marca-900 #1B2A4A · marca-700 #2B3A67 · marca-500 #4A63A8 · marca-100 #E3E8F4
        fondo #E7E8EB · superficie #FFFFFF · superficie-2 #EDEFF3 · línea #D9DDE4
        línea suave #E8EBF0 · tinta #14171C · tinta-2 #565D68 · tinta-3 #858D99
        línea fuerte #838A96
noche   marca-900 #B3C4EC · marca-700 #8FA6DE · marca-500 #6E86C4 · marca-100 #293553
        fondo #101318 · superficie #22262B · superficie-2 #2A2F36 · línea #363A3E
        línea suave #2C3035 · tinta #E8EAEE · tinta-2 #9BA3AF · tinta-3 #6C7480
        línea fuerte #707883
```

**Colores de estado** (claro / noche), independientes del color principal:

```
ok #2E6F4E / #6FBF8E        ok-suave #E2F0E7 / #17301F       5.1 · 6.4 : 1
aviso #9A6400 / #E0A63C     aviso-suave #F7EDD9 / #33270F    4.3 · 6.7 : 1
critico #B0322B / #E4837A   critico-suave #F7E4E2 / #3A2523  5.1 · 5.3 : 1
mantenimiento #6D4C9F / #B49AE0
```

`aviso` sobre `aviso-suave` en día queda en 4.3:1: en chips y franjas de aviso, el texto va
en `tinta` y el color de aviso solo en la forma.

Descartados como color principal y por qué (para no reabrirlos): jade (choca con
«corriendo»), grafito (sin color, la selección no se distingue), rojo o vino (choca con
«crítico»), morado o ciruela (chocan con «mantenimiento» y con «crítico»), ámbar o terracota
(choca con «atención»), verde lima de la referencia (choca con «corriendo»), el azul de
Servicios Digitales (el sistema es del cliente, no nuestro).

### 1.6 Contenido de la hoja

1. **Portada.** «Bastidor · Hoja del sistema», «Estilo, color y una pantalla de cada
   sección», «Preparado para Josue Chuc», fecha, logo de Servicios Digitales pequeño.
2. **Cómo revisarla.** Tres consejos: mírela en el celular dentro de la planta; pruebe el modo
   noche; fíjese en que una máquina en falla se vea al instante en cada pantalla.
3. **Barra fija.** Interruptor Día / Noche de dos segmentos y un menú «Ir a la sección». El
   interruptor cambia toda la página en vivo, pantallas incluidas.
4. **El estilo.** Muestras del color añil y de los neutros, y las piezas del estilo, sueltas:
   tarjeta, píldoras, riel, botón ↗, cifra con centavos atenuados, chip de variación, barras
   con globo, iniciales, rango de fechas, panel de avisos, estados de máquina, botones y campo.
5. **Las pantallas, una por sección**, cada una con su número, para qué sirve, quién la usa,
   la pantalla en su marco y dos o tres notas «Fíjese en…»:

   | # | Sección | Pantalla | Prompt |
   |---|---|---|---|
   | 1 | Tablero | `B1` Tablero general, el mismo con el panel de avisos abierto, y `B1·T` el tablero en el teléfono del dueño | 2 |
   | 2 | Operarios | `C3` Ficha de Diego Puac Ajanel | 3 |
   | 3 | Máquinas | `D1` Parrilla de máquinas y `D4` Asignación de máquinas | 3 |
   | 4 | Ganancias | `E1` Tarifas de destajo | 4 |
   | 5 | Producción | `F2` Bandeja de discrepancias | 4 |
   | 6 | Catálogo | `G1` Diseños | 5 |
   | 7 | Nómina | `H2` Cálculo de la quincena | 5 |
   | 8 | Inventario | `I1` Existencias | 6 |
   | 9 | Mantenimiento | `J1` Semáforo por máquina | 6 |
   | 10 | Reportes | `K1` Constructor de informes | 7 |
   | 11 | Configuración | `L1` Usuarios y roles | 7 |
   | 12 | Ingreso | `A1` Ingreso al panel | 7 |
   | 13 | App del operario | `P2` Inicio, `P4` Trabajo en curso y finalizar (con el número que no cuadra), `P8` Sin conexión, `P7` Mi ganancia | 8 |

   En celular, cada pantalla de escritorio se ve como miniatura y, debajo, **De cerca**: los
   detalles de sus notas «Fíjese en…» a tamaño real. Las de la app se ven sin marco, a todo el
   ancho, como en el teléfono del operario.

6. **Día y noche lado a lado.** La misma ficha de máquina en falla y la misma gráfica en los
   dos modos, independiente del interruptor.
7. **Por qué estos colores.** El añil y los colores de estado, con una línea de por qué: la
   falla, la atención y lo que corre nunca se confunden con el color principal.
8. **Cómo continuamos.** Dos botones de WhatsApp: «Apruebo el estilo de Bastidor» y «Quiero
   ajustar algo», que abre el mensaje con la lista de secciones para que marque cuál.

### 1.7 Datos de la hoja

Son **datos de ejemplo**, no registros de la fábrica, y la hoja lo dice en cada pantalla. Son
un solo momento: **lunes 14 de septiembre de 2026, 13:50, turno diurno**, penúltimo día de la quincena del 1 al 15 de septiembre. Todas las pantallas usan
estas cifras y cuadran entre sí: la suma de puntadas de los operarios es la de las máquinas,
la de las máquinas es la de los días, y los quetzales salen de 1,500 puntadas = Q1.00. Están
completas en el prompt 1.

Diferencias con las versiones anteriores del brief 11 que esta hoja corrigió. Ya están
pasadas al brief 11 §11 y a los lotes del documento 12 (20 oct 2026):

- Las cifras del tablero y de nómina del brief no cuadran entre sí: la suma de puntadas de la
  quincena por operario (14,772,400) supera la de la fábrica, y los totales de nómina
  (Q14,247.83 de neto) no salen de la fórmula. Aquí se recalculan.
- Prendas de hoy: 168, de trabajos terminados, calculadas por repeticiones y cabezas, no 412.
- La captura es manual, como en la cotización: el operario ingresa con el QR de su gafete,
  declara el diseño con su QR, toca Comenzar, Pausar, Reanudar o Finalizar y teclea el
  contador de la máquina. No hay sensores en las máquinas.
- En pantalla se dice **trabajo**, como en la cotización; «corrida» queda como término
  interno de los documentos 01 a 12.
- **Lo cerrado es exacto; lo abierto se dice abierto.** Las puntadas de un trabajo solo se
  conocen al finalizarlo. Toda cifra de «hoy» es de trabajos terminados; los trabajos en curso
  se muestran aparte, con su hora de inicio y las puntadas *esperadas* (repeticiones
  planeadas × puntadas del diseño), rayadas y rotuladas «en curso». El estado de cada máquina
  sale del último registro y dice desde qué hora.

### 1.8 Requisitos técnicos

- **Tailwind CSS v4** (el mismo que usará el sistema), configurado CSS-first con `@theme`.
  La hoja usa `@tailwindcss/browser` fijado a versión exacta; el sistema real lo compilará.
- Los tokens viven como variables CSS y Tailwind los expone como utilidades
  (`bg-superficie`, `text-tinta-2`, `bg-marca-500`, `rounded-tarjeta`). Así el bloque
  `@theme` de la hoja pasa tal cual al proyecto.
- Modo noche con variante propia sobre `[data-tema="noche"]`, y por defecto según
  `prefers-color-scheme`. El interruptor día / noche aparece en la barra fija de la hoja y
  también dentro de cada pantalla, donde estará en el sistema (brief 11 §6.1); todos
  cambian la hoja entera y se mantienen sincronizados.
- Pantallas de escritorio construidas a su tamaño real (1280 px de ancho) dentro de un marco
  que las escala al ancho disponible. Desde 1024 px eso basta.
- Por debajo de 1024 px, la reducción deja el texto ilegible. Cada pantalla se muestra entonces
  como **miniatura**, rotulada «Vista completa, reducida», para ver la composición, y debajo
  **De cerca**: dos o tres recortes de la misma pantalla a tamaño real, uno por nota
  «Fíjese en…», con la nota como pie. Un recorte nunca se reduce a menos de 0.8 (14 px quedan
  en 11 px). «Ver en grande» sigue disponible para recorrerla entera, con desplazamiento
  dentro del visor y no en la página.
- `B1` tiene además su versión de teléfono, `B1·T`, porque el dueño mira la planta desde el
  celular (brief 11 §6.5). En celular va primero; en escritorio, junto a `B1`.
- Pantallas de la app del operario: en escritorio, marco de teléfono de 390 × 844 sin escalar.
  En celular, sin marco y a sangre, a todo el ancho de la pantalla, que es como la verá el
  operario. Nunca reducidas.
- Un solo archivo HTML, sin dependencias fuera de CDN permitidos y Google Fonts. Íconos en
  SVG en línea, de trazo de 1.5 px.
- Responsive desde 360 px, margen lateral 16 px, sin desplazamiento horizontal de la página.
- Imprimible: al guardar en PDF imprime en A4 horizontal, en modo día, una pantalla por
  página, sin la barra fija.
- Recordar el último modo elegido en `localStorage`, envuelto en try/catch.

### 1.9 Qué evitar

Copiar la referencia (su logotipo, sus textos, sus íconos de criptomonedas, sus fotos).
Tarjetas dentro de tarjetas. Sombras en las tarjetas. Degradados, efecto vidrio, emoji, Lorem
ipsum. Hex sin nombre al lado. Volver a ofrecer paletas: el color ya está aprobado.
Cifras abreviadas. Rankings de operarios.

---

## 2. Prompts

### Cómo usarlos

1. Pegar el **prompt 1** al inicio de la sesión. Construye la hoja completa salvo las
   pantallas, con el estilo, el color añil y todos los datos. Si se usa en Claude Design,
   no hace falta el prompt base del documento 12: el prompt 1 lo sustituye para la hoja.
2. Pegar los **prompts 2 a 8 en orden**, uno por mensaje, en la misma conversación. Cada uno
   agrega sus pantallas a la sección 5 y devuelve el archivo completo.
3. Cerrar con el **prompt 9**, que revisa consistencia, celular, impresión y accesibilidad.

No pedir todo de golpe: la calidad cae y las pantallas dejan de parecerse entre sí.

### Prompt 1 · Base de la hoja

```
Crea la HOJA DEL SISTEMA de Bastidor: una sola página HTML que Servicios Digitales
Guatemala le envía por WhatsApp a su cliente, Josue Chuc, dueño de una fábrica de
bordado computarizado de trajes típicos en Chimaltenango. Con ella aprueba el estilo
visual, viendo una pantalla de cada sección del sistema. El color ya está aprobado:
añil (A · Añil); no ofrezcas otras paletas.
Él no es diseñador: decide por lo que ve. Escribe todo en español de Guatemala, de
usted, frases cortas, sin jerga ("color principal", "modo noche").

Bastidor tiene dos superficies que comparten este sistema de diseño: un PANEL de
escritorio, denso en datos, para el dueño y su equipo; y una APP DEL OPERARIO en el
teléfono, con pocos elementos y muy grandes, para usarse de pie junto a la máquina.

En este mensaje construye todo MENOS las pantallas de la sección 5: deja la sección
con su título y su introducción, y el componente de marco listo. Las pantallas
llegan en los mensajes siguientes. No dejes marcadores visibles.

TECNOLOGÍA
  · Tailwind CSS v4 vía <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4.1.11">
    con <style type="text/tailwindcss">. Nada de tailwind.config.js.
  · Declara los tokens como variables CSS y expónlos con @theme inline:
      --color-fondo, --color-superficie, --color-superficie-2, --color-linea,
      --color-linea-suave, --color-linea-fuerte, --color-tinta, --color-tinta-2, --color-tinta-3,
      --color-marca-100/500/700/900, --color-ok, --color-ok-suave, --color-aviso,
      --color-aviso-suave, --color-critico, --color-critico-suave, --color-mtto
      --radius-tarjeta: 28px; --radius-fila: 20px; --radius-control: 999px
    para usar bg-superficie, text-tinta-2, bg-marca-500, rounded-tarjeta, etc.
  · Valores de día en :root. Modo noche: @custom-variant noche (&:where([data-tema="noche"],
    [data-tema="noche"] *)); los valores de noche redefinen las mismas variables bajo
    [data-tema="noche"]. Las clases nunca cambian entre modos. Inicial según
    prefers-color-scheme, aplicado antes de pintar.
  · Google Fonts, una sola familia: IBM Plex Sans variable
    (family=IBM+Plex+Sans:wdth,wght@85..100,400..700) para interfaz y cifras, e
    IBM Plex Mono (400/500) solo para códigos (BOR-05, OP-007, HUI-001, DPI) y
    valores hex. Plex Sans trae números tabulares de fábrica; declara igual
    font-variant-numeric: tabular-nums. Respaldo: system-ui, "Segoe UI", Roboto,
    sans-serif; display=swap.
  · Escala del panel (px / interlínea / peso): 11/14/500 rótulos del riel y marcas
    de hora · 12/16/500 etiquetas y ejes · 13/18/400 migas y secundario · 14/20/400
    tablas y controles · 16/24/400 párrafos (máx. 66 caracteres) · 18/24/600 título
    de tarjeta · 22/28/500 cifra de ficha · 28/34/500 cifra de tarjeta ·
    40/46/500 saludo (-.02em) · 48/52/500 cifra protagonista (-.02em).
    App: 13 · 15 · 17 base · 20 · 24 · 32 código de máquina · 56 ganancia ·
    64 teclado. Tablas densas y la planilla con font-stretch 90%. En modo noche, el
    texto de 16px o menos con peso 450 y letter-spacing .005em. Etiquetas en tipo
    oración. text-wrap: balance en títulos, pretty en párrafos.
  · Íconos en SVG en línea, trazo 1.5px, 20px, sin relleno. Solo íconos funcionales.
  · Un solo archivo. JS mínimo y sin librerías: interruptor día/noche, menú "Ir a la
    sección", visor "Ver en grande", escalado de los marcos, recortes "De cerca" y
    recordar el último modo en localStorage dentro de try/catch.

ESTILO: MODERNO, CON EL DATO AL FRENTE
Referencia de lenguaje (no copiar): tablero de tarjetas blancas sobre gris claro,
navegación en píldoras, cifras enormes, gráficas de barras con un tramo resaltado.
  · Lienzo en fondo. Cada tema en una tarjeta: superficie, rounded-tarjeta (28px en
    escritorio, 24px en celular), padding 24px (20px en celular), SIN borde y SIN
    sombra. Separación entre tarjetas de 16px (12px en celular).
  · Nunca una tarjeta dentro de otra. Dentro de la tarjeta, los elementos repetidos
    (filas de lista, fichas pequeñas) van en superficie-2 con rounded-fila, sin borde.
  · Esquina superior derecha de cada tarjeta: botón circular de 40px en superficie-2
    con flecha ↗. Significa siempre "abrir el detalle".
  · Panel de escritorio: riel izquierdo de 84px con los 11 módulos (Tablero,
    Operarios, Máquinas, Ganancias, Producción, Catálogo, Nómina, Inventario,
    Mantenimiento, Reportes, Configuración). Cada uno: ícono en círculo de 44px y
    etiqueta de 11px debajo. Activo: círculo relleno en tinta, ícono en superficie.
    Arriba del riel, la marca "Bastidor" en texto, sin logotipo inventado.
  · Barra superior: píldoras de las subsecciones del módulo (alto 40px, padding 18px):
    activa rellena en tinta con texto superficie, las demás en superficie con texto
    tinta. A la derecha: botón circular de búsqueda, INTERRUPTOR DÍA / NOCHE (dos
    segmentos en una píldora de 40px, "☀ Día" y "☾ Noche" con ícono y palabra, el
    vigente relleno en tinta; dos <button> con aria-pressed; se ven los dos a la vez
    para que nadie adivine qué modo está puesto), campana con punto de no leído en
    marca-500 y las iniciales del usuario en círculo ("JC").
  · El interruptor de cada pantalla FUNCIONA: cambia el modo de toda la hoja, igual que
    el interruptor Día / Noche de la barra fija, y ambos quedan sincronizados. Así el
    cliente prueba el cambio donde lo hará en el sistema.
  · Encabezado de pantalla: migas en tinta-2 de 13px ("Inicio → Tablero"), debajo el
    título o saludo en 40px peso 500, letter-spacing -.02em. A la derecha, controles en
    píldora: rango de fechas con ícono de calendario, botón primario.
  · Cifra protagonista: 48px en el panel y 56px en la app, peso 500,
    letter-spacing -.02em. UNA por pantalla como máximo y solo donde la cifra decide: "Puntadas
    de hoy" en el tablero, la tarifa vigente en Ganancias y la ganancia del operario en
    la app. En el resto, las cifras van a 22–28px dentro de su contexto. En quetzales los centavos van en tinta-3 (Q866 + .79). Puntadas
    siempre enteras, con separador de miles, SIN abreviar nunca: 1,300,180, jamás 1.3M.
  · Chip de variación en píldora de 24px: ok-suave con texto ok si mejora,
    critico-suave con texto critico si empeora; al lado, en tinta-2, contra qué se
    compara ("frente al lunes pasado").
  · Gráfica de barras: barras con extremos redondeados; los días cerrados en
    linea-fuerte (≥ 3:1 sobre la tarjeta); hoy en dos tramos apilados: abajo, SÓLIDO en marca-500, lo de
    trabajos terminados; encima, RAYADO a 45° en marca-700 cada 6px sobre marca-100, lo
    esperado de los trabajos en curso. Encima, globo en píldora tinta con texto
    superficie y las dos cifras ("1,300,180 cerradas · 368,300 en curso"). Leyenda
    pequeña: sólido = cerrado y medido; rayado = en curso, todavía no medido. Eje con
    valores reales en tinta-2 de 12px. Domingos "descanso", días futuros en
    linea-suave.
  · TIRA DEL TURNO (la pieza propia del sistema): barra horizontal de 06:00 a 14:00,
    16px de alto en el panel y 12px en fichas pequeñas, sobre pista superficie-2 con
    extremos redondeados. Cada trabajo es un tramo: terminado SÓLIDO en marca-500; en
    curso RAYADO (marca-700 sobre marca-100) hasta la línea "ahora"; paro en
    aviso-suave con su forma de aviso; falla en critico-suave con triángulo;
    mantenimiento en mtto al 25% con cuadrado. Los huecos sin registro quedan en la
    pista. Línea vertical "ahora" en tinta con la hora encima; marcas de hora 06 08 10
    12 14 en tinta-2 de 11px, una sola vez por tarjeta. Al pasar el cursor o tocar un
    tramo: diseño, horario y puntadas. Cada tramo lleva aria-label ("HUI-001 × 3,
    08:55 a 11:58, 127,880 puntadas").
  · FICHA DE MÁQUINA: código en Plex Mono, modelo y cabezas, estado con forma y
    "desde HH:MM", operario, sus cabezas dibujadas como cuadrados de 10px redondeados
    (llenos en tinta si está corriendo, solo contorno si no) y su tira del turno. Es
    la unidad que se repite en tablero, máquinas y app.
  · CADA TARJETA TIENE LA FORMA DE SU PREGUNTA: planilla para nómina, tira de tiempo
    para trabajos, lista por urgencia para mantenimiento. La cuadrícula de tarjetas
    iguales solo para elementos equivalentes (el catálogo de diseños). Nunca filas de
    tres o cuatro tarjetas con cifra gigante y etiqueta.
  · DATO CERRADO Y DATO EN CURSO: las puntadas de un trabajo solo se conocen al
    finalizarlo (el operario teclea el contador). Ninguna pantalla muestra puntadas
    de un trabajo abierto como si fueran medidas: se muestran su hora de inicio y
    sus puntadas esperadas, rayadas y con la palabra "en curso". Toda cifra de "hoy"
    dice "de trabajos terminados". El tablero lleva "Último registro: 13:20 · BOR-06
    comenzó HUI-002 · hace 30 min".
  · Iniciales de personas en círculo de 32px, superficie-2 y texto tinta; apiladas con
    borde de 2px en superficie y "+N" en círculo tinta. Nunca fotos.
  · Tablas dentro de su tarjeta: encabezado sin fondo, 12px tinta-2, línea inferior;
    filas de 52px separadas por linea-suave; números a la derecha con tabular-nums;
    total al pie en peso 600; fila seleccionada en superficie-2 con rounded-fila.
  · Botones: primario en píldora tinta con texto superficie; secundario en píldora
    superficie-2 con texto tinta; destructivo con texto critico. Alto 40px en el panel,
    72px en la app del operario.
  · Campos: etiqueta arriba, siempre visible; campo en superficie-2, rounded-fila,
    con línea inferior de 2px en linea-fuerte (≥ 3:1); foco con contorno de 2px
    marca-700 a 2px de separación.
  · Selección y foco se distinguen: SELECCIÓN = fondo marca-100, borde de 1px en
    marca-500 y ✓ en marca-900; FOCO = contorno de 2px marca-700 a 2px de
    separación. Nunca el mismo contorno para las dos cosas.
  · Enlaces siempre subrayados (1px, separación 3px) además de su color.
  · tinta-3 nunca sobre superficie-2 ni sobre fondo; solo sobre la tarjeta y en texto
    de 24px o más.
  · Una sola sombra en todo el producto, 0 24px 48px rgb(0 0 0 / .12), y solo en el
    panel de avisos, menús y modales. Los modales oscurecen el fondo al 40%.
  · Jerarquía por tamaño y peso, no por color. El color principal aparece poco:
    barra destacada, selección, enlaces, punto de no leído, foco.

ESTADO DE MÁQUINA — color + forma + palabra
  Corriendo: ok, punto lleno, pulso de opacidad 1 → .45 → 1 cada 2.4s.
  Parada: aviso, punto lleno, totalmente quieto.
  En falla: critico, triángulo, doble parpadeo de 120ms y luego 3s de reposo.
  En mantenimiento: mtto, cuadrado, barrido diagonal tenue de 3s.
  Sin datos: tinta-3, punto hueco, desvanecimiento 1 → .35 → 1 en 4s.
  El estado sale del último registro, nunca de un sensor: corriendo = trabajo abierto
  y no pausado; parada = sin trabajo abierto o en pausa, con el motivo del paro;
  en falla = paro reportado como "falla de la máquina"; en mantenimiento = orden de
  mantenimiento abierta; sin datos = ningún registro en el turno. Junto al estado,
  siempre "desde HH:MM".
  Dentro de una tarjeta, la forma va en un círculo de 36px superficie-2.
  Con prefers-reduced-motion los pulsos se detienen y el estado sigue leyéndose por
  forma y color. Nada se anima en pantallas de dinero.

MOVIMIENTO
  Cambio de modo: transición de color de 200ms. Panel de avisos y
  modales: entran 8px con opacidad, 200ms, cubic-bezier(.2,0,0,1). Sin rebotes, sin
  escalas mayores a 1.02, sin aparición escalonada, sin nada disparado por el
  desplazamiento, nunca un indicador giratorio. Las tarjetas no se elevan al pasar el
  cursor; solo su botón ↗ cambia de fondo.

COLOR — A · Añil, aprobado (los valores son exactos; no los inventes ni los "mejores")
  Azul profundo del corte guatemalteco. Botón primario, píldora activa, tramo
  seleccionado y globo van en TINTA (en noche la tinta es clara: texto en fondo, nunca
  text-white).
    día:   marca-900 #1B2A4A · marca-700 #2B3A67 · marca-500 #4A63A8 · marca-100 #E3E8F4
           fondo #E7E8EB · superficie #FFFFFF · superficie-2 #EDEFF3 · linea #D9DDE4
           linea-suave #E8EBF0 · tinta #14171C · tinta-2 #565D68 · tinta-3 #858D99 · linea-fuerte #838A96
    noche: marca-900 #B3C4EC · marca-700 #8FA6DE · marca-500 #6E86C4 · marca-100 #293553
           fondo #101318 · superficie #22262B · superficie-2 #2A2F36 · linea #363A3E
           linea-suave #2C3035 · tinta #E8EAEE · tinta-2 #9BA3AF · tinta-3 #6C7480 · linea-fuerte #707883
    contraste del color principal: 11.0:1 día · 6.3:1 noche

  COLORES DE ESTADO (día / noche), independientes del color principal:
    ok #2E6F4E / #6FBF8E · ok-suave #E2F0E7 / #17301F
    aviso #9A6400 / #E0A63C · aviso-suave #F7EDD9 / #33270F
    critico #B0322B / #E4837A · critico-suave #F7E4E2 / #3A2523
    mtto #6D4C9F / #B49AE0
  En chips y franjas de aviso el texto va en tinta; el color de aviso solo en la forma.
  La tarjeta sobre el fondo queda en 1.22:1 a propósito; lo que hay que distinguir
  para actuar lleva linea-fuerte.
  tinta-3 solo en texto de 24px o más o no esencial.

DATOS — un solo momento: lunes 14 de septiembre de 2026, 13:50, turno diurno
06:00–14:00, quincena del 1 al 15 de septiembre (cierra mañana). Úsalos exactos en
todas las pantallas; nunca texto de relleno ni cifras inventadas fuera de esta lista.

  Fábrica: planta en Chimaltenango, CE2 no agrícola. Salario mínimo Q3,816.90 al mes
  (Q1,908.45 la quincena) más bonificación incentivo Q250.00 (Q125.00 la quincena).
  Tarifa: 1,500 puntadas = Q1.00, global, vigente desde el 1 de enero de 2026,
  autorizada por "Dueño · 28 dic 2025 16:20". Umbral del mínimo: 2,453,721 puntadas
  por quincena (188,748 por día en 13 días).

  Máquinas (código · modelo · cabezas · spm · estado desde · operario · puntadas de
  hoy de trabajos terminados · trabajo en curso · puntadas de la quincena · mantenimiento):
    BOR-01 Feiya FY-1206 · 6 · 850 · corriendo desde 12:05 · Diego Puac Ajanel ·
           213,300 · HUI-001 × 3 desde 12:05, esperadas 127,500 · 2,287,400 ·
           lubricación de barras de aguja 2,372,500 de 2,500,000 (94.9%, aviso)
    BOR-02 Feiya FY-1206 · 6 · 850 · corriendo desde 12:40 · Marta Chocoj Sical ·
           233,430 · HUI-002 × 2 desde 12:40, esperadas 77,800 · 3,412,700 · 62%
    BOR-03 Ricoma EM-1010 · 1 · 1,000 · parada desde 12:30, paro "falta de material"
           (hilo rojo granate) · Manuel Tzunún Coyoy · 292,740 · ninguna · 2,451,180 · 48%
    BOR-04 Tajima TMEZ-1501 · 1 · 1,000 · corriendo desde 13:02 · Juana Ixchop Tzoc ·
           305,670 · TZU-004 × 4 desde 13:02, esperadas 85,200 · 2,918,400 · 31%
    BOR-05 Yuemei YM-904 · 4 · 750 · en falla desde 09:14 · Rosa Elena Batz Quiej ·
           99,410 · FAJ-010 × 8 abierto 08:48, detenido por la falla · 1,884,900 ·
           orden correctiva en proceso
    BOR-06 Feiya FY-1202 · 2 · 800 · corriendo desde 13:20 · Diego Puac Ajanel ·
           155,630 · HUI-002 × 2 desde 13:20, esperadas 77,800 · 1,817,820 · 22%
    BOR-07 Barudan BEXT-Y904 · 4 · 900 · en mantenimiento desde 07:30 · sin asignar ·
           0 · ninguna · 0 · preventivo en curso
    BOR-08 Richpeace RPEM-1201 · 1 · 900 · sin datos (ningún registro hoy) · sin
           asignar · — · ninguna · — · —
  Hoy, de trabajos terminados: 1,300,180 puntadas · 168 prendas · ganancia de operarios
  Q866.79. En curso: 4 trabajos, 368,300 puntadas esperadas. 4 de 8 máquinas
  corriendo. Último registro: 13:20, BOR-06 comenzó HUI-002.

  Tiras del turno (06:00–14:00, ahora 13:50; T = terminado, C = en curso, P = paro,
  F = falla, M = mantenimiento; los huecos no tienen registro):
    BOR-01 · T 06:06–08:49 TZU-004 · T 08:55–11:58 HUI-001 · C 12:05– HUI-001
    BOR-02 · T 06:03–09:20 HUI-002 · T 09:28–12:31 HUI-002 · C 12:40– HUI-002
    BOR-03 · T 06:05–07:55 · T 08:01–09:52 · T 09:58–11:47 · T 11:52–12:30 (COR-021)
             · P 12:30– falta de material
    BOR-04 · T 06:01–07:52 · T 07:58–09:51 · T 09:57–11:49 (TZU-004) ·
             T 11:55–12:58 FAJ-010 · C 13:02– TZU-004
    BOR-05 · T 06:07–08:41 FAJ-010 · C 08:48–09:14 FAJ-010 (detenido) · F 09:14–
    BOR-06 · T 06:12–09:31 HUI-002 · P 09:35–10:48 cambio de bastidor ·
             T 10:51–13:10 HUI-002 (con P 12:24–12:36 pausa) · C 13:20– HUI-002
    BOR-07 · M 07:30– preventivo
    BOR-08 · sin registros

  Trabajos terminados hoy (inicio–fin · máquina · diseño × repeticiones · cabezas ·
  prendas · esperado · medido · desviación):
    06:06–08:49 · BOR-01 · TZU-004 × 4 · 6 · 24 · 85,200 · 85,420 · +0.26%
    08:55–11:58 · BOR-01 · HUI-001 × 3 · 6 · 18 · 127,500 · 127,880 · +0.30%
    06:12–09:31 · BOR-06 · HUI-002 × 2 · 2 · 4 · 77,800 · 77,690 · −0.14%
    10:51–13:10 · BOR-06 · HUI-002 × 2 · 2 · 4 · 77,800 · 77,940 · +0.18%
    06:03–09:20 · BOR-02 · HUI-002 × 3 · 6 · 18 · 116,700 · 116,950 · +0.21%
    09:28–12:31 · BOR-02 · HUI-002 × 3 · 6 · 18 · 116,700 · 116,480 · −0.19%
    06:01–07:52 · BOR-04 · TZU-004 × 4 · 1 · 4 · 85,200 · 85,310 · +0.13%
    07:58–09:51 · BOR-04 · TZU-004 × 4 · 1 · 4 · 85,200 · 85,260 · +0.07%
    09:57–11:49 · BOR-04 · TZU-004 × 4 · 1 · 4 · 85,200 · 85,390 · +0.22%
    11:55–12:58 · BOR-04 · FAJ-010 × 4 · 1 · 4 · 49,600 · 49,710 · +0.22%
    06:05–07:55 · BOR-03 · COR-021 × 10 · 1 · 10 · 86,000 · 86,140 · +0.16%
    08:01–09:52 · BOR-03 · COR-021 × 10 · 1 · 10 · 86,000 · 85,930 · −0.08%
    09:58–11:47 · BOR-03 · COR-021 × 10 · 1 · 10 · 86,000 · 86,210 · +0.24%
    11:52–12:30 · BOR-03 · COR-021 × 4 · 1 · 4 · 34,400 · 34,460 · +0.17%
    06:07–08:41 · BOR-05 · FAJ-010 × 8 · 4 · 32 · 99,200 · 99,410 · +0.21%

  Puntadas de la fábrica por día de la quincena (trabajos terminados):
    1 sep 1,312,300 · 2 sep 1,348,800 · 3 sep 1,301,600 · 4 sep 1,286,400 ·
    5 sep 742,300 · 6 sep descanso · 7 sep 1,404,700 · 8 sep 1,377,500 ·
    9 sep 1,316,100 · 10 sep 1,341,300 · 11 sep 1,329,220 · 12 sep 712,000 ·
    13 sep descanso · 14 sep 1,300,180 cerradas + 368,300 en curso (hoy) · 15 sep —
    Total cerrado 14,772,400 · Q9,848.26. A la misma fecha, la quincena anterior
    llevaba 13,912,800 (+6.2%).

  Diseños (código · nombre · puntadas · cambios de color · región):
    HUI-001 Huipil Sololá cuello grande · 42,500 · 9 · Sololá
    HUI-002 Huipil Quetzaltenango aves · 38,900 · 11 · Quetzaltenango
    TZU-004 Tzute Chichicastenango · 21,300 · 7 · Quiché
    FAJ-010 Faja Totonicapán greca · 12,400 · 5 · Totonicapán
    COR-021 Randa para corte · 8,600 · 3 · Totonicapán

  Nómina, cálculo al 14 de septiembre (código · nombre · puntadas · destajo ·
  séptimo día · complemento al mínimo · bonif. incentivo · IGSS 4.83% · neto · % del
  umbral):
    OP-014 Juana Ixchop Tzoc       2,918,400 · Q1,945.60 · Q324.27 · Q0.00   · Q125.00 · Q109.63 · Q2,285.24 · 118.9%
    OP-021 Marta Chocoj Sical      3,412,700 · Q2,275.13 · Q379.19 · Q0.00   · Q125.00 · Q128.20 · Q2,651.12 · 139.1%
    OP-007 Diego Puac Ajanel       4,105,220 · Q2,736.81 · Q456.14 · Q0.00   · Q125.00 · Q154.22 · Q3,163.73 · 167.3%
    OP-033 Rosa Elena Batz Quiej   1,884,900 · Q1,256.60 · Q209.43 · Q442.42 · Q125.00 · Q92.18  · Q1,941.27 · 76.8%
    OP-018 Manuel Tzunún Coyoy     2,451,180 · Q1,634.12 · Q272.35 · Q1.98   · Q125.00 · Q92.18  · Q1,941.27 · 99.9%
    Totales: 14,772,400 · Q9,848.26 · Q1,641.38 · Q444.40 · Q625.00 · Q576.41 · Q11,982.63
  Reglas: séptimo día = un sexto del destajo (art. 126 del Código de Trabajo);
  complemento = lo que falta para Q1,908.45 (art. 91); IGSS sobre destajo + séptimo
  + complemento, no sobre la bonificación incentivo.

  Puntadas de Diego Puac Ajanel por día (trabajos terminados): 1 sep 368,600 ·
  2 sep 375,000 · 3 sep 352,400 · 4 sep 363,200 · 5 sep 201,300 · 7 sep 385,900 ·
  8 sep 371,700 · 9 sep 360,300 · 10 sep 378,500 · 11 sep 365,390 · 12 sep 214,000 ·
  14 sep 368,930 cerradas + 205,300 en curso (hoy: BOR-01 213,300 y BOR-06 155,630
  cerradas; en curso BOR-01 127,500 y BOR-06 77,800 esperadas). 12 días trabajados.
  A las 12:30 de hoy llevaba 290,990 cerradas (Q193.99) y 4,027,280 en la quincena
  (164.1% del umbral).

  Personas del panel: Josue Chuc (Dueño). Las demás cuentas solo aparecen en
  Configuración.

ESTRUCTURA DE LA HOJA
  1. Portada: "Bastidor · Hoja del sistema", "Estilo, color y una pantalla de cada
     sección", "Preparado para Josue Chuc", 19 de octubre de 2026, logo de Servicios
     Digitales pequeño (https://serviciosdigitalesgtm.com/logo/logo.png).
  2. Cómo revisarla: mírela en el celular dentro de la planta; pruebe el modo noche;
     fíjese en que una máquina en falla se vea al instante en cada pantalla.
  3. Barra fija arriba al desplazarse: "Bastidor", interruptor Día / Noche de dos
     segmentos y menú "Ir a la sección". En celular, en una fila: interruptor de dos
     íconos y el menú como botón de 44px.
  4. El estilo: muestras grandes del color añil y los neutros con nombre en español (Color
     principal, Principal intenso, Barra destacada, Selección, Fondo, Tarjeta, Fila
     interna, Líneas, Texto, Texto secundario), su uso en una línea y el hex en Plex
     Mono; junto al color principal, su contraste y "Cumple AA". Debajo, las piezas
     sueltas del estilo con datos reales: tarjeta con botón ↗, píldoras, riel, cifra
     Q866.79, chip +6.2%, barras de la quincena con lo cerrado sólido y lo en curso
     rayado, el globo, la ficha de BOR-06 con sus 2 cabezas y su tira del turno,
     iniciales apiladas
     (DP JI MC MT +1), rango de fechas, el interruptor día / noche, los cinco estados
     de máquina, botones y un campo con foco.
  5. Las pantallas: título "Una pantalla de cada sección" y la línea "Son pantallas de
     muestra con datos de ejemplo, armados para que cuadren entre sí en un mismo
     momento: lunes 14 de septiembre a las 13:50. No son registros reales." Junto a
     "La usa:" de cada pantalla, el rótulo "Datos de ejemplo" en tinta-2; al imprimir,
     cada página lo lleva al pie. Prepara el componente de marco:
       · Escritorio: <figure> con la pantalla construida a 1280px de ancho y su alto
         propio, escalada con transform al ancho disponible (ResizeObserver), con la
         altura del contenedor ajustada. Encima: número y nombre de la sección, "Para
         qué sirve" en una línea, "La usa:" con los roles. Debajo: "Fíjese en…" con 2 o
         3 notas numeradas.
       · Cada nota "Fíjese en" nombra una zona de su pantalla; márcala en la pantalla
         con data-recorte="1", "2", "3".
       · Por debajo de 1024px: la pantalla escalada queda como miniatura con el rótulo
         "Vista completa, reducida", y en lugar de la lista de notas aparece "De cerca":
         por cada nota, un recorte que muestra su zona a tamaño real (una copia de la
         pantalla dentro de una ventana con overflow hidden, desplazada a esa zona), con
         la nota como pie. Si la zona es más ancha que el espacio, se reduce hasta 0.8
         como máximo y se recorta el resto, nunca más. Debajo, botón "Ver en grande"
         que abre un <dialog> a pantalla completa con la pantalla a tamaño real,
         desplazamiento dentro del visor, botón "Cerrar" visible y cierre con Escape.
       · Teléfono: en 1024px o más, marco de 390×844 con radio de 44px y borde de 10px
         en tinta, sin escalar. Por debajo, sin marco y a sangre: la pantalla ocupa
         todo el ancho del celular (sale del margen de 16px de la hoja), a su tamaño
         real, sin reducir. Las pantallas de la app se construyen fluidas de 360 a
         430px para que esto funcione.
  6. Día y noche: la ficha de BOR-05 en falla y la barra de hoy con su globo, en día y
     en noche lado a lado, independientes del interruptor.
  7. Por qué estos colores: el añil sale del azul del corte; los colores de estado
     (corriendo, atención, falla, mantenimiento) con su forma, y la línea "El color
     principal nunca se usa para un estado: una falla se ve igual de urgente en
     cualquier pantalla."
  8. Cómo continuamos: dos botones a https://wa.me/50239607045 con texto prellenado:
     "Apruebo el estilo de Bastidor" y "Quiero ajustar algo",
     que prellena "Quiero ajustar algo en: Tablero / Operarios / …". Pie:
     info@serviciosdigitalesgtm.com · +502 3960 7045.

RESPONSIVE E IMPRESIÓN
  · Primero celular (360px): margen lateral 16px, sin desplazamiento horizontal de la
    página, barra fija en una fila, texto de la hoja a 16px como mínimo.
  · Día y noche en celular: dos columnas; cada pieza construida a su tamaño real en
    versión compacta (código, estado y "desde" de BOR-05; la barra de hoy con su
    globo), sin reducir.
  · viewport-fit=cover y env(safe-area-inset-*) en la barra fija y en las pantallas
    a sangre.
  · Nada depende de pasar el cursor: los globos y detalles de las pantallas se ven
    fijos en la hoja.
  · @media print: A4 horizontal, modo día; oculta barra fija, botones
    y "Ver en grande"; cada pantalla en su página (break-before: page) escalada al
    ancho; print-color-adjust: exact.

ACCESIBILIDAD
  Contraste AA en todo texto, foco visible de 2px marca-700 a 2px de separación, el
  color nunca como única señal, objetivos táctiles de 44px mínimo en la hoja,
  prefers-reduced-motion apaga los pulsos. Las pantallas escaladas llevan aria-label
  con su nombre; su contenido interno es decorativo para lectores de pantalla y cada
  figura tiene un <figcaption> que resume lo que muestra. Los interruptores dentro de
  las pantallas funcionan con el dedo y el ratón, pero llevan tabindex="-1": para
  teclado y lector de pantalla cuenta el de la barra fija. Los recortes repiten
  contenido: llevan inert y aria-hidden, y su nota se lee como texto normal.

Entrega el archivo completo, sin omitir secciones ni dejar marcadores.
```

### Prompt 2 · Tablero

```
Agrega a la sección 5 la SECCIÓN 1 · TABLERO, con dos pantallas de escritorio y una
de teléfono.
Para qué sirve: "Ver de un vistazo cómo va la planta hoy y qué necesita atención."
La usa: dueño, gerencia, supervisión.

PANTALLA B1 · Tablero general, 1280 × 1120
  Riel con Tablero activo. Píldoras: Resumen (activa) · Máquinas · Trabajos · Alertas.
  Migas "Inicio → Tablero". Saludo "Buenas tardes, Josue" y debajo "Lunes 14 de
  septiembre de 2026 · turno diurno, 06:00 a 14:00 · Último registro: 13:20, BOR-06
  comenzó HUI-002 (hace 30 min)".
  A la derecha del encabezado, solo la píldora "Hoy" con calendario.

  Tarjeta 1 (12 col), la protagonista: "La planta ahora". Una fila por máquina, no
  tarjetas: cada fila es la ficha de máquina extendida, con estas columnas:
    ficha (código, modelo y cabezas dibujadas; estado con forma viva, palabra y
    "desde HH:MM") · operario (iniciales y nombre, o "Sin asignar" con forma de
    aviso) · tira del turno (ocupa la mitad del ancho) · hoy (puntadas terminadas en
    22px y, debajo, rayado, "+ 127,500 en curso") · acción en píldora cuando hace
    falta.
  Dos grupos con rótulo en tipo oración: "Detenidas · 4" arriba y "Corriendo · 4"
  abajo, separados por 24px:
    BOR-05 en falla desde 09:14 · Rosa Elena Batz Quiej · → "Reasignar máquina"
    BOR-03 parada desde 12:30 · Manuel Tzunún Coyoy · "Falta hilo rojo granate" →
      "Ver inventario"
    BOR-07 en mantenimiento desde 07:30 · Sin asignar · "Preventivo" → sin acción
    BOR-08 sin datos · Sin asignar · "Ningún registro hoy" → "Asignar operario"
    BOR-01 · BOR-02 · BOR-04 · BOR-06 corriendo, sin acción.
  Las marcas de hora y la línea "ahora 13:50" se dibujan una vez para toda la
  tarjeta, alineadas en todas las tiras.

  Fila 2:
  · (5 col) "Hoy": la cifra protagonista 1,300,180 y "puntadas de trabajos
    terminados"; debajo, en 18px, "168 prendas · Q866.79 para operarios"; luego una
    fila interna rayada en marca-100: "En curso: 4 trabajos · 368,300 puntadas
    esperadas. Se suman al finalizar cada uno."
  · (7 col) "La quincena, para cerrar mañana": gráfica de 15 barras con los datos de
    la quincena (hoy en dos tramos, sólido y rayado, con globo "1,300,180 terminadas ·
    368,300 en curso"; domingos "descanso"; 15 sep en linea-suave). Debajo, dos filas
    internas con lo que falta para cerrar:
      punto critico · "Rosa Elena Batz Quiej va al 76.8% del mínimo: 1,884,900 de
      2,453,721 puntadas." → "Ver nómina"
      bandera · "2 trabajos con discrepancia sin resolver." → "Revisar"

  Nada más: no hay fila de cifras sueltas, ni conteo de máquinas aparte (los grupos
  ya lo dicen), ni iniciales decorativas, ni botón primario en el encabezado.

PANTALLA B1 · con los avisos abiertos, 1280 × 800
  La parte superior del mismo tablero, oscurecida al 40%, con la campana activa y el
  panel de avisos abierto debajo de ella: 400px de ancho, superficie, rounded-tarjeta,
  la única sombra. Título "Avisos" y píldoras Todas (activa) · Sin leer (3).
  Cinco avisos; los tres primeros sin leer: fondo superficie-2 y punto marca-500.
    1. Triángulo critico en círculo · "BOR-05 en falla" · hace 4 h 36 min ·
       "Rosa Elena Batz Quiej está sin máquina" · acción "Reasignar".
    2. Ícono de quetzal en círculo tinta · "Anticipo por autorizar" · hace 25 min ·
       "Manuel Tzunún Coyoy · Q300.00" · acciones en línea "Rechazar" (secundaria) y
       "Autorizar" (primaria). Nota pequeña: "Autorizar abre la confirmación."
    3. Punto aviso · "BOR-03 parada" · hace 1 h 20 min · "Falta de material: hilo
       rojo granate" · acción "Ver inventario".
    4. Ícono de bandera · "2 trabajos con discrepancia" · desde el viernes ·
       "BOR-05 · FAJ-010 · +4.97% y BOR-03 · COR-021 · −3.12%" · acción "Revisar".
    5. Ícono de calendario · "La quincena cierra mañana" · hoy 06:00 · "1 al 15 de
       septiembre · 2 trabajos sin resolver".

PANTALLA B1·T · El tablero en el teléfono del dueño, 390 de ancho y alto propio
  El mismo tablero reordenado, no reducido (brief 11 §6.5). Se construye fluida de
  360 a 430px; usa el marco de teléfono del prompt 1, alargado a su alto, con la
  barra inferior al pie.
  Barra superior de 56px: "Bastidor", interruptor de dos íconos (44px cada uno),
  campana con punto marca-500 y "JC". Sin migas y sin riel.
  "Buenas tardes, Josue" en 28px; debajo, en 13px tinta-2, "Lunes 14 sep · turno
  diurno · último registro 13:20". Píldoras en una fila que se desliza de lado:
  Resumen (activa) · Máquinas · Trabajos · Alertas.
  Tarjeta "La planta ahora" (radio 24px, relleno 20px):
    "Detenidas · 4", cada una abierta en fila interna de dos niveles:
      línea 1: código en Plex Mono, cabezas dibujadas, estado con forma y "desde";
      línea 2: operario o "Sin asignar" y el motivo;
      la tira del turno a todo el ancho, 12px de alto, marcas 06 · 10 · 14 y "ahora";
      la acción en píldora a todo el ancho, 44px.
      BOR-05 en falla desde 09:14 · Rosa Elena Batz Quiej · → "Reasignar máquina"
      BOR-03 parada desde 12:30 · Manuel Tzunún Coyoy · "Falta hilo rojo granate"
        → "Ver inventario"
      BOR-07 en mantenimiento desde 07:30 · Sin asignar · "Preventivo" · sin acción
      BOR-08 sin datos · Sin asignar · "Ningún registro hoy" → "Asignar operario"
    "Corriendo · 4", compactas: código, iniciales, puntadas terminadas hoy y, debajo,
    rayado, lo en curso; y su tira.
      BOR-01 · DP · 213,300 · + 127,500 en curso
      BOR-02 · MC · 233,430 · + 77,800 en curso
      BOR-04 · JI · 305,670 · + 85,200 en curso
      BOR-06 · DP · 155,630 · + 77,800 en curso
  Tarjeta "Hoy": 1,300,180 en 48px, "puntadas de trabajos terminados", "168 prendas ·
  Q866.79 para operarios" y la fila rayada "En curso: 4 trabajos · 368,300 puntadas
  esperadas".
  Tarjeta "La quincena, para cerrar mañana": las 15 barras con barras de 14px y 7px
  de separación, eje 1 · 5 · 10 · 15, el globo de hoy a dos líneas ("1,300,180
  terminadas" / "368,300 en curso"); debajo, las dos filas de Rosa y de las
  discrepancias, cada una con su acción.
  Barra inferior de 64px más el área segura: Tablero (activo) · Máquinas ·
  Producción · Nómina · Más, con ícono y etiqueta.
  En la hoja: en escritorio va a la derecha de B1 a partir de 1440px y debajo en
  menos; en celular va PRIMERO, a sangre, antes de la miniatura de B1, con el rótulo
  "Así lo verá en su teléfono".

Fíjese en: (1) la planta manda: cada máquina con su día en una tira, lo detenido
arriba con su acción; (2) "hoy" cuenta solo trabajos terminados y lo que sigue
bordándose va rayado; (3) en los avisos, el dinero nunca se autoriza con un solo
toque; (4) en el teléfono nada se esconde: lo detenido va abierto y lo que corre
ocupa menos.

Devuelve el archivo completo.
```

### Prompt 3 · Operarios y máquinas

```
Agrega la SECCIÓN 2 · OPERARIOS y la SECCIÓN 3 · MÁQUINAS.

SECCIÓN 2 · OPERARIOS
Para qué sirve: "La ficha de cada persona: lo que produjo, lo que gana y qué
máquinas tiene a cargo." La usa: dueño, RRHH.

PANTALLA C3 · Ficha de operario, 1280 × 1100
  Riel con Operarios activo. Píldoras: Resumen (activa) · Trabajos · Asignaciones ·
  Nómina. Migas "Inicio → Operarios → Diego Puac Ajanel".
  Encabezado: iniciales "DP" en círculo de 64px, nombre en 40px, OP-007 en Plex Mono,
  "Máquinas BOR-01 · BOR-06". DPI "1928 ••••• 0805" con enlace "Mostrar" y la nota
  "Visible solo para dueño y RRHH".
  Tarjeta 1 (12 col) "Quincena del 1 al 15 de septiembre", en una sola franja: a la
  izquierda dos cifras de 28px, "4,105,220 puntadas" y "Q3,192.95 devengados"
  (destajo Q2,736.81 + séptimo día Q456.14, en 13px debajo); a la derecha, ocupando
  la mitad, la barra del mínimo legal con la marca del umbral 2,453,721 rotulada y
  el texto "167.3% del mínimo · 1,651,499 puntadas por encima" con chip ok-suave
  "Supera el mínimo".
  Fila 2:
  · (7 col) "Hoy en sus máquinas": las fichas de BOR-01 y BOR-06 en filas, cada una
    con su tira del turno y el código del diseño escrito dentro de cada tramo
    terminado cuando cabe; al pie "368,930 terminadas · 205,300 en curso · Q245.95".
  · (5 col) "Por día": los 12 días de Diego en barras finas, línea punteada en
    188,748 rotulada "Ritmo para el mínimo", hoy en dos tramos sólido y rayado.
  Fila 3 (12 col): "Trabajos de hoy" en tabla: inicio–fin · máquina · diseño ×
  repeticiones · prendas · puntadas · verificación. Arriba, las dos en curso, con
  la fila rayada en marca-100 y "en curso" en lugar de puntadas medidas:
    13:20– · BOR-06 · HUI-002 × 2 · en curso · 77,800 esperadas · —
    12:05– · BOR-01 · HUI-001 × 3 · en curso · 127,500 esperadas · —
    10:51–13:10 · BOR-06 · HUI-002 × 2 · 4 · 77,940 · ok +0.18%
    08:55–11:58 · BOR-01 · HUI-001 × 3 · 18 · 127,880 · ok +0.30%
    06:12–09:31 · BOR-06 · HUI-002 × 2 · 4 · 77,690 · ok −0.14%
    06:06–08:49 · BOR-01 · TZU-004 × 4 · 24 · 85,420 · ok +0.26%
    Total cerrado: 54 prendas · 368,930 puntadas · Q245.95.
Fíjese en: (1) el día de Diego se lee en sus dos tiras, sin abrir la tabla; (2) la
barra dice cuánto falta o sobra para el mínimo, no solo un porcentaje; (3) el DPI
está oculto por defecto.

SECCIÓN 3 · MÁQUINAS
Para qué sirve: "El estado de cada máquina y quién puede operarla." La usa: dueño,
supervisión, mantenimiento.

PANTALLA D1 · Parrilla de máquinas, 1280 × 1000
  Riel con Máquinas activo. Píldoras: Parrilla (activa) · Tabla · Asignación.
  Filtros en píldoras: Todas 8 (activa) · Corriendo 4 · Detenidas 2 · En
  mantenimiento 1 · Sin datos 1. Botón primario "+ Agregar máquina".
  Las 8 fichas de máquina en filas que se llenan solas (flex-wrap), con ANCHO
  PROPORCIONAL A SUS CABEZAS (flex-grow = número de cabezas, base 220px): las Feiya
  de 6 cabezas son anchas y las de 1 cabeza angostas, como en la planta. Cada ficha
  con botón ↗: código en Plex Mono 22px, modelo, sus cabezas dibujadas, estado con
  forma viva y "desde HH:MM"; operario o "Sin asignar" (forma de aviso, texto en
  tinta); "Hoy: 213,300 terminadas" en 22px; su tira del turno; y barra fina de
  mantenimiento con su porcentaje (BOR-01 en aviso al 94.9%).
Fíjese en: el tamaño de cada ficha dice cuántas prendas borda a la vez esa máquina.

PANTALLA D4 · Asignación de máquinas, 1280 × 920
  Píldoras: Parrilla · Tabla · Asignación (activa).
  Izquierda (5 col): lista de las 8 máquinas en filas internas, cada una con su forma
  de estado, código y operario, o "Sin asignar" en BOR-07 y BOR-08. BOR-05
  seleccionada con el estilo de selección (fondo marca-100, borde marca-500, ✓), no
  con el contorno de foco.
  Derecha (7 col), tarjeta BOR-05: estado "En falla desde las 09:14"; operario
  actual Rosa Elena Batz Quiej; tipo "Permanente"; vigente desde el 12 de febrero de
  2026; "Asignada por Dueño · 12 feb 2026 08:41".
  Formulario "Reasignar": operario (selector), tipo en píldoras (Permanente · De turno
  · Temporal · Cobertura; De turno activa), vigencia, motivo, botón primario
  "Asignar máquina". Aviso informativo en marca-100 con texto marca-900: "El operario
  asignado será el único que pueda comenzar trabajos en esta máquina desde su teléfono."
  Al pie, historial de asignaciones de la máquina: dos filas con quién y cuándo.
Fíjese en: (1) se ve qué máquina quedó sin operario; (2) cada asignación queda
firmada con nombre y hora.

Devuelve el archivo completo.
```

### Prompt 4 · Ganancias y producción

```
Agrega la SECCIÓN 4 · GANANCIAS y la SECCIÓN 5 · PRODUCCIÓN. En las pantallas de
dinero no hay movimiento, salvo la entrada de un aviso.

SECCIÓN 4 · GANANCIAS
Para qué sirve: "Definir cuánto se paga por puntada y ver qué significa para su
gente." La usa: solo el dueño.

PANTALLA E1 · Tarifas de destajo, 1280 × 1000
  Riel con Ganancias activo. Píldoras: Tarifas (activa) · Simulador · Descuentos y
  bonificaciones. Botón primario "+ Nueva tarifa".
  Fila 1:
  · (7 col) "Tarifa vigente": "1,500 puntadas = Q1.00" en 48px (la cifra protagonista de esta pantalla); "Q0.00066667 por
    puntada" en tinta-2; chips Global · Desde el 1 de enero de 2026; firma "Autorizada
    por Dueño · 28 dic 2025 16:20".
  · (5 col) "Lo que significa": "Para llegar al salario mínimo de Q3,816.90, un
    operario necesita 2,453,721 puntadas por quincena." Debajo, en dos cifras: 188,748
    "por día" y 393 "puntadas por minuto sostenidas".
  Fila 2 (12 col): "Lo que gana al mes según la velocidad de la máquina" (26 días,
  8 h, 70% de eficiencia): barras horizontales con extremos redondeados, cada una en
  dos tramos: destajo SÓLIDO en marca-500 y séptimo día en marca-100 con borde de 1px
  marca-500, y el total al final de la barra:
    650 spm · destajo Q3,785.60 + séptimo Q630.93 = Q4,416.53
    750 spm · Q4,368.00 + Q728.00 = Q5,096.00
    850 spm · Q4,950.40 + Q825.07 = Q5,775.47 (rótulo "velocidad de las Feiya")
    1,000 spm · Q5,824.00 + Q970.67 = Q6,794.67
  Línea vertical en Q3,816.90 rotulada "Salario mínimo". Debajo, en 16px: "Con 70%
  de eficiencia, cualquier máquina de 562 puntadas por minuto o más llega al mínimo.
  Si un operario no llega, el sistema calcula el complemento." Ninguna barra en
  critico: ninguna está por debajo. El mínimo se compara con destajo más séptimo,
  igual que en la nómina.
  Fila 3 (12 col): tabla de tarifas: nombre · alcance · puntadas por Q1.00 · vigente
  desde · vigente hasta · autorizada por.
    Tarifa general 2026 · Global · 1,500 · 1 ene 2026 · — · Dueño (vigente)
    Tarifa general 2.º semestre 2025 · Global · 1,600 · 1 jul 2025 · 31 dic 2025 · Dueño
    Tarifa general 1.er semestre 2025 · Global · 1,700 · 1 ene 2025 · 30 jun 2025 · Dueño
  Nota: "Al pagar gana la tarifa más específica: operario, máquina, diseño,
  producto y, al final, la global."

SECCIÓN 5 · PRODUCCIÓN
Para qué sirve: "Revisar los trabajos cuyo conteo no cuadra con el diseño
declarado." La usa: dueño, supervisión.

PANTALLA F2 · Bandeja de discrepancias, 1280 × 1000
  Riel con Producción activo. Píldoras: Trabajos del día · Discrepancias (activa) ·
  Órdenes.
  Franja critico-suave arriba: "2 trabajos sin resolver impiden cerrar la quincena,
  que cierra mañana."
  Izquierda (4 col): dos filas internas.
    BOR-05 · Rosa Elena Batz Quiej · FAJ-010 · +4.97% · sábado 12 sep (seleccionada)
    BOR-03 · Manuel Tzunún Coyoy · COR-021 · −3.12% · viernes 11 sep
  Derecha (8 col), tarjeta del trabajo BOR-05 · FAJ-010 Faja Totonicapán greca ·
  12 repeticiones:
    Tres cifras lado a lado: Esperado 148,800 · Medido 156,200 · Diferencia +7,400
    (+4.97%) en critico.
    "Diseños que también cuadran con el conteo", filas internas ordenadas por cercanía:
      COR-021 Randa para corte × 18 = 154,800 · +0.90%
      FAJ-010 Faja Totonicapán greca × 13 = 161,200 · −3.10%
      TZU-004 Tzute Chichicastenango × 7 = 149,100 · +4.76%
    Texto pequeño y honesto: "El conteo no identifica el diseño; solo verifica el
    declarado. Estos diseños son una sugerencia."
    Acciones: "Confirmar el diseño declarado" (primaria), "Cambiar al diseño sugerido",
    "Marcar como reproceso por rotura de hilo", "Anular el trabajo" (destructiva, pide
    motivo).
Fíjese en: (1) la diferencia se ve en puntadas y en porcentaje; (2) el sistema
sugiere, pero decide una persona.

Devuelve el archivo completo.
```

### Prompt 5 · Catálogo y nómina

```
Agrega la SECCIÓN 6 · CATÁLOGO y la SECCIÓN 7 · NÓMINA.

SECCIÓN 6 · CATÁLOGO
Para qué sirve: "Los diseños que borda la fábrica, con la firma que permite
verificarlos." La usa: dueño, gerencia, supervisión.

PANTALLA G1 · Diseños, 1280 × 900
  Riel con Catálogo activo. Píldoras: Diseños (activa) · Productos · Temporadas.
  Dos selectores en píldora: "Región: todas ▾" y "Puntadas: todas ▾". Botón
  primario "+ Agregar desde archivo DST".
  Retícula de 3 columnas con los 5 diseños (aquí sí son elementos equivalentes),
  cada uno en tarjeta con botón ↗: código en Plex Mono, nombre y región; luego su
  FIRMA: las puntadas en 28px y, debajo, una tira con un segmento por color,
  separados por 2px, en tonos alternos de marca-500 y marca-100, rotulada con sus
  cambios de color: HUI-001 9 · HUI-002 11 · TZU-004 7 · FAJ-010 5 · COR-021 3 (no
  inventes una imagen del bordado). Al pie, "Vista previa del archivo
  DST" como enlace. La sexta posición es una
  tarjeta en superficie-2 con "+ Agregar diseño" y "Suelte aquí un archivo DST".
Fíjese en: las puntadas de cada diseño son su firma: con ellas se verifica cada
trabajo.

SECCIÓN 7 · NÓMINA
Para qué sirve: "Calcular y cerrar la quincena con todo lo que exige la ley." La
usa: dueño, RRHH. Sin movimiento.

PANTALLA H2 · Cálculo de la quincena, 1280 × 1100
  Riel con Nómina activo. Píldoras: Períodos · Cálculo (activa) · Constancias · Libro
  de salarios. Encabezado "Quincena del 1 al 15 de septiembre de 2026", chip "Abierta",
  y "Cálculo al 14 de septiembre · cierra mañana".
  Bajo el encabezado, una sola línea de resumen en 18px, sin tarjetas: "5 operarios
  · 14,772,400 puntadas · a pagar Q11,982.63 · complementos al mínimo Q444.40".
  Franja critico-suave: "2 trabajos con discrepancia impiden cerrar el período." con
  enlace "Ir a la bandeja".
  La PLANILLA, en una tarjeta a todo el ancho: encabezado en dos niveles con los
  grupos de columnas de una planilla de papel, separados por una línea vertical:
    Operario (código, nombre) | Producción (puntadas) | Devengado (destajo · séptimo
    día · complemento al mínimo · bonif. incentivo) | Descuentos (IGSS 4.83%) |
    A pagar (neto, en 600)
  Datos exactos del prompt 1, con font-stretch 90% para que quepan las nueve
  columnas sin achicar la letra. Primera columna fija al desplazar. Fila de totales
  separada por línea doble, como en el libro de salarios.
  Bajo la fila de Rosa Elena Batz Quiej, una subfila visible (no al pasar el
  cursor), con triángulo critico: "Complemento al mínimo Q442.42: su destajo no
  alcanza el salario mínimo y el patrono completa la diferencia (artículo 91 del
  Código de Trabajo)." La de Manuel Tzunún Coyoy muestra su complemento Q1.98 sin
  alerta. Nota al pie: "Séptimo día: una sexta parte del destajo, artículo 126 del
  Código de Trabajo."
  Acciones: "Recalcular", "Exportar" y primario "Cerrar período" deshabilitado, con
  la razón al lado: "Resuelva 2 trabajos primero".
Fíjese en: (1) se lee como la planilla de papel que ya conoce; (2) cada cifra se
puede comprobar con la tarifa; (3) el sistema no deja cerrar mientras haya algo sin
resolver.

Devuelve el archivo completo.
```

### Prompt 6 · Inventario y mantenimiento

```
Agrega la SECCIÓN 8 · INVENTARIO y la SECCIÓN 9 · MANTENIMIENTO.

SECCIÓN 8 · INVENTARIO
Para qué sirve: "Qué hay en bodega y qué falta comprar." La usa: dueño, bodega.

PANTALLA I1 · Existencias, 1280 × 950
  Riel con Inventario activo. Píldoras: Existencias (activa) · Movimientos ·
  Artículos. Filtro de bodega en píldoras: Materia prima (activa) · Producto
  terminado · Repuestos.
  Fila 1 (12 col), una franja: "Hilo para OP-2026-119 · Faja Totonicapán greca ·
  compromiso 25 sep": "Faltan 368 prendas: 4,563,200 puntadas y unos 23,729 m de
  hilo superior, unos 5 conos de 5,000 m. Por color se redondea hacia arriba: el
  desglose está en la ficha de FAJ-010." con botón ↗.
  Tarjeta con la tabla, en tres grupos con rótulo: "Agotado · 1", "Bajo el mínimo ·
  2" y "Bien · 4": código · artículo · clase · unidad · existencia · mínimo ·
  consumo por mil puntadas · estado.
    HIL-1147 Hilo poliéster rojo granate · hilo · cono de 5,000 m · 0 · 20 · 5.2 m · agotado
      (subfila visible: "BOR-03 parada desde las 12:30 por falta de este hilo")
    HIL-1520 Hilo poliéster verde quetzal · hilo · cono de 5,000 m · 9 · 15 · 5.2 m · bajo el mínimo
    HIL-1802 Hilo poliéster amarillo maíz · hilo · cono de 5,000 m · 31 · 20 · 5.2 m · bien
    BOB-0060 Hilo de bobina blanco 60 · hilo · cono · 22 · 12 · 1.7 m · bien
    AGU-7511 Aguja DBxK5 75/11 · aguja · caja de 100 · 3 · 4 · — · bajo el mínimo
    TEL-0101 Manta blanca para huipil · tela · metro · 186 · 120 · — · bien
    ENT-0040 Entretela desprendible 40 g · entretela · rollo · 7 · 5 · — · bien
  "Agotado" con forma critico (detiene una máquina) y "Bajo el mínimo" con forma
  de aviso, ambos con texto en tinta.
Fíjese en: el consumo por mil puntadas permite saber el hilo de una orden antes de
empezarla.

SECCIÓN 9 · MANTENIMIENTO
Para qué sirve: "Saber qué máquina necesita servicio antes de que falle." La usa:
dueño, mantenimiento.

PANTALLA J1 · Semáforo por máquina, 1280 × 1000
  Riel con Mantenimiento activo. Píldoras: Semáforo (activa) · Órdenes · Planes.
  Conmutador en píldora "Puntadas · Días" con la nota "Los días se estiman con el
  ritmo de cada máquina en esta quincena."
  Una sola tarjeta con una fila por máquina (no una tarjeta por máquina), ordenadas
  por urgencia; las tareas de cada máquina como barras apiladas con su nombre:
    BOR-05 · en falla · orden correctiva en proceso desde las 09:30 · botón "Ver orden"
    BOR-07 · en mantenimiento ahora · "Mantenimiento preventivo, sin operario"
    BOR-01 · tres tareas con su barra: lubricación de barras de aguja 2,372,500 de
      2,500,000 (94.9%, aviso, late suave) con "Faltan 127,500: se cruzan al
      terminar el trabajo en curso" · cambio de cuchilla de corte 41% · revisión de
      correas 12% · botón "Generar orden"
    BOR-02 · lubricación de barras de aguja 1,550,000 de 2,500,000 (62%)
    BOR-03 · 48% · BOR-04 · 31% · BOR-06 · 22% · BOR-08 · sin datos
  Cada barra muestra el intervalo en puntadas y lo transcurrido. Nota al pie: "El
  aceite diario de la lanzadera va en la lista de arranque del turno, no aquí:
  avisaría todos los días."
Fíjese en: (1) el aviso llega al 90%, antes de que falle; (2) lo urgente está
arriba.

Devuelve el archivo completo.
```

### Prompt 7 · Reportes, configuración e ingreso

```
Agrega la SECCIÓN 10 · REPORTES, la SECCIÓN 11 · CONFIGURACIÓN y la SECCIÓN 12 ·
INGRESO.

SECCIÓN 10 · REPORTES
Para qué sirve: "Armar informes por las fechas que usted quiera." La usa: todos
menos operarios.

PANTALLA K1 · Constructor de informes, 1280 × 1050
  Riel con Reportes activo. Píldoras: Constructor (activa) · Producción por máquina ·
  Producción por operario. Título con el rango en texto: "Del 1 al 15 de septiembre
  de 2026"; debajo, cinco atajos en píldoras: Hoy · Esta semana · Esta quincena
  (activa) · Este mes · Rango libre.
  Izquierda (3 col), tarjeta "Configurar": Agrupar por (Máquina activa · Día ·
  Operario · Diseño), Medidas en casillas (Puntadas ✓ · Prendas ✓ · Quetzales
  devengados ✓ · Horas de paro).
  Derecha (9 col): gráfica de barras horizontales por máquina y debajo la tabla:
    BOR-01 · 2,287,400 · 318 · Q1,524.93
    BOR-02 · 3,412,700 · 522 · Q2,275.13
    BOR-03 · 2,451,180 · 285 · Q1,634.12
    BOR-04 · 2,918,400 · 137 · Q1,945.60
    BOR-05 · 1,884,900 · 608 · Q1,256.60
    BOR-06 · 1,817,820 · 92 · Q1,211.88
    BOR-07 · 0 · 0 · Q0.00 · BOR-08 · sin datos
    Total · 14,772,400 · 1,962 · Q9,848.26
  Arriba de la gráfica, chip ok-suave "+6.2%" con "frente a la quincena anterior a
  la misma fecha (13,912,800)", y la nota "Incluye solo trabajos terminados. Hay 4 en
  curso que se suman al finalizar."
  Botones "Exportar a PDF" y "Exportar a hoja de cálculo".
Fíjese en: BOR-05 hizo más prendas con menos puntadas: tiene 4 cabezas y borda
fajas cortas. Por eso puntadas y prendas van separadas.

SECCIÓN 11 · CONFIGURACIÓN
Para qué sirve: "Quién entra al sistema y qué puede hacer." La usa: solo el dueño.

PANTALLA L1 · Usuarios y roles, 1280 × 950
  Riel con Configuración activo. Píldoras: Usuarios (activa) · Parámetros legales ·
  Auditoría. Botón primario "+ Agregar usuario".
  Píldoras de grupo: Personal 6 (activa) · Operarios 5; a la derecha, selector
  "Rol: todos ▾".
  Tarjeta con tabla: iniciales y nombre · rol · último ingreso · estado.
    Josue Chuc · Dueño · hoy 06:12 · activo
    Ana Lucía Sajché · Gerencia · hoy 07:40 · activo
    Pedro Xicará · Supervisión · hoy 06:05 · activo
    Claudia Mux · RRHH · ayer 16:22 · activo
    Óscar Cumes · Mantenimiento · hoy 09:31 · activo
    Elena Tubac · Bodega · 11 sep 15:10 · activo
  Tarjeta "Últimos cambios" con tres filas de auditoría:
    Dueño cambió la tarifa general: 1,600 → 1,500 puntadas por Q1.00 · 28 dic 2025 16:20
    Pedro Xicará asignó BOR-06 a Diego Puac Ajanel · de turno · 14 sep 2026 05:58
    Claudia Mux registró un anticipo de Q300.00 para Manuel Tzunún Coyoy · por autorizar · 14 sep 2026 13:25

SECCIÓN 12 · INGRESO
Para qué sirve: "La entrada al panel para el personal de oficina." La usa: todos.

PANTALLA A1 · Ingreso al panel, 1280 × 800
  Dos tarjetas sobre fondo. Izquierda (5 col): "Bastidor" en texto, "Ingrese a su
  cuenta", campos Usuario y Contraseña, botón primario "Entrar" a todo el ancho, y la
  línea "¿Es operario? Use la aplicación en su teléfono." Derecha (7 col): tarjeta
  rellena en tinta con texto en superficie, como pizarra de planta: "8 máquinas ·
  5 operarios · turno diurno" en 40px y debajo "Chimaltenango". Sin ilustración.

Devuelve el archivo completo.
```

### Prompt 8 · App del operario

```
Agrega la SECCIÓN 13 · APP DEL OPERARIO, con cuatro pantallas en marco de teléfono de
390 × 844, lado a lado en escritorio y una debajo de otra en celular, donde van sin
marco y a sangre (prompt 1). Constrúyelas fluidas de 360 a 430px: a 360px nada se
corta ni se reduce.
Para qué sirve: "Lo que usa el operario junto a la máquina: comenzar, pausar,
reanudar y finalizar su trabajo, y ver lo que gana." La usa: operarios.

Reglas de esta superficie: texto base 17px, botones de 72px de alto en píldora,
objetivos táctiles generosos, margen lateral 16px, tarjetas de 24px de radio. Para
el sol de la planta: toda tarjeta que se toca lleva borde de 1.5px en linea-fuerte,
y las cifras van completas en tinta, SIN centavos atenuados.
Barra de navegación inferior flotante en píldora, con tres destinos: Inicio · Mi
ganancia · Paros; el activo relleno en tinta. En el encabezado de Inicio, a la
derecha, el interruptor día / noche: dos segmentos en píldora de 56px de alto y 72px
de ancho cada uno, "☀ Día" y "☾ Noche" con ícono y palabra, el vigente relleno en
tinta, funcional como el del panel. El saludo puede ir en dos líneas para dejarle
sitio; el interruptor nunca se encoge. La captura es manual:
el operario ingresa con el QR de su gafete, declara el diseño con su QR, toca
Comenzar, Pausar, Reanudar o Finalizar y teclea el contador de la máquina. No hay
sensores: las puntadas de un trabajo se conocen al finalizarlo, y mientras tanto
la app muestra el tiempo y las puntadas esperadas, rayadas y rotuladas "en curso".

PANTALLA P2 · Inicio (12:30)
  "Buenas tardes, Diego" y OP-007 en Plex Mono.
  Tarjeta "Su ganancia hoy": Q193.99 en 56px, completa en tinta; "290,990 puntadas
  de trabajos terminados"; barra hacia la quincena con "Va al 164% del mínimo".
  "Mis máquinas": SOLO BOR-01 y BOR-06, cada una en tarjeta de 112px de alto con su
  código grande, estado con forma viva, palabra y "desde HH:MM", diseño en curso y
  tiempo del trabajo.
  BOR-01 · corriendo desde 12:05 · HUI-001 × 3 · 25 min → botón secundario
  "Continuar".
  BOR-06 · en pausa desde 12:24 (punto aviso quieto) · HUI-002 × 2 → botón primario
  "Reanudar".
  Cada tarjeta lleva su tira del turno de 12px hasta las 12:30 (BOR-01: dos
  terminados y uno en curso; BOR-06: un terminado, el paro por cambio de bastidor y
  el trabajo en curso con su pausa), para que el operario vea su mañana de un
  vistazo.
  Nota pequeña al pie: "Solo aparecen las máquinas que su supervisor le asignó."

PANTALLA P4 · Trabajo en curso y finalizar, dos marcos
  Marco 1 (13:05): "BOR-06 · HUI-002 Huipil Quetzaltenango aves", "2 cabezas".
  Tira de pasos en píldoras: Comenzar ✓ · En curso (activa) · Finalizar.
  Cronómetro 2 h 14 min en 56px, "incluye 12 min en pausa". Dos filas internas:
  "Contador al comenzar 8,412,300" y "Repeticiones planeadas 2 → 4 prendas".
  Abajo, dos botones de 72px: "Pausar" (secundario) y "Finalizar" (primario).
  Marco 2 (13:10): hoja inferior "Finalizar trabajo": "Teclee el número que marca la
  máquina", el número 8,490,240 enorme, teclado numérico propio con dígitos de 64px,
  "Repeticiones terminadas: 2". Encima del teclado, el resultado ya calculado en
  tarjeta ok-suave: forma ok y "Trabajo verificado" · esperado 77,800 · medido
  77,940 · +0.18% · 4 prendas (2 repeticiones × 2 cabezas) · "Ganancia del
  trabajo Q51.96". Botón primario "Guardar".
  Marco 3 (13:10), el número que no cuadra: la misma hoja inferior antes de
  corregir, con 8,940,240 tecleado (un dígito cambiado de lugar). Debajo del número, en fila
  aviso-suave con su forma, sin modal: "Ese número da 527,940 puntadas. BOR-06 no
  puede bordar tantas en 2 h 7 min: como máximo 101,600. Revise el número que marca
  la máquina." El botón "Guardar" desactivado y, en su lugar, "Corregir número"
  (primario). El número sigue a la vista para corregirlo, no se borra.

PANTALLA P8 · Sin conexión (13:12)
  Inicio de Diego dos minutos después de guardar, sin señal. Arriba, franja fija en
  aviso-suave, no un bloqueo: "Sin conexión · 1 registro guardado en este teléfono.
  Se enviará solo al volver la señal. Puede seguir trabajando."
  "Su ganancia hoy": Q245.95 en 56px y "368,930 puntadas de trabajos terminados";
  debajo, "calculada en este teléfono · se confirma al enviar".
  "Mis máquinas": BOR-01 corriendo desde 12:05 · HUI-001 × 3; BOR-06 · "Libre ·
  comience un trabajo" con botón primario "Comenzar".
  "Pendiente de enviar": una fila con reloj, "13:10 · BOR-06 · Finalizó HUI-002 ·
  77,940 puntadas · pendiente" y el botón secundario "Corregir · hasta 13:25".
  Nota pequeña: "Todo queda con la hora en que lo tocó, aunque llegue después."

PANTALLA P7 · Mi ganancia
  Píldoras Hoy · Esta quincena (activa).
  Q3,192.95 en 56px, completa en tinta; "4,105,220 puntadas".
  Barra hacia el mínimo con la marca 2,453,721 y "Va al 167% del mínimo".
  Gráfica de barras de sus 12 días; hoy con 368,930 terminadas sólido y 205,300 en
  curso rayado, globo "368,930 terminadas · 205,300 en curso".
  Desglose en filas internas: Destajo Q2,736.81 · Séptimo día Q456.14 ·
  Bonificación incentivo Q125.00 · Descuentos Q0.00 · IGSS −Q154.22 ·
  Neto estimado Q3,163.73.
  Nota: "Cuenta solo trabajos terminados. Los 2 en curso se suman al finalizarlos.
  El monto final se confirma al cerrar la quincena."

Fíjese en: (1) el operario solo ve sus máquinas; (2) los botones se usan con
guantes; (3) la ganancia es lo primero que ve; (4) sin señal sigue trabajando y un
número mal tecleado se detiene antes de guardarse.

Devuelve el archivo completo.
```

### Prompt 9 · Revisión final

```
Revisa la hoja completa y corrige lo que no cumpla, sin cambiar el diseño aprobado:

  · Consistencia: las 13 secciones usan el mismo riel, las mismas píldoras, los mismos
    radios, el mismo tamaño de cifra protagonista y las mismas formas de estado. Las
    cifras coinciden exactamente con los datos del prompt 1 en todas las pantallas.
  · Ninguna puntada de un trabajo abierto aparece como medida: toda cifra de "hoy"
    dice "de trabajos terminados", lo en curso va rayado y rotulado, y
    cada estado de máquina dice desde qué hora.
  · Campos con línea inferior en linea-fuerte, barras pasadas en linea-fuerte, tarjetas
    de la app con borde linea-fuerte, enlaces subrayados, selección distinta del foco,
    tinta-3 nunca sobre superficie-2 ni fondo, sin centavos atenuados en la app.
  · Ninguna tarjeta dentro de otra; ninguna sombra fuera del panel de avisos, menús y
    modales; ningún verde, rojo o ámbar usado como decoración.
  · El modo noche cambia TODAS las pantallas, incluidas las del operario, sin tocar
    las clases; botones y píldora activa claros con texto oscuro. No hay selector de
    paleta: el color es añil.
  · El interruptor día / noche de la barra fija y el de cada pantalla (panel y app del
    operario) cambian la hoja entera, muestran el ícono correcto y quedan sincronizados;
    al recargar no hay destello del modo equivocado.
  · Celular a 360px: sin desplazamiento horizontal de la página. Ningún texto de una
    pantalla se lee a menos de 11px: las pantallas de escritorio salen como
    miniatura y su "De cerca" muestra cada nota a tamaño real; B1·T va primero; las
    de la app van a sangre, sin reducir. "Ver en grande" funciona y se cierra con
    Escape y con un botón visible. Los interruptores tienen dos segmentos con
    palabra o ícono visible y área táctil de 44px o más.
  · Zoom al 200% en escritorio: la hoja pasa al diseño de celular sin cortarse.
  · Casos límite: P4 marco 3 detiene el número antes de guardar y no lo borra; P8
    sigue funcionando sin señal, con la hora del toque, y su ganancia cuadra
    (Q193.99 + Q51.96 = Q245.95). Cada pantalla lleva "Datos de ejemplo".
  · Impresión: A4 horizontal, una pantalla por página, en modo día, sin la barra fija.
  · Accesibilidad: contraste AA, foco visible, prefers-reduced-motion, aria-label en
    cada marco y <figcaption> con el resumen.
  · Texto: todo de usted, sin jerga, sin palabras en inglés, sin cifras abreviadas.

Lista lo que corregiste en 10 líneas o menos y devuelve el archivo completo.
```

## 3. Después de la aprobación

1. El color ya está aprobado (A · Añil, 20 oct 2026) y pasado al brief 11 §6.1 y al prompt
   base del documento 12. Al empezar el código, el bloque de variables del prompt 1 va tal
   cual al `@theme` del proyecto.
2. El cliente responde por WhatsApp «Apruebo el estilo» o lo que ajustaría; los ajustes se
   hacen en el brief 11 y en el prompt de su sección, aquí.
3. Los datos de §1.7 ya están en el brief 11 §11 y en los lotes del documento 12; si la
   revisión del cliente cambia alguna cifra, se cambia en los tres.
