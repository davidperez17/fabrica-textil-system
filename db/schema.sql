-- =============================================================================
-- Sistema de administracion para fabrica textil de trajes tipicos (Guatemala)
-- Motor objetivo: PostgreSQL 16+
-- Estado: borrador de investigacion. Falta validar contra el piso de planta.
-- =============================================================================

CREATE EXTENSION IF NOT EXISTS pgcrypto;
CREATE EXTENSION IF NOT EXISTS citext;

-- -----------------------------------------------------------------------------
-- 1. ORGANIZACION Y SEGURIDAD
-- -----------------------------------------------------------------------------

CREATE TABLE planta (
    id              smallserial PRIMARY KEY,
    nombre          text NOT NULL,
    departamento    smallint NOT NULL CHECK (departamento BETWEEN 1 AND 22),
    municipio       smallint NOT NULL,
    -- CE1 = departamento de Guatemala; CE2 = resto del pais (AG 256-2025)
    circunscripcion text NOT NULL CHECK (circunscripcion IN ('CE1','CE2')),
    categoria_salarial text NOT NULL
        CHECK (categoria_salarial IN ('agricola','no_agricola','maquila')),
    zona_horaria    text NOT NULL DEFAULT 'America/Guatemala'
);

CREATE TABLE usuario (
    id              uuid PRIMARY KEY DEFAULT gen_random_uuid(),
    usuario         citext UNIQUE,          -- requiere extension citext; si no, text + lower()
    hash_password   text NOT NULL,
    nombre          text NOT NULL,
    rol             text NOT NULL CHECK (rol IN
                        ('admin','gerencia','supervisor','rrhh','mantenimiento',
                         'bodega','operario','solo_lectura')),
    operario_id     bigint,                 -- FK diferida hacia operario
    activo          boolean NOT NULL DEFAULT true,
    creado_en       timestamptz NOT NULL DEFAULT now()
);

-- -----------------------------------------------------------------------------
-- 2. OPERARIOS
-- -----------------------------------------------------------------------------

CREATE TABLE operario (
    id                  bigserial PRIMARY KEY,
    codigo              text NOT NULL UNIQUE,   -- codigo interno / gafete / QR
    -- CUI de 13 digitos del DPI. Validacion de digito verificador en la aplicacion
    -- (ver tools/cui.py); aqui solo se fuerza el formato.
    dpi_cui             char(13) NOT NULL UNIQUE CHECK (dpi_cui ~ '^\d{13}$'),
    primer_nombre       text NOT NULL,
    segundo_nombre      text,
    primer_apellido     text NOT NULL,
    segundo_apellido    text,
    apellido_casada     text,
    fecha_nacimiento    date,
    genero              text CHECK (genero IN ('F','M','X','ND')),
    idioma_preferido    text NOT NULL DEFAULT 'es',  -- es, quc (k'iche'), cak (kaqchikel), mam...
    telefono            text CHECK (telefono ~ '^[0-9+ -]{8,20}$'),
    direccion           text,
    departamento        smallint CHECK (departamento BETWEEN 1 AND 22),
    municipio           smallint,
    nit                 text,
    numero_igss         text,
    cuenta_bancaria     text,
    banco               text,
    planta_id           smallint NOT NULL REFERENCES planta(id),
    fecha_ingreso       date NOT NULL,
    fecha_baja          date,
    modalidad_pago      text NOT NULL DEFAULT 'destajo'
                        CHECK (modalidad_pago IN ('destajo','tiempo','mixto')),
    activo              boolean NOT NULL DEFAULT true,
    creado_en           timestamptz NOT NULL DEFAULT now(),
    actualizado_en      timestamptz NOT NULL DEFAULT now()
);

ALTER TABLE usuario
    ADD CONSTRAINT usuario_operario_fk FOREIGN KEY (operario_id) REFERENCES operario(id);

CREATE INDEX idx_operario_activo ON operario(activo) WHERE activo;

-- -----------------------------------------------------------------------------
-- 3. MAQUINAS
-- -----------------------------------------------------------------------------

CREATE TABLE maquina (
    id                  bigserial PRIMARY KEY,
    codigo              text NOT NULL UNIQUE,     -- rotulo fisico, tambien impreso en QR
    planta_id           smallint NOT NULL REFERENCES planta(id),
    marca               text,
    modelo              text,
    controlador         text,                     -- p.ej. Dahao BECS-A15, Tajima, Barudan
    numero_serie        text,
    cabezas             smallint NOT NULL DEFAULT 1 CHECK (cabezas > 0),
    agujas_por_cabeza   smallint NOT NULL DEFAULT 9,
    spm_nominal         integer NOT NULL DEFAULT 750,   -- puntadas por minuto de placa
    spm_max_practico    integer,
    fecha_instalacion   date,
    -- Como se captura el contador de esta maquina en particular.
    metodo_captura      text NOT NULL DEFAULT 'manual'
                        CHECK (metodo_captura IN ('manual','sensor','panel_red','archivo')),
    -- Contador acumulado historico de la maquina (nunca se reinicia en el sistema,
    -- aunque el panel fisico si se pueda reiniciar).
    puntadas_acumuladas bigint NOT NULL DEFAULT 0,
    horas_operacion     numeric(12,2) NOT NULL DEFAULT 0,
    estado              text NOT NULL DEFAULT 'operativa'
                        CHECK (estado IN ('operativa','en_mantenimiento','fuera_de_servicio','baja')),
    creado_en           timestamptz NOT NULL DEFAULT now()
);

-- Dispositivo de captura (retrofit) asociado a la maquina.
CREATE TABLE dispositivo (
    id                  bigserial PRIMARY KEY,
    maquina_id          bigint NOT NULL REFERENCES maquina(id),
    identificador       text NOT NULL UNIQUE,     -- MAC o serie del modulo
    tipo                text NOT NULL,            -- esp32_inductivo, esp32_optico, gateway
    firmware            text,
    -- pulsos del sensor por puntada real; normalmente 1 (una vuelta de eje = 1 puntada)
    pulsos_por_puntada  numeric(6,3) NOT NULL DEFAULT 1,
    ultimo_contacto     timestamptz,
    bateria_pct         smallint,
    activo              boolean NOT NULL DEFAULT true
);

-- -----------------------------------------------------------------------------
-- 4. CATALOGO: DISENOS, PRODUCTOS, TEMPORADAS
-- -----------------------------------------------------------------------------

-- Un diseno es un archivo de bordado. Su conteo de puntadas es la firma que
-- permite verificar que se bordo lo que se dijo que se iba a bordar.
CREATE TABLE diseno (
    id                  bigserial PRIMARY KEY,
    codigo              text NOT NULL UNIQUE,     -- codigo de diseno impreso en QR
    nombre              text NOT NULL,
    version             smallint NOT NULL DEFAULT 1,
    archivo_nombre      text,
    archivo_hash        char(64),                 -- sha256 del DST/DSB/EMB
    formato             text DEFAULT 'DST',
    puntadas            integer NOT NULL CHECK (puntadas > 0),   -- firma principal
    cambios_color       smallint DEFAULT 0,                       -- firma secundaria
    saltos              integer DEFAULT 0,
    ancho_mm            numeric(7,1),
    alto_mm             numeric(7,1),
    -- tiempo teorico de una repeticion a 750 spm; solo referencia para detectar anomalias
    segundos_teoricos   integer GENERATED ALWAYS AS (puntadas / 750 * 60) STORED,
    region_cultural     text,      -- Solola, Totonicapan, Chichicastenango, Nebaj...
    activo              boolean NOT NULL DEFAULT true,
    creado_en           timestamptz NOT NULL DEFAULT now(),
    UNIQUE (codigo, version)
);

-- Indice clave para la verificacion/inferencia por conteo de puntadas.
CREATE INDEX idx_diseno_puntadas ON diseno(puntadas) WHERE activo;

CREATE TABLE temporada (
    id              serial PRIMARY KEY,
    nombre          text NOT NULL,
    tipo            text NOT NULL CHECK (tipo IN
                       ('feria_patronal','semana_santa','independencia','navidad',
                        'graduaciones','dia_madre','exportacion','regular')),
    fecha_inicio    date NOT NULL,
    fecha_fin       date NOT NULL,
    municipio       smallint,        -- para ferias patronales de una localidad
    departamento    smallint,
    notas           text,
    CHECK (fecha_fin >= fecha_inicio)
);

CREATE TABLE producto (
    id              bigserial PRIMARY KEY,
    sku             text NOT NULL UNIQUE,
    nombre          text NOT NULL,
    tipo_prenda     text NOT NULL CHECK (tipo_prenda IN
                       ('huipil','sobrehuipil','corte','faja','tzute','perraje',
                        'tocoyal','blusa','camisa','pantalon','delantal','otro')),
    region_cultural text,
    talla           text,
    color_base      text,
    precio_venta    numeric(12,2),
    costo_estimado  numeric(12,2),
    activo          boolean NOT NULL DEFAULT true
);

-- Un producto puede requerir varios disenos (cuello, mangas, pecho).
CREATE TABLE producto_diseno (
    producto_id     bigint NOT NULL REFERENCES producto(id) ON DELETE CASCADE,
    diseno_id       bigint NOT NULL REFERENCES diseno(id),
    piezas_por_prenda smallint NOT NULL DEFAULT 1,
    PRIMARY KEY (producto_id, diseno_id)
);

CREATE TABLE producto_temporada (
    producto_id     bigint NOT NULL REFERENCES producto(id) ON DELETE CASCADE,
    temporada_id    integer NOT NULL REFERENCES temporada(id) ON DELETE CASCADE,
    demanda_estimada integer,
    PRIMARY KEY (producto_id, temporada_id)
);

-- -----------------------------------------------------------------------------
-- 5. PRODUCCION
-- -----------------------------------------------------------------------------

CREATE TABLE orden_produccion (
    id              bigserial PRIMARY KEY,
    codigo          text NOT NULL UNIQUE,
    producto_id     bigint NOT NULL REFERENCES producto(id),
    temporada_id    integer REFERENCES temporada(id),
    cantidad_objetivo integer NOT NULL CHECK (cantidad_objetivo > 0),
    cantidad_producida integer NOT NULL DEFAULT 0,
    fecha_apertura  date NOT NULL DEFAULT current_date,
    fecha_compromiso date,
    estado          text NOT NULL DEFAULT 'abierta'
                    CHECK (estado IN ('borrador','abierta','en_proceso','pausada','cerrada','cancelada')),
    creado_en       timestamptz NOT NULL DEFAULT now()
);

CREATE TABLE turno (
    id              serial PRIMARY KEY,
    nombre          text NOT NULL,
    hora_inicio     time NOT NULL,
    hora_fin        time NOT NULL,
    -- Art. 116 CT: jornada diurna 8 h diarias, 44 h semanales efectivas pagadas como 48.
    horas_nominales numeric(4,2) NOT NULL DEFAULT 8
);

-- Asignacion operario <-> maquina <-> turno. Sin esto no se puede atribuir
-- produccion a una persona.
-- La asignacion no es solo informativa: ES el control de acceso. Un operario
-- solo puede abrir corridas en las maquinas que tenga asignadas y vigentes.
-- La PWA unicamente lista esas maquinas y la API rechaza cualquier otra.
CREATE TABLE asignacion (
    id              bigserial PRIMARY KEY,
    operario_id     bigint NOT NULL REFERENCES operario(id),
    maquina_id      bigint NOT NULL REFERENCES maquina(id),
    turno_id        integer REFERENCES turno(id),
    tipo            text NOT NULL DEFAULT 'permanente'
                    CHECK (tipo IN ('permanente','turno','temporal','cobertura')),
    inicio          timestamptz NOT NULL,
    fin             timestamptz,
    asignado_por    uuid REFERENCES usuario(id),
    motivo          text,
    creado_en       timestamptz NOT NULL DEFAULT now(),
    CHECK (fin IS NULL OR fin > inicio)
);

-- Una maquina no puede tener dos asignaciones vigentes solapadas en el mismo turno.
-- Requiere btree_gist. Si se prefiere no usar la extension, validar en la aplicacion.
-- CREATE EXTENSION IF NOT EXISTS btree_gist;
-- ALTER TABLE asignacion ADD CONSTRAINT asignacion_sin_solape
--     EXCLUDE USING gist (maquina_id WITH =, tstzrange(inicio, fin) WITH &&);

CREATE INDEX idx_asignacion_maquina_periodo ON asignacion(maquina_id, inicio DESC);
CREATE INDEX idx_asignacion_operario_periodo ON asignacion(operario_id, inicio DESC);
-- Consulta caliente: que maquinas puede operar esta persona ahora mismo.
CREATE INDEX idx_asignacion_vigente ON asignacion(operario_id, maquina_id)
    WHERE fin IS NULL;

-- CORRIDA: la unidad de produccion. Una corrida = una sesion continua de bordado
-- de un diseno declarado en una maquina por un operario. Sobre la corrida (y NO
-- sobre el acumulado del turno) es donde el conteo de puntadas permite verificar
-- el diseno.
CREATE TABLE corrida (
    id                  bigserial PRIMARY KEY,
    maquina_id          bigint NOT NULL REFERENCES maquina(id),
    operario_id         bigint REFERENCES operario(id),
    orden_id            bigint REFERENCES orden_produccion(id),
    diseno_declarado_id bigint REFERENCES diseno(id),   -- escaneado por el operario
    diseno_inferido_id  bigint REFERENCES diseno(id),   -- deducido por puntadas
    inicio              timestamptz NOT NULL,
    fin                 timestamptz,
    contador_inicio     bigint NOT NULL,
    contador_fin        bigint,
    puntadas            bigint GENERATED ALWAYS AS (contador_fin - contador_inicio) STORED,
    repeticiones_declaradas integer,
    -- prendas terminadas = repeticiones * cabezas de la maquina
    prendas             integer,
    verificacion        text NOT NULL DEFAULT 'pendiente'
                        CHECK (verificacion IN ('pendiente','ok','revisar','discrepancia','sin_declarar')),
    desviacion_pct      numeric(8,3),
    fuente              text NOT NULL DEFAULT 'manual'
                        CHECK (fuente IN ('manual','sensor','panel_red','archivo')),
    notas               text,
    creado_en           timestamptz NOT NULL DEFAULT now(),
    CHECK (contador_fin IS NULL OR contador_fin >= contador_inicio)
);

CREATE INDEX idx_corrida_maquina_fecha ON corrida(maquina_id, inicio DESC);
CREATE INDEX idx_corrida_operario_fecha ON corrida(operario_id, inicio DESC);
CREATE INDEX idx_corrida_verificacion ON corrida(verificacion)
    WHERE verificacion IN ('revisar','discrepancia','sin_declarar');

-- Serie temporal cruda del contador. Es el libro mayor de puntadas: todo reporte
-- y toda nomina se derivan de aqui.
CREATE TABLE lectura_contador (
    id                  bigserial PRIMARY KEY,
    maquina_id          bigint NOT NULL REFERENCES maquina(id),
    corrida_id          bigint REFERENCES corrida(id),
    ts                  timestamptz NOT NULL,
    contador_acumulado  bigint NOT NULL,
    delta               integer NOT NULL DEFAULT 0,
    spm                 integer,
    corriendo           boolean NOT NULL DEFAULT true,
    fuente              text NOT NULL DEFAULT 'sensor',
    -- clave de idempotencia enviada por el dispositivo/PWA para reintentos offline
    idempotency_key     text UNIQUE
);

CREATE INDEX idx_lectura_maquina_ts ON lectura_contador(maquina_id, ts DESC);

CREATE TABLE evento_maquina (
    id              bigserial PRIMARY KEY,
    maquina_id      bigint NOT NULL REFERENCES maquina(id),
    corrida_id      bigint REFERENCES corrida(id),
    ts              timestamptz NOT NULL,
    tipo            text NOT NULL CHECK (tipo IN
                       ('arranque','paro','rotura_hilo','cambio_color','fin_diseno',
                        'cambio_bastidor','falla','sin_material','fin_turno')),
    duracion_seg    integer,
    detalle         text
);

CREATE INDEX idx_evento_maquina_ts ON evento_maquina(maquina_id, ts DESC);

-- -----------------------------------------------------------------------------
-- 6. NOMINA A DESTAJO
-- -----------------------------------------------------------------------------

-- La tarifa se versiona: nunca se edita en sitio. Recalcular una quincena vieja
-- debe dar el mismo resultado que el dia que se pago.
-- La tarifa la define el dueno desde la interfaz, nunca se edita en codigo y
-- nunca se sobrescribe: se cierra la vigente y se abre una nueva. Recalcular una
-- quincena de hace seis meses debe devolver exactamente lo que se pago ese dia.
CREATE TABLE tarifa_destajo (
    id                  serial PRIMARY KEY,
    nombre              text NOT NULL,
    puntadas_por_quetzal integer NOT NULL DEFAULT 1500 CHECK (puntadas_por_quetzal > 0),
    -- Alcance de la tarifa. Precedencia al liquidar, de mayor a menor:
    -- operario > maquina > diseno > producto > global. La primera que coincida gana.
    alcance             text NOT NULL DEFAULT 'global'
                        CHECK (alcance IN ('global','operario','maquina','diseno','producto')),
    operario_id         bigint REFERENCES operario(id),
    maquina_id          bigint REFERENCES maquina(id),
    diseno_id           bigint REFERENCES diseno(id),
    producto_id         bigint REFERENCES producto(id),
    vigente_desde       date NOT NULL,
    vigente_hasta       date,
    autorizado_por      uuid REFERENCES usuario(id),
    notas               text,
    creado_en           timestamptz NOT NULL DEFAULT now(),
    CHECK (vigente_hasta IS NULL OR vigente_hasta >= vigente_desde),
    -- el alcance obliga a llenar exactamente su referencia
    CHECK (
        (alcance = 'global'   AND operario_id IS NULL AND maquina_id IS NULL
                              AND diseno_id IS NULL AND producto_id IS NULL) OR
        (alcance = 'operario' AND operario_id IS NOT NULL) OR
        (alcance = 'maquina'  AND maquina_id  IS NOT NULL) OR
        (alcance = 'diseno'   AND diseno_id   IS NOT NULL) OR
        (alcance = 'producto' AND producto_id IS NOT NULL)
    )
);

-- Solo puede haber una tarifa global abierta a la vez.
CREATE UNIQUE INDEX idx_tarifa_global_abierta ON tarifa_destajo((1))
    WHERE alcance = 'global' AND vigente_hasta IS NULL;

CREATE TABLE parametro_legal (
    clave           text PRIMARY KEY,
    valor           numeric(14,4) NOT NULL,
    vigente_desde   date NOT NULL,
    fuente          text
);

CREATE TABLE periodo_nomina (
    id              bigserial PRIMARY KEY,
    planta_id       smallint NOT NULL REFERENCES planta(id),
    fecha_inicio    date NOT NULL,
    fecha_fin       date NOT NULL,
    tipo            text NOT NULL DEFAULT 'quincenal'
                    CHECK (tipo IN ('semanal','quincenal','mensual')),
    estado          text NOT NULL DEFAULT 'abierto'
                    CHECK (estado IN ('abierto','calculado','aprobado','pagado','cerrado')),
    calculado_en    timestamptz,
    aprobado_por    uuid REFERENCES usuario(id),
    UNIQUE (planta_id, fecha_inicio, fecha_fin, tipo)
);

CREATE TABLE nomina_detalle (
    id                      bigserial PRIMARY KEY,
    periodo_id              bigint NOT NULL REFERENCES periodo_nomina(id) ON DELETE CASCADE,
    operario_id             bigint NOT NULL REFERENCES operario(id),
    tarifa_id               integer NOT NULL REFERENCES tarifa_destajo(id),
    puntadas                bigint NOT NULL DEFAULT 0,
    dias_laborados          smallint NOT NULL DEFAULT 0,
    destajo                 numeric(12,2) NOT NULL DEFAULT 0,
    -- Art. 126 CT: a quien labora por unidad de obra se le adiciona una SEXTA parte
    -- de los salarios totales devengados en la semana (dia de descanso semanal).
    septimo_dia             numeric(12,2) NOT NULL DEFAULT 0,
    -- Art. 91 CT: si el destajo no alcanza el minimo, el patrono completa.
    complemento_minimo      numeric(12,2) NOT NULL DEFAULT 0,
    horas_extra             numeric(8,2) NOT NULL DEFAULT 0,
    monto_horas_extra       numeric(12,2) NOT NULL DEFAULT 0,  -- Art. 121: +50%
    bonificacion_incentivo  numeric(12,2) NOT NULL DEFAULT 0,  -- Dto. 78-89
    bonificaciones_extra    numeric(12,2) NOT NULL DEFAULT 0,
    descuentos              numeric(12,2) NOT NULL DEFAULT 0,
    igss_laboral            numeric(12,2) NOT NULL DEFAULT 0,  -- 4.83%
    isr                     numeric(12,2) NOT NULL DEFAULT 0,
    total_bruto             numeric(12,2) NOT NULL DEFAULT 0,
    total_neto              numeric(12,2) NOT NULL DEFAULT 0,
    costo_patronal          numeric(12,2) NOT NULL DEFAULT 0,
    alerta_minimo           boolean NOT NULL DEFAULT false,
    UNIQUE (periodo_id, operario_id)
);

CREATE TABLE concepto (
    id          serial PRIMARY KEY,
    codigo      text NOT NULL UNIQUE,
    nombre      text NOT NULL,
    clase       text NOT NULL CHECK (clase IN ('bonificacion','descuento')),
    -- descuentos con tope legal: anticipos, prestamos, perdida de material
    tope_pct_salario numeric(5,2),
    requiere_autorizacion boolean NOT NULL DEFAULT true,
    activo      boolean NOT NULL DEFAULT true
);

CREATE TABLE movimiento_nomina (
    id              bigserial PRIMARY KEY,
    operario_id     bigint NOT NULL REFERENCES operario(id),
    concepto_id     integer NOT NULL REFERENCES concepto(id),
    periodo_id      bigint REFERENCES periodo_nomina(id),
    monto           numeric(12,2) NOT NULL CHECK (monto >= 0),
    motivo          text,
    autorizado_por  uuid REFERENCES usuario(id),
    creado_en       timestamptz NOT NULL DEFAULT now()
);

-- -----------------------------------------------------------------------------
-- 7. INVENTARIO
-- -----------------------------------------------------------------------------

CREATE TABLE bodega (
    id          serial PRIMARY KEY,
    planta_id   smallint NOT NULL REFERENCES planta(id),
    nombre      text NOT NULL,
    tipo        text NOT NULL CHECK (tipo IN ('materia_prima','producto_terminado','repuestos'))
);

CREATE TABLE articulo (
    id              bigserial PRIMARY KEY,
    sku             text NOT NULL UNIQUE,
    nombre          text NOT NULL,
    clase           text NOT NULL CHECK (clase IN
                       ('hilo','tela','aguja','entretela','avio','repuesto','producto_terminado')),
    producto_id     bigint REFERENCES producto(id),  -- solo para producto_terminado
    unidad          text NOT NULL DEFAULT 'unidad',
    stock_minimo    numeric(12,3) NOT NULL DEFAULT 0,
    -- consumo estimado por cada mil puntadas; permite proyectar hilo por orden
    consumo_por_mil_puntadas numeric(10,4),
    costo_promedio  numeric(12,4) NOT NULL DEFAULT 0,
    activo          boolean NOT NULL DEFAULT true
);

CREATE TABLE existencia (
    bodega_id   integer NOT NULL REFERENCES bodega(id),
    articulo_id bigint NOT NULL REFERENCES articulo(id),
    cantidad    numeric(14,3) NOT NULL DEFAULT 0,
    PRIMARY KEY (bodega_id, articulo_id)
);

CREATE TABLE movimiento_inventario (
    id              bigserial PRIMARY KEY,
    bodega_id       integer NOT NULL REFERENCES bodega(id),
    articulo_id     bigint NOT NULL REFERENCES articulo(id),
    tipo            text NOT NULL CHECK (tipo IN
                       ('entrada','salida','ajuste','traslado','consumo_produccion','merma')),
    cantidad        numeric(14,3) NOT NULL,
    costo_unitario  numeric(12,4),
    corrida_id      bigint REFERENCES corrida(id),
    orden_id        bigint REFERENCES orden_produccion(id),
    referencia      text,
    usuario_id      uuid REFERENCES usuario(id),
    ts              timestamptz NOT NULL DEFAULT now()
);

CREATE INDEX idx_mov_inv_articulo_ts ON movimiento_inventario(articulo_id, ts DESC);

-- -----------------------------------------------------------------------------
-- 8. MANTENIMIENTO PREVENTIVO POR PUNTADAS
-- -----------------------------------------------------------------------------

CREATE TABLE tarea_mantenimiento (
    id                  serial PRIMARY KEY,
    codigo              text NOT NULL UNIQUE,
    nombre              text NOT NULL,
    descripcion         text,
    -- El disparador puede ser por puntadas, por horas o por calendario.
    intervalo_puntadas  bigint,
    intervalo_horas     integer,
    intervalo_dias      integer,
    -- aviso anticipado, en porcentaje del intervalo
    aviso_pct           smallint NOT NULL DEFAULT 90,
    duracion_estimada_min integer,
    requiere_paro       boolean NOT NULL DEFAULT true,
    CHECK (intervalo_puntadas IS NOT NULL
        OR intervalo_horas IS NOT NULL
        OR intervalo_dias IS NOT NULL)
);

CREATE TABLE plan_mantenimiento (
    maquina_id      bigint NOT NULL REFERENCES maquina(id),
    tarea_id        integer NOT NULL REFERENCES tarea_mantenimiento(id),
    -- contadores al momento de la ultima ejecucion
    puntadas_ultima bigint NOT NULL DEFAULT 0,
    horas_ultima    numeric(12,2) NOT NULL DEFAULT 0,
    fecha_ultima    date,
    activo          boolean NOT NULL DEFAULT true,
    PRIMARY KEY (maquina_id, tarea_id)
);

CREATE TABLE orden_mantenimiento (
    id              bigserial PRIMARY KEY,
    maquina_id      bigint NOT NULL REFERENCES maquina(id),
    tarea_id        integer REFERENCES tarea_mantenimiento(id),
    tipo            text NOT NULL CHECK (tipo IN ('preventivo','correctivo','inspeccion')),
    estado          text NOT NULL DEFAULT 'programada'
                    CHECK (estado IN ('programada','en_proceso','completada','cancelada')),
    disparador      text,       -- 'puntadas','horas','dias','falla'
    puntadas_al_generar bigint,
    programada_para date,
    iniciada_en     timestamptz,
    completada_en   timestamptz,
    ejecutada_por   uuid REFERENCES usuario(id),
    costo_repuestos numeric(12,2) DEFAULT 0,
    observaciones   text
);

CREATE INDEX idx_orden_mtto_pendientes ON orden_mantenimiento(maquina_id, estado)
    WHERE estado IN ('programada','en_proceso');

-- -----------------------------------------------------------------------------
-- 9. AUDITORIA
-- -----------------------------------------------------------------------------

CREATE TABLE auditoria (
    id          bigserial PRIMARY KEY,
    usuario_id  uuid REFERENCES usuario(id),
    tabla       text NOT NULL,
    registro_id text NOT NULL,
    accion      text NOT NULL CHECK (accion IN ('insert','update','delete')),
    antes       jsonb,
    despues     jsonb,
    ts          timestamptz NOT NULL DEFAULT now(),
    ip          inet
);

CREATE INDEX idx_auditoria_tabla_ts ON auditoria(tabla, ts DESC);

-- -----------------------------------------------------------------------------
-- 10. VISTAS DE REPORTE
-- -----------------------------------------------------------------------------

-- Produccion por maquina y dia. Base de "total de produccion por maquina".
CREATE VIEW v_produccion_maquina_dia AS
SELECT
    c.maquina_id,
    m.codigo                                        AS maquina,
    (c.inicio AT TIME ZONE 'America/Guatemala')::date AS fecha,
    count(*)                                        AS corridas,
    sum(c.puntadas)                                 AS puntadas,
    sum(c.prendas)                                  AS prendas,
    sum(EXTRACT(EPOCH FROM (c.fin - c.inicio)))/3600 AS horas
FROM corrida c
JOIN maquina m ON m.id = c.maquina_id
WHERE c.fin IS NOT NULL
GROUP BY 1, 2, 3;

-- Produccion por operario y dia. Base del calculo de ganancia.
CREATE VIEW v_produccion_operario_dia AS
SELECT
    c.operario_id,
    (c.inicio AT TIME ZONE 'America/Guatemala')::date AS fecha,
    sum(c.puntadas)                                 AS puntadas,
    sum(c.prendas)                                  AS prendas,
    count(*) FILTER (WHERE c.verificacion = 'discrepancia') AS corridas_con_discrepancia
FROM corrida c
WHERE c.fin IS NOT NULL AND c.operario_id IS NOT NULL
GROUP BY 1, 2;

-- Semaforo de mantenimiento preventivo por puntadas.
CREATE VIEW v_mantenimiento_pendiente AS
SELECT
    p.maquina_id,
    m.codigo                                AS maquina,
    t.codigo                                AS tarea,
    t.nombre,
    t.intervalo_puntadas,
    m.puntadas_acumuladas - p.puntadas_ultima AS puntadas_desde_ultima,
    CASE WHEN t.intervalo_puntadas IS NULL THEN NULL
         ELSE round(100.0 * (m.puntadas_acumuladas - p.puntadas_ultima)
                    / t.intervalo_puntadas, 1)
    END                                     AS avance_pct
FROM plan_mantenimiento p
JOIN maquina m ON m.id = p.maquina_id
JOIN tarea_mantenimiento t ON t.id = p.tarea_id
WHERE p.activo AND m.estado <> 'baja';
