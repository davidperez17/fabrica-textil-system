#!/usr/bin/env python3
"""Lector de archivos DST (Tajima) sin dependencias externas.

Extrae la firma de un diseno para el catalogo:
  - puntadas declaradas en el encabezado (campo ST)
  - puntadas reales contadas en los registros
  - cambios de color / de aguja (campo CO y comandos reales)
  - saltos (jumps), dimensiones y hash del archivo

El encabezado son 512 bytes ASCII. Despues vienen registros de 3 bytes.
El byte 3 codifica el comando:
    0x03 puntada normal
    0x83 salto (jump)
    0xC3 cambio de color / de aguja
    0xF3 fin de diseno

Uso:
    python3 dst_info.py archivo.dst [otro.dst ...]
"""
import hashlib
import json
import sys

CMD_NORMAL = 0x03
CMD_JUMP = 0x83
CMD_COLOR = 0xC3
CMD_END = 0xF3


def _decodifica_delta(b0: int, b1: int, b2: int):
    """Decodifica el desplazamiento x,y de un registro DST (codificacion ternaria)."""
    x = y = 0
    if b0 & 0x01: x += 1
    if b0 & 0x02: x -= 1
    if b0 & 0x04: x += 9
    if b0 & 0x08: x -= 9
    if b1 & 0x01: x += 3
    if b1 & 0x02: x -= 3
    if b1 & 0x04: x += 27
    if b1 & 0x08: x -= 27
    if b2 & 0x04: x += 81
    if b2 & 0x08: x -= 81
    if b0 & 0x80: y += 1
    if b0 & 0x40: y -= 1
    if b0 & 0x20: y += 9
    if b0 & 0x10: y -= 9
    if b1 & 0x80: y += 3
    if b1 & 0x40: y -= 3
    if b1 & 0x20: y += 27
    if b1 & 0x10: y -= 27
    if b2 & 0x20: y += 81
    if b2 & 0x10: y -= 81
    return x, y


def leer_dst(ruta: str) -> dict:
    with open(ruta, "rb") as f:
        datos = f.read()

    encabezado = datos[:512].decode("latin-1", errors="replace")
    campos = {}
    for linea in encabezado.replace("\r", "\n").split("\n"):
        if ":" in linea:
            k, _, v = linea.partition(":")
            campos[k.strip()] = v.strip().rstrip("\x1a").strip()

    puntadas = jumps = colores = 0
    x = y = 0
    minx = miny = 10**9
    maxx = maxy = -10**9

    i = 512
    while i + 2 < len(datos):
        b0, b1, b2 = datos[i], datos[i + 1], datos[i + 2]
        i += 3
        if b2 == CMD_END or (b0 == 0 and b1 == 0 and b2 == CMD_END):
            break
        dx, dy = _decodifica_delta(b0, b1, b2)
        x += dx
        y += dy
        minx, maxx = min(minx, x), max(maxx, x)
        miny, maxy = min(miny, y), max(maxy, y)
        if b2 == CMD_COLOR:
            colores += 1
        elif b2 == CMD_JUMP:
            jumps += 1
            puntadas += 1  # el contador de la maquina si avanza en los saltos
        else:
            puntadas += 1

    def _int(campo):
        try:
            return int(campos.get(campo, "").lstrip("+"))
        except ValueError:
            return None

    return {
        "archivo": ruta,
        "nombre_encabezado": campos.get("LA"),
        "puntadas_encabezado": _int("ST"),
        "puntadas_contadas": puntadas,
        "saltos": jumps,
        "cambios_color_contados": colores,
        "cambios_color_encabezado": _int("CO"),
        # +X/-X/+Y/-Y vienen en decimas de milimetro
        "ancho_mm": round((maxx - minx) / 10.0, 1) if maxx > -10**9 else None,
        "alto_mm": round((maxy - miny) / 10.0, 1) if maxy > -10**9 else None,
        "sha256": hashlib.sha256(datos).hexdigest(),
        "bytes": len(datos),
    }


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(__doc__)
        raise SystemExit(2)
    for ruta in sys.argv[1:]:
        print(json.dumps(leer_dst(ruta), indent=2, ensure_ascii=False))
