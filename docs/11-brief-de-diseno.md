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
| **Panel de administración** | Dueño, gerencia, supervisión, RRHH, mantenimiento, bodega | Escritorio, oficina | Alta: tablas densas, muchos datos por pantalla |
| **PWA de piso** | Operarios | Teléfono o tableta compartida, junto a la máquina | Baja: pocos elementos, muy grandes |

No son la misma aplicación con distinto ancho. Son dos productos con distinta finalidad que
comparten tokens, tipografía y vocabulario. Diseñarlas como un solo responsive es el error
más caro que se puede cometer aquí.

## 2. Dirección visual: minimalismo funcional

El sistema se diseña en estilo **minimalista**. Aquí eso no significa «vacío» ni «bonito»:
significa que **cada elemento tiene que ganarse su lugar**, y en una fábrica el criterio para
ganárselo es que ayude a decidir algo.

Cinco reglas que hacen operativa la dirección:

| Regla | Qué implica en la pantalla |
|---|---|
| **El dato es la interfaz** | La cifra, no el contenedor. Un tablero es una retícula de números bien compuestos, no una cuadrícula de tarjetas. |
| **El espacio separa antes que la línea, y la línea antes que la caja** | Primero se intenta separar con aire. Si no alcanza, una hairline. La caja con relleno y borde es el último recurso y hay que justificarla. |
| **Un solo acento** | El índigo `--marca-700`. Todo lo demás es tinta y neutros. Los colores semánticos no son decoración: aparecen solo cuando hay algo que atender, y desaparecen cuando no. |
| **La jerarquía la hace la tipografía** | Tamaño, peso y espacio. No fondos de color, no bordes de énfasis, no barras de acento al costado de las tarjetas. |
| **Nada compite con la alerta** | Si la pantalla está tranquila, una sola mancha de color crítico se ve desde la puerta. Ese es el rendimiento que compra el minimalismo aquí. |

Consecuencias concretas frente a un diseño convencional:

- Los encabezados de tabla **no llevan fondo gris**: llevan una línea inferior y tipografía en
  mayúscula pequeña.
- Las píldoras de estado **no llevan relleno de color**: llevan su forma coloreada y el texto en
  tinta normal. El color va en la marca, no en el fondo.
- El tablero **no usa tarjetas**: usa una retícula con hairlines y mucho aire.
- Los iconos se reducen a los indispensables. Las cinco formas de estado de máquina y poco más.
- Las secciones respiran: 56 px entre bloques en escritorio, no 24 px.

Lo que el minimalismo **no** autoriza en este proyecto: bajar el contraste, esconder acciones
detrás de menús, quitar etiquetas de los campos, ni reducir el tamaño de los objetivos táctiles
de la PWA. Sobriedad visual, nunca a costa de la legibilidad en planta.

## 3. Principios, derivados de restricciones reales

1. **El número es el protagonista.** Todo en este negocio es una cifra: puntadas, quetzales,
   porcentajes de avance. Las cifras van en monoespaciada con `tabular-nums`, alineadas a la
   derecha, sin abreviar. Nunca «5.7M puntadas»; siempre `5,725,350`.
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
8. **Nada de tarjetas por defecto.** Se separa con línea de 1 px. El borde, el relleno y la
   sombra se gastan solo donde algo debe destacar de verdad.

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

Los neutros están sesgados hacia el azul índigo del acento, no son grises puros. El acento
sale del azul profundo del **corte** guatemalteco; el rojo de alerta, del rojo de los huipiles
de Totonicapán. Los colores de estado son independientes del acento y no se usan nunca como
decoración.

**Tema claro**

```
--fondo          #F4F5F7    fondo de página
--superficie     #FFFFFF    tarjetas, tablas, modales
--superficie-2   #EDEFF3    encabezados de tabla, filas alternas
--tinta          #14171C    texto principal
--tinta-2        #565D68    texto secundario
--tinta-3        #858D99    etiquetas, texto deshabilitado
--linea          #D9DDE4    bordes, divisores
--linea-suave    #E8EBF0    divisores internos

--marca-700      #2B3A67    primario: botones, enlaces, selección
--marca-900      #1B2A4A    hover del primario
--marca-500      #4A63A8    acento secundario, gráficas
--marca-100      #E3E8F4    fondo de selección, píldoras informativas
```

**Tema oscuro** — mismos nombres, valores redefinidos:

```
--fondo          #101318
--superficie     #171B21
--superficie-2   #1E232B
--tinta          #E8EAEE
--tinta-2        #9BA3AF
--tinta-3        #6C7480
--linea          #2A3039
--linea-suave    #21262E

--marca-700      #8FA6DE
--marca-900      #B3C4EC
--marca-500      #6E86C4
--marca-100      #1E2740
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

| Rol | Familia | Uso |
|---|---|---|
| Interfaz | **Source Sans 3** 400/600/700 | Todo el texto de interfaz. Buen soporte de acentos y de ñ. |
| Datos | **IBM Plex Mono** 400/500/600 | Puntadas, quetzales, códigos de diseño, DPI, horas, porcentajes. Siempre con `font-variant-numeric: tabular-nums`. |

Escala: `11 · 12 · 14 · 16 · 18 · 21 · 26 · 32 · 42`

- Texto de tabla y formulario: 14 px escritorio, 17 px PWA.
- Etiquetas en mayúscula: 11 px, Plex Mono 500, `letter-spacing: .1em`.
- Cifras destacadas del tablero: 32 px o 42 px, Plex Mono 500, `letter-spacing: -.02em`.
- Longitud de línea de texto corrido: máximo 66 caracteres.

### 6.3 Espaciado, forma y elevación

- Escala de espaciado base 4: `4 · 8 · 12 · 16 · 20 · 24 · 32 · 40 · 56 · 72 · 96`.
  En dirección minimalista se usa el extremo alto: **56 px entre bloques**, 96 px entre
  secciones mayores. El aire es el separador por defecto.
- Radios: **2 px** en controles, **0** en tablas y contenedores. En todo el sistema no hay una
  sola esquina muy redondeada. Las píldoras de estado tampoco llevan redondeo completo: al no
  tener relleno, no son píldoras sino marca más texto.
- Bordes: **una sola hairline de 1 px** y solo donde el aire no basta para separar. Los
  encabezados de tabla no llevan fondo; llevan línea inferior.
- Elevación: una sola sombra en todo el producto, reservada a menús desplegables y modales.
  Ningún otro elemento proyecta sombra.
- Relleno de color: reservado a los estados semánticos y solo en su versión suave, para franjas
  de alerta y filas marcadas. Nunca como decoración.
- Foco de teclado: contorno de 2 px en `--marca-700` con 2 px de separación. Visible siempre,
  nunca suprimido.

### 6.4 Densidad

| | Escritorio | PWA |
|---|---|---|
| Alto de fila | 40 px | 64 px |
| Alto de control | 34 px | 56 px |
| Botón primario | 34 px | 72 px |
| Texto base | 14 px | 17 px |
| Margen lateral | 24 px | 16 px |

## 7. Movimiento

El minimalismo hace que el movimiento pese más: en una pantalla quieta, lo único que se mueve
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

| Estado | Forma | Movimiento | Por qué así |
|---|---|---|---|
| **Corriendo** | punto lleno | Pulso de opacidad `1 → .45 → 1`, `--dur-ambiente`, infinito, curva `--suave` | La máquina está viva. El ritmo lento late sin distraer. |
| **Corriendo · avanzado** | punto lleno | El mismo pulso, pero **la duración del ciclo se deriva de las puntadas por minuto reales**: más rápida la máquina, más rápido el latido. Rango acotado de 1.2 s a 3 s. | Convierte un dato en algo que se lee sin leer. Es la animación que da identidad al producto. |
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

**Propios del dominio** — son los que dan identidad al sistema y hay que diseñarlos con cuidado:

| Componente | Qué hace | Movimiento |
|---|---|---|
| **Ficha de máquina** | Estado, operario a cargo, diseño en curso, puntadas del día, avance hacia el próximo mantenimiento. Es la unidad que se repite en el tablero. | Hereda el del estado (§7.2) |
| **Contador de puntadas** | Cifra grande en Plex Mono con separador de miles, con su delta y su tasa por minuto. | Conteo animado al cambiar |
| **Chip de verificación** | `ok` / `revisar` / `discrepancia` / `sin declarar`, con la desviación en porcentaje. Sin relleno: marca coloreada más texto en tinta. | Cruce al resolverse |
| **Firma de diseño** | Código, miniatura, puntadas y número de cambios de color. Se repite en catálogo, corrida y verificación. | Ninguno |
| **Barra de mínimo legal** | Progreso del operario hacia el umbral de 2,453,721 puntadas quincenales, con marca del umbral. Pasa a `--critico` si va por debajo del ritmo. | Crece al aparecer; destello al cruzar |
| **Semáforo de mantenimiento** | Avance porcentual hacia el intervalo, con aviso al 90 %. | Latido suave por encima del 90 % |
| **Escáner QR** | Visor de cámara a pantalla completa con marco, con alternativa de tecleo manual siempre visible. | Marco que respira; colapso al leer |
| **Teclado numérico grande** | Para capturar el contador en la PWA. Dígitos de 64 px, sin teclado del sistema. | Fondo de 90 ms por dígito |
| **Selector de rango de fechas** | Con atajos: hoy, ayer, esta semana, esta quincena, este mes, rango libre. Es el control más usado de todo el panel. | Apertura de 200 ms |

## 9. Patrones

**Tablas de datos.** Encabezado fijo. Números a la derecha en Plex Mono. Fila con `hover`
sutil. Ordenamiento por columna. Filtros arriba, no en un panel escondido. Total al pie cuando
la columna es sumable. Nunca paginación menor a 50 filas en escritorio: el dueño quiere ver.

**Formularios.** Una columna. Etiqueta arriba del campo, nunca dentro. Validación al salir del
campo, no mientras se escribe. El error dice qué pasó y cómo arreglarlo. Los campos con formato
propio —DPI, teléfono, puntadas— validan y dan formato en vivo.

**Estados vacíos.** Dicen qué falta y ofrecen la acción. «Aún no hay corridas hoy. Las corridas
aparecen aquí cuando un operario abre una en la PWA.»

**Confirmaciones destructivas o financieras.** Modal que nombra la consecuencia exacta y exige
una acción deliberada. Cerrar una nómina: «Se cerrará la quincena del 1 al 15 de septiembre
con 18 operarios y Q47,812.30 en total. Después de cerrar no se pueden editar las corridas de
este período.»

**Errores.** Nunca códigos. Nunca «algo salió mal». Siempre qué pasó, qué se hizo con los datos
y qué puede hacer la persona.

## 10. Inventario de pantallas

37 pantallas. Los identificadores se usan en los prompts del documento 12.

### Panel de administración (escritorio)

| ID | Pantalla | Rol |
|---|---|---|
| `A1` | Ingreso al panel | todos |
| `B1` | Tablero general: máquinas en vivo, producción del día, alertas | dueño, gerencia, supervisor |
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

### PWA del operario (móvil)

| ID | Pantalla |
|---|---|
| `P1` | Ingreso por QR de gafete |
| `P2` | Inicio: mis máquinas asignadas y mi ganancia de hoy |
| `P3` | Abrir corrida: escanear máquina, escanear diseño, contador inicial |
| `P4` | Corrida en curso |
| `P5` | Cerrar corrida y resultado de la verificación |
| `P6` | Reportar paro |
| `P7` | Mi ganancia: día y quincena, con desglose |
| `P8` | Sin conexión y cola de sincronización |

## 11. Contenido real para los diseños

Nada de texto de relleno. Estos son los datos que deben aparecer en todas las pantallas, para
que sean consistentes entre sí.

**Fábrica:** planta en Totonicapán, circunscripción CE2, categoría no agrícola.
Salario mínimo aplicable **Q3,816.90** más bonificación incentivo de **Q250.00**.
Tarifa vigente: **1,500 puntadas = Q1.00**, vigente desde el 1 de enero de 2026.

**Operarios**

| Código | Nombre | DPI | Máquina asignada | Puntadas quincena |
|---|---|---|---|---|
| OP-014 | Juana Ixchop Tzoc | 3056 78914 0801 | BOR-04 | 2,918,400 |
| OP-021 | Marta Chocoj Sical | 4567 81234 0801 | BOR-02 | 3,412,700 |
| OP-007 | Diego Puac Ajanel | 1928 37465 0805 | BOR-01, BOR-06 | 4,105,220 |
| OP-033 | Rosa Elena Batz Quiej | 2233 44556 0803 | BOR-05 | 1,884,900 |
| OP-018 | Manuel Tzunún Coyoy | 6677 88991 0801 | BOR-03 | 2,451,180 |

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

| Código | Producto | Objetivo | Producidas | Compromiso | Temporada |
|---|---|---|---|---|---|
| OP-2026-114 | Huipil Sololá cuello grande | 240 | 186 | 8 ago 2026 | Feria de Sololá |
| OP-2026-119 | Faja Totonicapán greca | 500 | 132 | 1 sep 2026 | Independencia |
| OP-2026-121 | Tzute Chichicastenango | 90 | 90 | 20 jul 2026 | Regular |

**Corrida de ejemplo con discrepancia:** BOR-05, Rosa Elena Batz Quiej, diseño declarado
FAJ-010, 12 repeticiones, esperado `148,800`, medido `156,200`, desviación **+4.97 %**,
veredicto `discrepancia`.

**Mantenimiento pendiente:** BOR-01, engrase de la pista de la lanzadera, intervalo
`250,000` puntadas, lleva `237,400`, avance **94.9 %**, en aviso.

## 12. Qué evitar

- Terracota sobre crema, degradados morado-azul, tipografías Inter o Space Grotesk, emoji como
  marcadores de sección, todo centrado, esquinas muy redondeadas y tarjetas con barra de acento
  a la izquierda. Es el aspecto que delata un diseño generado sin criterio.
- **Patrones de huipil como textura de fondo.** El textil es el producto de la fábrica, no la
  decoración del software. Si aparece un motivo, es una fotografía real de una prenda dentro de
  la ficha del diseño que le corresponde, nunca un adorno de la interfaz.
- Iconos alegres o ilustraciones simpáticas en pantallas de dinero. Una nómina no se ilustra.
- Rankings públicos de operarios. Los indicadores individuales son insumo de nómina y de
  conversación, no un marcador para exhibir en el piso.
- Abreviar cifras. `5.7M` no es aceptable en ninguna pantalla de este sistema.
- **Movimiento decorativo.** Rebotes, escalas grandes, rotaciones, parallax, aparición
  escalonada de listas, animaciones disparadas por desplazamiento y cualquier indicador
  giratorio. En una interfaz minimalista el movimiento gratuito se nota el doble.
- **Minimalismo mal entendido:** bajar el contraste, esconder acciones detrás de menús, quitar
  las etiquetas de los campos o encoger los objetivos táctiles de la PWA. La sobriedad es
  visual; la legibilidad en planta no se negocia.
