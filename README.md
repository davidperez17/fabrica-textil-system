# Sistema de administración para fábrica textil de trajes típicos — Guatemala

Investigación previa al diseño. Fecha: 7 de septiembre de 2026.
La empresa aún no tiene nombre definido; en el código se usa el marcador `fabrica-textil`.

## Alcance investigado

Administración de una fábrica de bordado computarizado de trajes típicos guatemaltecos:
conteo de puntadas, estado de máquinas, informes por fechas personalizadas, ganancia de
operarios a destajo (Q1 por cada 1,500 puntadas), registro de operarios por DPI, PWA para
trabajadores, catálogo por temporadas, verificación del código de diseño a partir del
conteo de puntadas, producción por máquina, descuentos y bonificaciones, inventario y
mantenimiento preventivo disparado por puntadas.

## Documentos

| # | Documento | Contenido |
|---|---|---|
| 01 | [Resumen y decisiones](docs/01-resumen-y-decisiones.md) | Los cinco hallazgos que condicionan el diseño. **Empezar aquí.** |
| 02 | [Captura de puntadas](docs/02-captura-de-puntadas.md) | Las cuatro vías de captura, matriz de decisión, reglas de integridad del contador |
| 03 | [Verificación de diseño](docs/03-verificacion-de-diseno.md) | Por qué inferir no funciona y verificar sí; algoritmo y tolerancias |
| 04 | [Nómina a destajo y ley](docs/04-nomina-destajo-legal.md) | Marco legal, salarios mínimos 2026, aritmética de la tarifa, casos calculados |
| 05 | [Arquitectura y PWA](docs/05-arquitectura-y-pwa.md) | Stack, modelo offline con outbox idempotente, diseño de la app del operario |
| 06 | [Mantenimiento preventivo](docs/06-mantenimiento-preventivo.md) | Intervalos por puntadas, equivalencia horas↔puntadas |
| 07 | [Catálogo, temporadas e inventario](docs/07-catalogo-inventario-temporadas.md) | Taxonomía del traje típico, estacionalidad, flujo de materiales, FEL |
| 08 | [Reportes e indicadores](docs/08-reportes-kpi.md) | Informes por fecha, OEE, alertas, reportes obligatorios por ley |
| 09 | [Riesgos, ruta y preguntas](docs/09-riesgos-roadmap-preguntas.md) | Qué falta saber, qué puede salir mal, en qué orden construir |
| 10 | [Fuentes](docs/10-fuentes.md) | Todo lo consultado, con enlaces |
| 11 | [Brief de diseño](docs/11-brief-de-diseno.md) | Roles y permisos, tokens, componentes, las 37 pantallas, datos de ejemplo |
| 12 | [Prompts para Claude Design](docs/12-prompts-claude-design.md) | Prompt base más 14 lotes listos para copiar |

## Sitio publicado

GitHub Pages: <https://davidperez17.github.io/fabrica-textil-system/>

| Página | Contenido |
|---|---|
| [`index.html`](https://davidperez17.github.io/fabrica-textil-system/) | **Cotización**: compra total del sistema con código fuente, y dos opciones de mantenimiento (por cuenta del cliente o mensual por Servicios Digitales). Los montos se editan en el objeto `COT` al final del archivo y todo se recalcula. |
| [`informe.html`](https://davidperez17.github.io/fabrica-textil-system/informe.html) | Informe ejecutivo de la investigación |
| [`brief.html`](https://davidperez17.github.io/fabrica-textil-system/brief.html) | Brief de diseño con el sistema de diseño en vivo |

## Artefactos

- `index.html` — cotización para el cliente, con la identidad de
  [Servicios Digitales Guatemala](https://serviciosdigitalesgtm.com/). Imprimible a PDF desde el navegador.
- `assets/` — logotipo e ícono de Servicios Digitales.

- `db/schema.sql` — esquema PostgreSQL completo: organización, operarios, máquinas,
  catálogo, producción, nómina, inventario, mantenimiento, auditoría y vistas de reporte.
  Incluye el control de acceso por máquina asignada y las tarifas de destajo con alcance
  y vigencia. Borrador **no validado contra un servidor**; requiere `pgcrypto` y `citext`.
- `informe.html` — informe ejecutivo de la investigación, publicado como artefacto.
- `brief.html` — brief de diseño publicado, con el sistema de diseño en vivo y el prompt base.
- `tools/cui.py` — validación de CUI del DPI (13 dígitos, dígito verificador por complemento 11,
  tabla de municipios por departamento).
- `tools/dst_info.py` — lector de archivos DST sin dependencias: extrae puntadas declaradas,
  puntadas contadas, cambios de color, saltos, dimensiones y hash. Alimenta el catálogo de diseños.
- `tools/nomina.py` — calculadora de nómina a destajo con séptimo día (Art. 126), complemento
  al salario mínimo (Art. 91), IGSS y costo patronal.
- `tools/verificar_diseno.py` — verificación e inferencia de diseño por conteo de puntadas,
  con la demostración numérica de por qué la inferencia sobre acumulados no sirve.

## Uso rápido

```bash
# Validar un DPI
python3 tools/cui.py 1234567890101

# Leer la firma de un diseño para darlo de alta en el catálogo
python3 tools/dst_info.py HUIPIL-SOLOLA.dst

# Liquidar una quincena de 3,000,000 de puntadas
python3 tools/nomina.py 3000000 --tarifa 1500 --categoria CE2_no_agricola

# Ver la demostración de verificación vs. inferencia
python3 tools/verificar_diseno.py
```

Sin dependencias externas: Python 3 de la biblioteca estándar.

## Los tres números que hay que recordar

1. **393 puntadas por minuto sostenidas** es lo que un operario necesita para alcanzar el
   salario mínimo con la tarifa actual. Está al filo de lo que da una máquina de gama baja.
2. **Una sexta parte**, no una séptima, es el recargo de día de descanso para trabajo a
   destajo (Art. 126 del Código de Trabajo).
3. **390 candidatos** arroja intentar identificar un diseño por el acumulado de puntadas de
   un turno con un catálogo de 200 diseños. Por eso se verifica, no se adivina.

## Estado

Investigación terminada. **Falta el levantamiento en planta** (fase 0 de
[la hoja de ruta](docs/09-riesgos-roadmap-preguntas.md)) antes de escribir código de
producción: hay cuatro preguntas bloqueantes cuya respuesta cambia el diseño.
