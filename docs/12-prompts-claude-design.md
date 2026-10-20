# 12 · Prompts para Claude Design

Prompts listos para copiar. Se apoyan en el [brief de diseño](11-brief-de-diseno.md), que es
donde viven los tokens completos, la matriz de permisos y las reglas, y en la
[hoja del sistema](13-hoja-del-sistema.md), que fija el estilo moderno y los datos de ejemplo.

> **Reescrito el 20 oct 2026** al estilo moderno (brief 11 §2): una tarjeta por tema, píldoras,
> riel con etiquetas, tira del turno, IBM Plex Sans para todo y Plex Mono solo para códigos.
> Los datos son los de la hoja: lunes 14 de septiembre de 2026, 13:50.

## Cómo usarlos

1. **Pegar primero el prompt base (§1)** y, dentro de él, el bloque de datos de la hoja.
   Establece el sistema de diseño y los datos de la fábrica. Sin él, cada lote saldrá con una
   identidad distinta.
2. **Luego un lote a la vez (§2).** Cada lote produce un lienzo con varias mesas de trabajo
   relacionadas. No pedir los catorce de golpe: la calidad cae y las pantallas dejan de
   parecerse entre sí.
3. **Las pantallas que ya están en la hoja no se redactan dos veces.** Donde un lote dice
   «hoja, prompt N, PANTALLA X», se pega ese bloque del documento 13 tal cual: así la pantalla
   aprobada por el cliente y la pantalla final son la misma.
4. **Refinar con §3** cuando el lote ya esté aprobado.

Regla que conviene repetir en cada lote: **datos de ejemplo exactos, nunca texto de relleno.**
Los nombres, códigos, puntadas y quetzales del prompt base son los que aparecen en todas las
pantallas, siempre iguales. En pantalla se dice **trabajo**, nunca «corrida».

---

## §1 · Prompt base

> Pegar al inicio de cada sesión de diseño, antes de cualquier lote.

```
Vas a diseñar "Bastidor", el sistema de administración de una fábrica de bordado
computarizado de trajes típicos guatemaltecos, en Chimaltenango. Todo en español de
Guatemala, de usted.

DOS SUPERFICIES, UN SISTEMA DE DISEÑO
  · PANEL DE ADMINISTRACIÓN para el dueño y su equipo. En escritorio es denso en
    datos. El dueño también lo abre en su teléfono, fuera de la planta, para ver cada
    máquina, autorizar y revisar la quincena: en el teléfono el panel se REORDENA,
    no se encoge.
  · APP DEL OPERARIO (PWA) en el teléfono, junto a la máquina: pocos elementos, muy
    grandes, para usarse de pie, con guantes, con mala luz o sol.
  No son la misma pantalla en dos anchos.

CÓMO SE CAPTURA (define lo que una pantalla puede mostrar)
  No hay sensores en las máquinas. El operario ingresa con el QR de su gafete,
  declara el diseño con su QR, toca Comenzar, Pausar, Reanudar o Finalizar y teclea
  el contador de la máquina al comenzar y al finalizar. Por eso:
  · Las puntadas de un trabajo solo se conocen al finalizarlo. Toda cifra de "hoy" o
    del período dice "de trabajos terminados".
  · Un trabajo en curso muestra su hora de inicio y sus puntadas ESPERADAS
    (repeticiones planeadas × puntadas del diseño), rayadas y con la palabra
    "en curso". Nunca puntadas "avanzadas" ni velocidad real: el sistema no las sabe.
  · El estado de una máquina sale del último registro y siempre dice "desde HH:MM".
  · El tablero dice cuándo fue el último registro.

DIRECCIÓN VISUAL: MODERNA, CON EL DATO AL FRENTE
Lenguaje de tablero moderno (no copiar ninguna marca): lienzo gris claro, una tarjeta
blanca muy redondeada por tema, navegación en píldoras, cifras grandes, gráficas con un
solo tramo resaltado.
  · El dato es la interfaz: cada tarjeta responde una pregunta y su cifra es lo más
    grande que contiene.
  · Una tarjeta por tema, NUNCA una dentro de otra. Lo repetido dentro de la tarjeta va
    en filas de superficie-2 sin borde. Las tarjetas no llevan borde ni sombra.
  · Cada tarjeta tiene la forma de su pregunta: planilla para la nómina, tira de tiempo
    para los trabajos, lista por urgencia para mantenimiento. La cuadrícula de tarjetas
    iguales solo para elementos equivalentes (el catálogo de diseños). Nunca una fila
    de tres o cuatro tarjetas con cifra gigante y etiqueta.
  · El negro manda, el color señala: botón primario, píldora activa, tramo
    seleccionado y globo en TINTA. El color principal aparece poco: barra destacada,
    selección, enlaces, punto de no leído, foco.
  · Nada compite con la alerta: con todo en tinta y gris, una sola mancha de color
    crítico se ve desde la puerta.
  · La planta es la protagonista: el tablero abre con las máquinas, una fila por
    máquina con su tira del turno; lo detenido va arriba con su acción.
Lo moderno NO autoriza: bajar el contraste, esconder acciones en menús, quitar
etiquetas de los campos, íconos sin texto, abreviar cifras ni encoger los objetivos
táctiles de la app.

PIEZAS DEL ESTILO
  · Tarjeta: superficie, radio 28px en escritorio y 24px en teléfono, relleno 24px
    (20px en teléfono), 16px entre tarjetas (12px en teléfono). Título arriba a la
    izquierda; arriba a la derecha, botón circular de 40px en superficie-2 con ↗, que
    siempre significa "abrir el detalle".
  · Riel lateral de 84px con los 11 módulos (Tablero, Operarios, Máquinas, Ganancias,
    Producción, Catálogo, Nómina, Inventario, Mantenimiento, Reportes, Configuración):
    ícono en círculo de 44px y etiqueta de 11px debajo; activo relleno en tinta.
    Arriba, "Bastidor" en texto, sin logotipo inventado.
  · Barra superior: píldoras de las subsecciones (alto 40px, máximo 5; activa en
    tinta con texto superficie), y a la derecha búsqueda, INTERRUPTOR DÍA / NOCHE,
    campana con punto de no leído en marca-500 e iniciales del usuario ("JC").
  · Interruptor día / noche: dos segmentos en píldora, "☀ Día" y "☾ Noche", el
    vigente relleno en tinta; se ven los dos a la vez. Panel: 40px con ícono y
    palabra. Panel en teléfono: solo íconos, 44px cada uno. App: 56px de alto y 72px
    de ancho por segmento, con ícono y palabra.
  · Encabezado: migas de 13px en tinta-2, título o saludo de 40px peso 500.
  · Cifra protagonista: 48px en el panel, 56px en la app, peso 500, -.02em. UNA por
    pantalla y solo donde la cifra decide: "Puntadas de hoy" en el tablero, la tarifa
    vigente y la ganancia del operario. El resto a 22–28px. En el panel, los
    centavos van en tinta-3 (Q866.79 con ".79" atenuado); en la app, completos.
  · Chip de variación en píldora de 24px (ok-suave o critico-suave) con la base de
    comparación escrita al lado ("frente a la quincena anterior a la misma fecha").
  · Gráfica de barras: extremos redondeados; días cerrados en linea-fuerte; hoy en
    dos tramos: abajo SÓLIDO en marca-500 lo terminado, encima RAYADO a 45° (marca-700
    sobre marca-100) lo esperado en curso; globo en píldora tinta con las dos cifras.
    Leyenda: sólido = cerrado y medido; rayado = en curso, todavía no medido.
  · TIRA DEL TURNO (la pieza propia del sistema): barra de 06:00 a 14:00, 16px de alto
    (12px en fichas pequeñas), un tramo por trabajo: terminado sólido en marca-500, en
    curso rayado hasta la línea "ahora", paro en aviso-suave, falla en critico-suave,
    mantenimiento en mtto; huecos sin registro en la pista. Marcas de hora y línea
    "ahora" una sola vez por tarjeta.
  · FICHA DE MÁQUINA: código en Plex Mono, modelo, sus cabezas dibujadas (cuadrados de
    10px, llenos si corre, contorno si no), estado con forma y "desde", operario,
    puntadas terminadas hoy, su tira y el avance al próximo mantenimiento.
  · Iniciales en círculo de 32px, nunca fotos.
  · Tablas dentro de su tarjeta: encabezado sin fondo, 12px tinta-2 en tipo oración,
    línea inferior; filas de 52px separadas por linea-suave; números a la derecha;
    total al pie en 600.
  · Campos: etiqueta arriba siempre visible; superficie-2, radio 20px, línea inferior
    de 2px en linea-fuerte.
  · SELECCIÓN (fondo marca-100, borde 1px marca-500, ✓) distinta del FOCO (contorno 2px
    marca-700 a 2px de separación).
  · Enlaces siempre subrayados. tinta-3 nunca sobre superficie-2 ni sobre fondo.
  · Una sola sombra, 0 24px 48px rgb(0 0 0 / .12), solo en panel de avisos, menús y
    modales.

COLOR — A · Añil, aprobado (azul profundo del corte guatemalteco). No uses otra paleta.
  Día:   fondo #E7E8EB · superficie #FFFFFF · superficie-2 #EDEFF3
         tinta #14171C · tinta-2 #565D68 · tinta-3 #858D99
         linea #D9DDE4 · linea-suave #E8EBF0 · linea-fuerte #838A96
         marca-900 #1B2A4A · marca-700 #2B3A67 · marca-500 #4A63A8 · marca-100 #E3E8F4
  Noche: fondo #101318 · superficie #22262B · superficie-2 #2A2F36
         tinta #E8EAEE · tinta-2 #9BA3AF · tinta-3 #6C7480
         linea #363A3E · linea-suave #2C3035 · linea-fuerte #707883
         marca-900 #B3C4EC · marca-700 #8FA6DE · marca-500 #6E86C4 · marca-100 #293553
  Colores de estado, independientes del añil (día / noche):
         ok #2E6F4E / #6FBF8E · ok-suave #E2F0E7 / #17301F
         aviso #9A6400 / #E0A63C · aviso-suave #F7EDD9 / #33270F
         critico #B0322B / #E4837A · critico-suave #F7E4E2 / #3A2523
         mtto #6D4C9F / #B49AE0
  En chips y franjas el texto va en tinta; el color semántico solo en la forma y el
  fondo suave. Nunca verde, rojo o ámbar como decoración.

ESTADO DE MÁQUINA — color + forma + palabra + "desde HH:MM"
  Corriendo: ok, punto lleno, pulso de opacidad 1 → .45 → 1 cada 2.4s.
  Parada: aviso, punto lleno, totalmente quieto, con el motivo del paro.
  En falla: critico, triángulo, doble parpadeo de 120ms y 3s de reposo.
  En mantenimiento: mtto, cuadrado, barrido diagonal tenue de 3s.
  Sin datos: tinta-3, punto hueco, desvanecimiento 1 → .35 → 1 en 4s.
  Dentro de una tarjeta, la forma va en un círculo neutro de 36px; nunca píldora
  rellena de color.

TIPOGRAFÍA — IBM Plex
  IBM Plex Sans variable (wght 400–700, wdth 85–100) para todo el texto y todas las
  cifras: sus dígitos son tabulares de fábrica; declarar igual tabular-nums.
  IBM Plex Mono 400/500 solo para códigos: BOR-05, OP-007, HUI-001, DPI, hash.
  Escala del panel (px tamaño/interlínea/peso): 11/14/500 riel y marcas de hora ·
  12/16/500 etiquetas y ejes · 13/18/400 migas y secundario · 14/20/400 tablas y
  controles · 16/24/400 párrafos (máx. 66 caracteres) · 18/24/600 título de tarjeta ·
  22/28/500 cifra de ficha · 28/34/500 cifra de tarjeta · 40/46/500 saludo ·
  48/52/500 cifra protagonista.
  App: 13 · 15 · 17 base · 20 · 24 · 32 código de máquina · 56 ganancia · 64 teclado.
  Planilla y tablas densas con font-stretch 90%. En modo noche, texto de 16px o menos
  con peso 450. Etiquetas en tipo oración, nunca mayúscula espaciada.

DENSIDAD
  Panel en escritorio: fila de tabla 52px, control y botón 40px, texto base 14px,
  margen 24px, riel 84px.
  Panel en teléfono: una columna; riel → barra inferior de 64px más área segura con
  5 destinos (Tablero · Máquinas · Producción · Nómina · Más); sin migas; saludo de
  28px; píldoras que se deslizan dentro de su fila; tablas → listas de filas (salvo
  la planilla de nómina, que conserva primera columna fija y "Deslice para ver las
  9 columnas →"); área táctil de 44px en todo; nada depende de pasar el cursor.
  App: fila interna 96–112px, control 56px, botón 72px en píldora, texto base 17px,
  margen 16px; toda tarjeta que se toca con borde de 1.5px en linea-fuerte.

MOVIMIENTO
  Solo se mueve lo que comunica estado, causa o continuidad.
  Tokens: instante 90ms · rápido 140ms · base 200ms · pausado 320ms · cifra 420ms ·
  ambiente 2400ms. Curvas: --sal cubic-bezier(.2,0,0,1) por defecto ·
  --ent cubic-bezier(.4,0,1,1) salidas · --suave cubic-bezier(.4,0,.2,1) ambiental.
  Componentes: contador de puntadas cuenta al llegar dato nuevo (420ms); barra de
  mínimo legal crece al aparecer (320ms) con destello único al cruzar el umbral;
  semáforo de mantenimiento late cada 4s solo por encima del 90%; chip de
  verificación cruza de pendiente a veredicto con opacidad y 4px; franja de alerta
  entra 8px desde arriba; panel de avisos y modales entran 8px, sin escala; cambio de
  modo día/noche con transición de color de 200ms; carga con esqueletos de 1.4s.
  App: marco de escaneo respira 2s y colapsa al centro en 180ms al leer, con sonido
  y vibración; los pasos máquina → diseño → contador avanzan 8px de lado; cada
  dígito del teclado cambia de fondo 90ms; la ganancia cuenta hacia arriba al
  guardar un trabajo; la cola sin conexión baja de a uno.
  NO se anima: transiciones entre pantallas del panel, listas escalonadas, nada
  disparado por desplazamiento, cifras que cuentan al abrir, nada en pantallas de
  dinero salvo la entrada de un aviso. Sin rebotes, sin escalas mayores a 1.02,
  nunca un indicador giratorio. Con prefers-reduced-motion los pulsos se detienen y
  el estado se sigue leyendo por color y forma.

PRINCIPIOS
  1. El número es el protagonista: tabular, a la derecha, con separador de miles, SIN
     abreviar nunca. 5,725,350, jamás "5.7M".
  2. Puntadas y prendas son magnitudes distintas y nunca comparten columna: una
     máquina de 6 cabezas hace 6 prendas con el mismo conteo que una de 1 cabeza hace 1.
  3. El estado se ve antes de leerse, a un metro, por color Y forma.
  4. Contraste alto obligatorio: la planta tiene mala luz y sol directo.
  5. Sin conexión es el estado normal de la app, no un error: franja arriba, cola
     pendiente, nunca un bloqueo.
  6. Todo lo que toca dinero exige confirmación explícita y queda firmado con nombre y
     hora, visible en la misma pantalla. Nada de dinero se autoriza con un solo toque.
  7. Lo cerrado es exacto; lo abierto se dice abierto.
  8. Errores sin códigos ni "algo salió mal": qué pasó, qué se hizo con los datos y
     qué puede hacer la persona. Un error del operario nunca se trata como falta.

QUÉ EVITAR
  Copiar la referencia (marcas, textos en inglés, íconos de criptomonedas, fotos de
  personas). Tarjetas dentro de tarjetas, sombras en tarjetas, degradados, efecto
  vidrio, barras de acento al costado, emoji, Lorem ipsum. Inter o Space Grotesk.
  Patrones de huipil como textura: el textil es el producto, no la decoración. Ninguna
  ilustración en pantallas de dinero. Rankings de operarios. Cifras abreviadas.
  Verde lima como color principal (se confunde con "corriendo").

DATOS — pegue aquí, completo, el bloque "DATOS" del prompt 1 del documento 13
(desde "DATOS — un solo momento" hasta "Personas del panel"). Son datos de ejemplo de
un solo momento: lunes 14 de septiembre de 2026, 13:50. Úsalos exactos.

DATOS ADICIONALES
  Órdenes de producción (código · producto · producidas de objetivo · compromiso ·
  temporada · estado):
    OP-2026-122 Huipil Quetzaltenango aves · 88 de 120 · 15 sep 2026 · Feria de
      Xelajú · vence mañana: faltan 32 y hay 16 en curso
    OP-2026-119 Faja Totonicapán greca · 132 de 500 · 25 sep 2026 · Feria de
      Totonicapán (29 sep) · en riesgo: necesita 37 prendas por día; hoy hizo 36
      con BOR-05 en falla
    OP-2026-114 Huipil Sololá cuello grande · 186 de 240 · 2 oct 2026 · Regular ·
      a tiempo
    OP-2026-121 Tzute Chichicastenango · 90 de 90 · 20 jul 2026 · Regular · entregada
  Inventario: HIL-1147 hilo rojo granate agotado (0 de mínimo 20 conos; causa del
  paro de BOR-03); HIL-1520 verde quetzal 9 de 15 y AGU-7511 agujas 75/11 3 de 4 cajas,
  bajo el mínimo; consumo de hilo superior 5.2 m por mil puntadas; cono de 5,000 m.
  Mantenimiento: BOR-01 lubricación de barras de aguja 2,372,500 de 2,500,000
  (94.9%, aviso); BOR-05 orden correctiva en proceso desde las 09:30 (Óscar Cumes);
  BOR-07 preventivo desde las 07:30.
  Personal: Josue Chuc (Dueño), Ana Lucía Sajché (Gerencia), Pedro Xicará
  (Supervisión), Claudia Mux (RRHH), Óscar Cumes (Mantenimiento), Elena Tubac (Bodega).
  Anticipo por autorizar: Manuel Tzunún Coyoy, Q300.00, registrado por Claudia Mux a
  las 13:25.
  Nómina: cuotas patronales (IGSS 10.67%, INTECAP 1%, IRTRA 1%) Q1,512.04 sobre
  Q11,934.04 devengados sin bonificación.
  Discrepancias sin resolver: BOR-05 · Rosa Elena Batz Quiej · FAJ-010 × 12 ·
  esperado 148,800 · medido 156,200 · +4.97% · sábado 12 sep; BOR-03 · Manuel Tzunún
  Coyoy · COR-021 · −3.12% · viernes 11 sep.

Confirma que entendiste el sistema de diseño y espera el primer lote de pantallas.
```

---

## §2 · Lotes de pantallas

### Lote 1 · Fundamentos y muestrario

```
Diseña un lienzo con 2 mesas de trabajo.

MESA 1 — "Piezas del sistema", 1440×1800, en modo día y, al lado, en modo noche.
Agrupado con títulos de sección en tipo oración:
· Tarjeta con su título y botón ↗; fila interna; riel con Tablero activo;
  píldoras con una activa; barra inferior del teléfono.
· Interruptor día / noche en sus tres tamaños: panel (40px con palabra), panel en
  teléfono (44px solo íconos) y app (56 × 72px por segmento, con palabra).
· Botones: primario, secundario y destructivo, en normal, hover, presionado, foco,
  deshabilitado y "Guardando…". Alto 40px en el panel, 72px en la app.
· Campos: texto, DPI con formato en vivo (3056 78914 0401), puntadas (2,918,400),
  selector, rango de fechas con sus cinco atajos (Hoy · Esta semana · Esta quincena ·
  Este mes · Rango libre), casilla. Un campo con error: "El dígito verificador no
  corresponde. Revise el número del DPI." y uno validado con ✓. Selección y foco
  lado a lado para que se vea que no son lo mismo.
· Estados de máquina: los cinco, con forma en círculo neutro, palabra y "desde
  HH:MM", y su movimiento anotado.
· Chips de verificación: ok +0.18% · revisar +2.40% · discrepancia +4.97% · sin
  declarar. Sin relleno de color: forma coloreada y texto en tinta.
· Contador de puntadas: 2,918,400 en la quincena de Juana Ixchop Tzoc, con "+305,670
  hoy, de trabajos terminados" y, aparte y rayado, "en curso: 85,200 esperadas".
· Barra de mínimo legal: Diego Puac Ajanel al 167.3% en ok y Rosa Elena Batz Quiej
  al 76.8% en critico, ambas con la marca del umbral 2,453,721.
· Semáforo de mantenimiento: BOR-01 al 94.9% en aviso, BOR-04 al 31%.
· Ficha de máquina de BOR-06 (2 cabezas) con su tira del turno.
· Gráfica de barras de la quincena con hoy en sólido y rayado y su globo.
· Panel de avisos con un aviso sin leer y uno leído.
· Fila de tabla: encabezado, dos filas y una seleccionada.

MESA 2 — "Ingreso al panel" (A1): pega la PANTALLA A1 de la hoja, prompt 7.
```

### Lote 2 · Tablero

```
Diseña 1 lienzo con 4 mesas.

MESA 1 — "Tablero general" (B1), 1440 de ancho: pega la PANTALLA B1 de la hoja,
prompt 2.
MESA 2 — "Tablero con los avisos abiertos": pega la PANTALLA B1 · con los avisos
abiertos de la hoja, prompt 2.
MESA 3 — "Tablero en el teléfono del dueño" (B1·T), 390 de ancho: pega la PANTALLA
B1·T de la hoja, prompt 2.
MESA 4 — "Tablero · estados", 1440×1200, tres recortes del mismo tablero:
  · A las 06:20, sin trabajos terminados: la tarjeta "Hoy" dice "Aún no hay trabajos
    terminados hoy · 6 en curso desde las 06:01" con las esperadas rayadas; la
    gráfica muestra hoy solo rayado.
  · Sin conexión, en el teléfono del dueño: franja "Sin conexión. Lo que ve es de las
    13:50."; la acción "Autorizar" del anticipo desactivada con "Autorizar necesita
    conexión".
  · Sin noticias de un teléfono: la fila de BOR-02 agrega en tinta-2 "Sin noticias
    del teléfono desde 12:41"; su estado sigue "corriendo desde 12:40".
```

### Lote 3 · Máquinas y asignación

```
Diseña 1 lienzo con 5 mesas de 1440 de ancho.

MESA 1 — "Máquinas · parrilla" (D1): pega la PANTALLA D1 de la hoja, prompt 3.

MESA 2 — "Máquinas en el teléfono" (D1·T), 390 de ancho: las 8 fichas en una
columna, detenidas primero (BOR-05, BOR-03, BOR-07, BOR-08) y abiertas con su acción
a todo el ancho; las que corren, compactas con su tira. Filtros en píldoras que se
deslizan. Barra inferior con Máquinas activo.

MESA 3 — "Máquina · ficha BOR-01" (D3), alto 1400
  Píldoras: Resumen (activa) · Producción · Mantenimiento · Historial.
  Encabezado: BOR-01 en Plex Mono 40px, "Feiya FY-1206 · Dahao BECS-A15 · 6 cabezas
  · 850 puntadas por minuto" y sus 6 cabezas dibujadas, llenas; estado "corriendo
  desde 12:05" con Diego Puac Ajanel.
  Tarjeta "Hoy" en una franja: "213,300 puntadas de trabajos terminados" en 28px,
  "42 prendas", "+ 127,500 en curso" rayado y "Con trabajo abierto 7 h 31 min de
  7 h 50 min de turno (96%)". Debajo, su tira del turno a todo el ancho con los
  códigos de diseño dentro de los tramos.
  Tarjeta "Trabajos de hoy": tabla con los dos terminados (TZU-004 × 4 · 24 prendas
  · 85,420 · ok +0.26% y HUI-001 × 3 · 18 · 127,880 · ok +0.30%) y el en curso
  arriba, rayado.
  Tarjeta "Mantenimiento", lista por urgencia: lubricación de barras de aguja
  2,372,500 de 2,500,000 (94.9%, aviso) con "Faltan 127,500: se cruzan al terminar el
  trabajo en curso" · cambio de cuchilla de corte 41% · revisión de correas 12%.
  Botón "Generar orden de mantenimiento".
  Tarjeta "Quincena": 2,287,400 puntadas · Q1,524.93.

MESA 4 — "Máquina · alta" (D2), alto 1000
  Formulario de una columna, máx. 640px: código (BOR-09), marca, modelo,
  controlador, cabezas (al teclear el número, las cabezas se dibujan), puntadas por
  minuto nominales, fecha de ingreso, ubicación en planta. Vista previa del rótulo
  con QR y botón "Imprimir rótulo". Barra fija al pie: "Cancelar" y "Guardar
  máquina". Nota: "Esta pantalla es más cómoda en una computadora" en su versión de
  teléfono.

MESA 5 — "Asignación de máquinas" (D4): pega la PANTALLA D4 de la hoja, prompt 3.
```

### Lote 4 · Operarios

```
Diseña 1 lienzo con 3 mesas de 1440 de ancho.

MESA 1 — "Operarios · listado" (C1)
  Píldoras: Activos 5 (activa) · Inactivos · Todos. Botón "+ Agregar operario".
  Tarjeta con tabla: iniciales y nombre · código · máquinas · puntadas de la
  quincena · devengado (destajo + séptimo) · mínimo legal.
    Juana Ixchop Tzoc · OP-014 · BOR-04 · 2,918,400 · Q2,269.87 · 118.9%
    Marta Chocoj Sical · OP-021 · BOR-02 · 3,412,700 · Q2,654.32 · 139.1%
    Diego Puac Ajanel · OP-007 · BOR-01, BOR-06 · 4,105,220 · Q3,192.95 · 167.3%
    Rosa Elena Batz Quiej · OP-033 · BOR-05 · 1,884,900 · Q1,466.03 · 76.8%, con
      forma critico y subfila "Le faltan 568,821 puntadas: complemento Q442.42"
    Manuel Tzunún Coyoy · OP-018 · BOR-03 · 2,451,180 · Q1,906.47 · 99.9%, con
      subfila "Le faltan 2,541 puntadas: complemento Q1.98"
    Total · 14,772,400 · Q11,489.64
  Las puntadas cuentan solo trabajos terminados; nota al pie: "Hay 4 trabajos en
  curso que se suman al finalizar." Ordenado por nombre, nunca por producción: no es
  un ranking.

MESA 2 — "Operario · alta" (C2), alto 1400
  Formulario de una columna, máx. 640px, con secciones separadas por título:
  · Identificación: DPI de 13 dígitos con formato en vivo 3056 78914 0401 y
    validación del dígito verificador; al validar, debajo en 13px el departamento y
    municipio deducidos ("Chimaltenango · Chimaltenango"). Nombres y apellidos en
    campos separados, incluido apellido de casada. Fecha de nacimiento.
  · Contacto: teléfono, dirección, departamento, municipio.
  · Laboral: fecha de ingreso, modalidad de pago (destajo, tiempo, mixto) en píldoras,
    turno, número de IGSS, NIT.
  · Máquinas: selector múltiple que muestra cuáles están libres y cuáles ya tienen
    operario. Aviso informativo: "Solo podrá comenzar trabajos en las máquinas que se
    le asignen aquí."
  · Gafete: vista previa con el código OP-041 y su QR; botón "Imprimir gafete".
  Barra fija al pie: "Cancelar" y "Guardar operario". Un campo de DPI con el error
  "El dígito verificador no corresponde. Revise el número del DPI." y el valor
  tecleado intacto.

MESA 3 — "Operario · ficha" (C3): pega la PANTALLA C3 de la hoja, prompt 3.
```

### Lote 5 · Ganancias

```
Diseña 1 lienzo con 3 mesas de 1440 de ancho. Solo el dueño entra aquí; es donde
define cuánto gana la gente. Sin movimiento salvo la entrada de un aviso.

MESA 1 — "Tarifas de destajo" (E1): pega la PANTALLA E1 de la hoja, prompt 4. Agrega
al lado el modal de "+ Nueva tarifa" con la consecuencia exacta: "La tarifa vigente
se cerrará el 30 de septiembre de 2026 y la nueva regirá desde el 1 de octubre. Las
quincenas ya cerradas no cambian. Quedará firmada a su nombre." Botones "Cancelar" y
"Crear tarifa".

MESA 2 — "Simulador de ganancia" (E2), alto 900
  Tarjeta "Supongamos" a la izquierda: puntadas por Q1.00 (1,500), velocidad de la
  máquina (850 puntadas por minuto), eficiencia (70%), días trabajados en la
  quincena (13), categoría (CE2 no agrícola).
  Tarjeta "Resultado por operario en la quincena" a la derecha, en filas:
    puntadas proyectadas 3,712,800 · destajo Q2,475.20 · séptimo día Q412.53 ·
    complemento al mínimo Q0.00 · bonificación incentivo Q125.00 · IGSS laboral
    −Q139.48 · neto Q2,873.25 · cuotas patronales Q365.88 · costo para la fábrica
    Q3,378.61 (sin prestaciones).
  Nota: "Es una simulación. No cambia ninguna tarifa ni ninguna quincena."

MESA 3 — "Descuentos y bonificaciones" (E3), alto 900
  Dos tarjetas: "Bonificaciones" (puntualidad, producción, antigüedad) y "Descuentos"
  (anticipo, préstamo, pérdida de material), cada concepto con su tope como
  porcentaje del salario y "requiere autorización".
  Tarjeta "Por autorizar": anticipo de Manuel Tzunún Coyoy, Q300.00, registrado por
  Claudia Mux a las 13:25, con "Rechazar" y "Autorizar"; "Autorizar" abre la
  confirmación con la firma "Autorizado por · Josue Chuc · Dueño".
  Aviso: "Un descuento no puede dejar el pago neto por debajo del salario mínimo
  protegido."
```

### Lote 6 · Producción y verificación

```
Diseña 1 lienzo con 4 mesas de 1440 de ancho.

MESA 1 — "Trabajos del día" (F1)
  Píldoras: Trabajos del día (activa) · Discrepancias 2 · Órdenes.
  Arriba, "4 en curso" en filas rayadas con hora de inicio y esperadas (BOR-01
  HUI-001 × 3 desde 12:05 · 127,500; BOR-02 HUI-002 × 2 desde 12:40 · 77,800;
  BOR-04 TZU-004 × 4 desde 13:02 · 85,200; BOR-06 HUI-002 × 2 desde 13:20 · 77,800)
  y el de BOR-05 "detenido por la falla desde las 09:14".
  Debajo, los 15 trabajos terminados de hoy en tabla: inicio–fin · máquina ·
  operario · diseño × repeticiones · cabezas · prendas · esperado · medido ·
  verificación · registrado desde ("teléfono de Diego", o "corregido por Pedro
  Xicará" con el valor anterior tachado). Total: 168 prendas · 1,300,180 puntadas.
  Filtros de máquina, operario y verificación.

MESA 2 — "Bandeja de discrepancias" (F2): pega la PANTALLA F2 de la hoja, prompt 4.

MESA 3 — "Órdenes de producción" (F3)
  Tarjeta con una fila por orden, ordenadas por urgencia, cada una con su barra de
  avance (producidas sobre objetivo), compromiso, temporada y estado:
    OP-2026-122 · vence mañana (forma de aviso) · 88 de 120 · "faltan 32 · 16 en curso"
    OP-2026-119 · en riesgo (forma de aviso) · 132 de 500 · "necesita 37 por día"
    OP-2026-114 · a tiempo · 186 de 240
    OP-2026-121 · entregada · 90 de 90
  Una orden vencida sin terminar se marcaría "Vencida hace N días" en critico;
  muéstrala como variante en un recorte.

MESA 4 — "Orden · detalle" (F4), alto 1200
  OP-2026-119 · Faja Totonicapán greca · 132 de 500 · compromiso 25 sep 2026.
  Tarjeta "Cómo va": 26.4% en 28px, "faltan 368 prendas en 10 días hábiles" y
  "necesita 37 por día; hoy hizo 36". Chip de aviso "En riesgo".
  Tarjeta "Hilo": "4,563,200 puntadas · unos 23,729 m · unos 5 conos" y el aviso
  "HIL-1147 rojo granate está agotado" con enlace a Inventario.
  Tarjeta "Trabajos de la orden hoy": BOR-04 FAJ-010 × 4 · 4 prendas · 49,710; BOR-05
  FAJ-010 × 8 · 32 prendas · 99,410; BOR-05 FAJ-010 × 8 detenido por la falla.
```

### Lote 7 · Catálogo

```
Diseña 1 lienzo con 4 mesas de 1440 de ancho.

MESA 1 — "Diseños" (G1): pega la PANTALLA G1 de la hoja, prompt 5.

MESA 2 — "Diseño · alta desde archivo" (G2), alto 1000
  Zona para soltar un archivo DST. Después de leerlo, la firma extraída en dos
  columnas: lo que declara el encabezado del archivo y lo contado en sus registros.
    Puntadas declaradas 42,500 · contadas 42,500 · coinciden
    Cambios de color declarados 9 · contados 9 · coinciden
    Saltos 214 · ancho 186.4 mm · alto 203.1 mm
    Huella del archivo (SHA-256, truncada) en Plex Mono
  Variante con discrepancia, en aviso: "El encabezado declara 42,500 puntadas, pero
  el archivo contiene 42,731. Se usará el conteo real. Es probable que el archivo se
  haya editado."
  Campos: código, nombre, versión, región, producto asociado. Vista previa de la
  etiqueta con QR y botón "Imprimir etiqueta para el bastidor".

MESA 3 — "Productos" (G3)
  Tabla: código, nombre, tipo de prenda (huipil, sobrehuipil, corte, faja, tzute,
  perraje, tocoyal), región, talla, diseños que lo componen, puntadas por prenda,
  costo estimado y precio de venta.

MESA 4 — "Temporadas" (G4), alto 1000
  Calendario del año en una franja horizontal con la línea "hoy, 14 sep": Feria de
  Xelajú e Independencia el 15 de septiembre (mañana, en aviso), Feria de Totonicapán
  el 29 de septiembre, Todos Santos el 1 de noviembre, Navidad; Semana Santa y Día de
  la Madre ya pasadas, en linea-suave.
  Debajo, tabla de temporadas con sus órdenes: Feria de Xelajú → OP-2026-122;
  Feria de Totonicapán → OP-2026-119.
```

### Lote 8 · Nómina

```
Diseña 1 lienzo con 5 mesas. Es el lote de mayor consecuencia legal: todo número
debe verse verificable y todo cierre debe verse deliberado. Sin movimiento.

MESA 1 — "Nómina · períodos" (H1), 1440×900
  Tarjeta con una fila por quincena: período · estado · operarios · puntadas · neto ·
  aprobó.
    1 al 15 sep 2026 · Abierta · 5 · 14,772,400 al 14 sep · Q11,982.63 al 14 sep · —
    16 al 31 ago 2026 · Pagada · 5 · 14,998,200 · Q11,726.84 · Josue Chuc, 1 sep 09:12
    1 al 15 ago 2026 · Pagada · 5 · 15,206,900 · Q11,881.32 · Josue Chuc, 17 ago 08:47
  La abierta dice "cierra mañana" y "2 trabajos sin resolver".

MESA 2 — "Cálculo de la quincena" (H2): pega la PANTALLA H2 de la hoja, prompt 5.
Agrega al lado el modal de cierre, mostrado como variante sin discrepancias: "Se
cerrará la quincena del 1 al 15 de septiembre con 5 operarios y Q11,982.63 a pagar.
Después de cerrar no se pueden editar los trabajos de este período. Hay 2 trabajos en
curso: se pagarán en la quincena en que se finalicen. Quedará registrado a su
nombre." Botones "Cancelar" y "Cerrar quincena".

MESA 3 — "Planilla en el teléfono" (H2·T), 390 de ancho
  Resumen arriba: "A pagar Q11,982.63", "Complementos Q444.40", y una fila con
  forma critico "Rosa Elena Batz Quiej no llega al mínimo". Debajo, la planilla con la
  primera columna fija y "Deslice para ver las 9 columnas →". Barra inferior con
  Nómina activo.

MESA 4 — "Constancia de pago" (H3), carta vertical, para imprimir en modo día
  Constancia de Rosa Elena Batz Quiej, OP-033, quincena del 1 al 15 de septiembre
  (cálculo al 14). Devengado: destajo Q1,256.60 (1,884,900 puntadas a 1,500 por
  Q1.00) · séptimo día Q209.43 · complemento al mínimo Q442.42, nombrado y con su
  artículo · bonificación incentivo Q125.00. Descuentos: IGSS 4.83% Q92.18. Neto
  Q1,941.27 grande. Al pie, espacio de firma y la tarifa aplicada.

MESA 5 — "Libro de salarios y planilla IGSS" (H4), 1440×1000
  Dos pestañas, formato tabular sobrio para imprimir. Nota: "Libro de salarios
  autorizado por el Ministerio de Trabajo, obligatorio con 10 o más trabajadores
  permanentes, artículo 102 del Código de Trabajo."
```

### Lote 9 · Inventario y mantenimiento

```
Diseña 1 lienzo con 5 mesas de 1440 de ancho.

MESA 1 — "Existencias" (I1): pega la PANTALLA I1 de la hoja, prompt 6.

MESA 2 — "Movimientos" (I2)
  Lista cronológica en una tarjeta: tipo (entrada, salida, ajuste, traslado,
  consumo de producción, merma) · artículo · cantidad · bodega · referencia · quién ·
  cuándo. Los consumos enlazan a su trabajo ("BOR-03 · COR-021 × 4 · 11:52–12:30").
  La última salida de HIL-1147 hoy a las 11:40 dejó la existencia en 0.

MESA 3 — "Artículo · alta" (I3), alto 900
  Formulario de una columna: código, nombre, clase, unidad, bodega, mínimo y, para
  hilos, consumo por mil puntadas con la ayuda "Sirve para calcular el hilo de una
  orden antes de empezarla".

MESA 4 — "Semáforo por máquina" (J1): pega la PANTALLA J1 de la hoja, prompt 6.

MESA 5 — "Órdenes de mantenimiento" (J2)
  Tarjeta con filas: máquina · tarea · disparador (puntadas, días, falla) · estado ·
  programada · quién · repuestos.
    BOR-05 · correctiva por "falla de la máquina" · en proceso desde 09:30 · Óscar
      Cumes · arriba, con forma critico
    BOR-07 · preventivo · en proceso desde 07:30 · Óscar Cumes
    BOR-01 · lubricación de barras de aguja · por generar (94.9%)
  Al cerrar una orden se pide qué se hizo y los repuestos usados.
```

### Lote 10 · Reportes y configuración

```
Diseña 1 lienzo con 4 mesas de 1440 de ancho.

MESA 1 — "Constructor de informes" (K1): pega la PANTALLA K1 de la hoja, prompt 7.

MESA 2 — "Usuarios y roles" (L1): pega la PANTALLA L1 de la hoja, prompt 7.

MESA 3 — "Parámetros legales" (L2), alto 1000
  Los valores que cambian por acuerdo gubernativo y nunca van en el código: salario
  mínimo por circunscripción y categoría, bonificación incentivo Q250.00, IGSS
  laboral 4.83%, patronal 10.67%, INTECAP 1%, IRTRA 1%, provisiones de aguinaldo,
  Bono 14, vacaciones e indemnización. Cada valor con su vigencia y su fuente.
  Aviso: "Cambiar un parámetro no altera las quincenas ya cerradas." Botón de cambio
  con confirmación y firma.

MESA 4 — "Auditoría" (L3)
  Tabla densa filtrable: quién · qué hizo · registro · antes → después · cuándo ·
  desde dónde. Entradas:
    Josue Chuc cambió la tarifa general: 1,600 → 1,500 puntadas por Q1.00 · 28 dic
      2025 16:20
    Pedro Xicará asignó BOR-06 a Diego Puac Ajanel · de turno · 14 sep 2026 05:58
    Claudia Mux registró un anticipo de Q300.00 para Manuel Tzunún Coyoy · 14 sep
      2026 13:25
    Pedro Xicará corrigió el contador final de BOR-03 · 8,203,410 → 8,203,140 ·
      11 sep 2026 15:02 · motivo "dígitos invertidos"
```

### Lote 11 · App del operario · ingresar y comenzar

```
Diseña 1 lienzo con 4 mesas de 390×844. Reglas de la app del prompt base: texto base
17px, botones de 72px, tarjetas que se tocan con borde de 1.5px en linea-fuerte,
cifras completas sin centavos atenuados. Fluidas de 360 a 430px.

MESA 1 — "Ingreso con gafete" (P1)
  Casi vacía: "Escanee su gafete", visor de cámara grande con su marco, y la
  alternativa siempre visible "Ingresar mi código". Variante sin señal en un teléfono
  nuevo: "Este teléfono necesita conexión la primera vez."

MESA 2 — "Inicio" (P2): pega la PANTALLA P2 de la hoja, prompt 8.

MESA 3 — "Comenzar · escanear" (P3)
  Tres pasos en píldoras arriba: Máquina ✓ · Diseño (activo) · Contador.
  Visor a pantalla completa: "Escanee el código del diseño" y botón secundario
  "Escribir el código".
  Variante, la regla de acceso hecha visible: forma de aviso, "La máquina BOR-07 no
  está asignada a usted", "Pida a su supervisor que se la asigne", y "Volver a mis
  máquinas".
  Variante sin señal: "Este diseño no está guardado en el teléfono. Puede comenzar
  igual; se confirma al volver la señal."

MESA 4 — "Comenzar · contador" (P4, 10:51)
  Arriba, lo escaneado: BOR-06 · HUI-002 Huipil Quetzaltenango aves · "38,900
  puntadas por repetición".
  "Teclee el número que marca la máquina": 8,412,300 enorme con separador, teclado
  numérico propio de dígitos de 64px. Repeticiones planeadas: 2, con "→ 4 prendas ·
  77,800 puntadas esperadas".
  Botón primario de 72px: "Comenzar". Enlace "Tomar foto del contador", opcional.
```

### Lote 12 · App del operario · en curso, finalizar, paros y ganancia

```
Diseña 1 lienzo con 5 mesas de 390×844.

MESA 1 — "En curso y finalizar" (P4): pega la PANTALLA P4 de la hoja, prompt 8, con
sus tres marcos (incluido el número que no cuadra).

MESA 2 — "Resultado" (P5)
  Variante correcta, ya en la hoja como marco 2 de P4: forma ok, "Trabajo
  verificado", esperado 77,800, medido 77,940, +0.18%, 4 prendas (2 repeticiones ×
  2 cabezas), ganancia del trabajo Q51.96.
  Variante con discrepancia (Rosa Elena Batz Quiej, sábado 12 sep): forma y color de
  aviso, nunca de falla; "Revisar con el supervisor"; esperado 148,800, medido
  156,200, +4.97%; "El trabajo quedó registrado y cuenta con lo medido. Su supervisor
  lo revisará. Esto no es una falta: a veces el diseño declarado no es el que se
  bordó." Tres botones opcionales de 72px: "Cambié de diseño" · "Se rompió el hilo y
  repetí" · "Otra cosa".
  Explícita en pantalla la diferencia entre repeticiones y prendas.

MESA 3 — "Reportar paro" (P6, BOR-03, 12:30)
  Cinco botones de 88px, uno por causa, cada uno con su forma: rotura de hilo, falta
  de material, cambio de bastidor, falla de la máquina, fin de turno. Elegida "falta
  de material", pide cuál: HIL-1147 hilo rojo granate. Nota opcional. Confirmación
  breve con la hora: "Paro registrado a las 12:30."

MESA 4 — "Mi ganancia" (P7): pega la PANTALLA P7 de la hoja, prompt 8.

MESA 5 — "Sin conexión" (P8): pega la PANTALLA P8 de la hoja, prompt 8.
```

### Lote 13 · Movimiento y estados vivos

```
Diseña 1 lienzo dedicado al sistema de movimiento. Es una especificación visual: cada
animación con su nombre, duración, curva y una tira de fotogramas que la explica sin
verla correr. Mismo estilo moderno: tarjetas, anotaciones en Plex Sans de 12px.

MESA 1 — "Estados de máquina", 1440×900
  Cinco filas, una por estado, con el indicador a tamaño real y 5 fotogramas:
    Corriendo — opacidad 1 → .45 → 1, 2.4s, --suave, infinito
    Parada — sin animación; fotogramas idénticos a propósito, "la quietud es la señal"
    En falla — doble parpadeo de 120ms y 3s de reposo
    En mantenimiento — barrido diagonal tenue, 3s
    Sin datos — 1 → .35 → 1, 4s

MESA 2 — "Componentes", 1440×1100
    Contador de puntadas — de 290,990 a 368,930 en 420ms al guardar el trabajo de
      BOR-06, ancho fijo
    Barra de mínimo legal — de 0 a 167.3% en 320ms, destello en la marca del umbral
    Semáforo — BOR-01 al 94.9% latiendo cada 4s; BOR-04 al 31% quieto
    Chip de verificación — de "pendiente" a "ok +0.18%", opacidad y 4px
    Franja de alerta — entra 8px desde arriba; colapsa al resolverse
    Interruptor día / noche — transición de color de 200ms en toda la pantalla
    Esqueleto de carga — barrido de 1.4s, con la nota tachada "nunca un indicador
      giratorio"

MESA 3 — "En la app", 3 pantallas de 390×844 en secuencia
    Marco de escaneo respirando 2s y su colapso en 180ms, con sonido y vibración
    anotados; los tres pasos máquina → diseño → contador con su avance de 8px; la
    ganancia del día contando de Q193.99 a Q245.95 al guardar; la cola sin conexión
    bajando de 1 a 0.

MESA 4 — "Movimiento reducido", 1440×600
    Los cinco estados con prefers-reduced-motion: sin pulsos, por color y forma. Al
    lado, lo que cambia: los conteos saltan al valor final, las barras aparecen en su
    valor, las transiciones quedan en 90ms de opacidad. Encabezado: "Ninguna
    información de este sistema depende únicamente del movimiento."
```

### Lote 14 · El panel en el teléfono del dueño

```
Diseña 1 lienzo con 3 mesas de 390 de ancho y alto propio, con las reglas de
"Panel en teléfono" del prompt base (brief 11 §6.5). Si los lotes 2, 3 y 8 ya trajeron
B1·T, D1·T y H2·T, este lote los reúne y agrega lo que falta:

MESA 1 — "Avisos en el teléfono": el panel de avisos de B1 como hoja inferior a todo
el ancho, con las acciones al alcance del pulgar. El anticipo de Manuel Tzunún Coyoy
con "Rechazar" y "Autorizar"; al tocar "Autorizar", la confirmación también como hoja
inferior, con el monto, el nombre y "Quedará firmado a su nombre".

MESA 2 — "Más": la hoja inferior con los demás módulos (Operarios, Ganancias,
Catálogo, Inventario, Mantenimiento, Reportes, Configuración) y la búsqueda.

MESA 3 — "Pantalla de escritorio en el teléfono": Reportes (K1) abierta en el
teléfono, en una columna y con la nota "Esta pantalla es más cómoda en una
computadora". Sigue funcionando; nunca se bloquea.
```

---

## §3 · Prompts de refinamiento

Usar después de aprobar un lote.

### Revisión del estilo moderno

```
Revisa las mesas aprobadas contra la dirección moderna del prompt base y corrige lo
que no cumpla, sin cambiar lo aprobado:
· Ninguna tarjeta dentro de otra; ninguna sombra fuera de avisos, menús y modales.
· Una sola cifra protagonista por pantalla, y solo donde decide.
· Ninguna fila de tres o cuatro tarjetas con cifra gigante y etiqueta: cada tarjeta
  con la forma de su pregunta.
· Estados de máquina con forma en círculo neutro, sin píldora rellena de color.
· Ninguna puntada de un trabajo abierto como si fuera medida; todo "hoy" dice "de
  trabajos terminados"; todo estado dice "desde HH:MM".
· Campos con línea inferior en linea-fuerte, enlaces subrayados, selección distinta
  del foco, tinta-3 nunca sobre superficie-2 ni fondo.
· Ningún verde, rojo o ámbar como decoración. En pantalla, "trabajo", nunca
  "corrida".
Devuelve la versión corregida y una lista corta de qué cambiaste y por qué.
```

### Modo noche

```
Produce la versión en modo noche de las mesas aprobadas, con los tokens de noche del
prompt base. No inviertas mecánicamente: el texto de 16px o menos sube a peso 450;
los colores semánticos siguen distinguiéndose entre sí; la píldora activa y el botón
primario van en tinta clara con texto oscuro; el rayado de "en curso" sigue
viéndose sobre la tarjeta. Gráficas e indicadores toman su color de los tokens. El
interruptor muestra "Noche" como vigente.
Prioriza la app del operario: el turno de noche es cuando más se usa.
```

### Estados de cada pantalla

```
Para las pantallas del lote anterior, diseña sus estados según brief 11 §9, Casos
límite:
· Vacío, que dice qué falta y ofrece la acción: "Aún no hay trabajos terminados hoy.
  Aparecen aquí cuando un operario finaliza uno en su teléfono." Si hay trabajos en
  curso, el vacío lo dice.
· Cargando, con esqueletos de la forma final (filas, barras, tiras), nunca un
  indicador giratorio; si tarda más de 10 segundos, dice qué espera.
· Error de servidor: qué pasó, qué se hizo con los datos y qué puede hacer la
  persona, con lo tecleado intacto. Nunca un código ni "algo salió mal".
· Sin permiso: lo que el rol puede ver pero no cambiar aparece sin el control y con
  la razón ("Solo el dueño cambia tarifas").
· Sin conexión: en la app, franja y cola pendiente con la hora del toque; en el
  panel, "Lo que ve es de las 13:50" y lo de dinero desactivado con su razón.
· Nombres largos: "María de los Ángeles Xiloj Tzoc de Chávez" entero, en dos líneas;
  cifras hasta 99,999,999 puntadas y Q999,999.99 sin romper columnas.
```

### El panel en tableta y teléfono

```
Adapta las pantallas aprobadas del panel con brief 11 §6.5. No las reduzcas:
reordénalas.
· Tableta (768 a 1199px): el riel se queda; cuadrícula de 8 columnas; las filas de
  dos tarjetas se apilan; las tablas guardan sus columnas de menor prioridad detrás
  de ↗.
· Teléfono (menos de 768px): una columna en orden de prioridad; barra inferior de 5
  destinos; sin migas; saludo de 28px; píldoras que se deslizan; tablas → listas de
  filas con la primera columna como título y 2 o 3 cifras clave; la planilla de
  nómina se queda planilla con primera columna fija; área táctil de 44px; nada al
  pasar el cursor.
· La página nunca se desplaza de lado. Con zoom al 200% en escritorio, pasa al
  diseño siguiente.
```

### Impresión

```
Diseña las versiones para imprimir de la constancia de pago, el libro de salarios,
la planilla del IGSS y la orden de mantenimiento. Tamaño carta, modo día, tinta
negra sobre blanco, sin fondos de color ni tarjetas, cifras en Plex Sans tabular y
espacio de firma. Encabezado con la fábrica, el período y el folio; pie con la fecha
de emisión y quién la generó.
```

### Impresos de planta

```
Diseña las etiquetas físicas que conectan la planta con el sistema:
· Gafete del operario: nombre, código OP-007, foto (solo en el gafete físico; en
  pantalla las personas van con iniciales) y QR grande.
· Rótulo de máquina: BOR-01 muy grande, legible a varios metros, con el QR debajo y
  el modelo en letra pequeña.
· Etiqueta de bastidor: HUI-001, nombre, 42,500 puntadas, 9 cambios de color y su QR.
Los tres deben resistir una fotocopia en blanco y negro y seguir escaneándose.
```
