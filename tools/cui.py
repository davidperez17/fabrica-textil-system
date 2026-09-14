#!/usr/bin/env python3
"""Validacion de CUI (DPI) de Guatemala.

Estructura de los 13 digitos:
  posiciones 1-8   correlativo asignado por RENAP
  posicion   9     digito verificador (complemento 11)
  posiciones 10-11 codigo de departamento (01-22)
  posiciones 12-13 codigo de municipio dentro del departamento

Uso:
    python3 cui.py 1234567890101
"""
import re
import sys

# Municipios por departamento, indexado 1..22 en el orden oficial del CUI.
MUNICIPIOS_POR_DEPTO = [
    17,  # 01 Guatemala
    8,   # 02 El Progreso
    16,  # 03 Sacatepequez
    16,  # 04 Chimaltenango
    13,  # 05 Escuintla
    14,  # 06 Santa Rosa
    19,  # 07 Solola
    8,   # 08 Totonicapan
    24,  # 09 Quetzaltenango
    21,  # 10 Suchitepequez
    9,   # 11 Retalhuleu
    30,  # 12 San Marcos
    32,  # 13 Huehuetenango
    21,  # 14 Quiche
    8,   # 15 Baja Verapaz
    17,  # 16 Alta Verapaz
    14,  # 17 Peten
    5,   # 18 Izabal
    11,  # 19 Zacapa
    11,  # 20 Chiquimula
    7,   # 21 Jalapa
    17,  # 22 Jutiapa
]

NOMBRE_DEPTO = [
    "Guatemala", "El Progreso", "Sacatepequez", "Chimaltenango", "Escuintla",
    "Santa Rosa", "Solola", "Totonicapan", "Quetzaltenango", "Suchitepequez",
    "Retalhuleu", "San Marcos", "Huehuetenango", "Quiche", "Baja Verapaz",
    "Alta Verapaz", "Peten", "Izabal", "Zacapa", "Chiquimula", "Jalapa", "Jutiapa",
]


def normalizar(cui: str) -> str:
    """Quita espacios y guiones. El DPI se imprime como 1234 56789 0101."""
    return re.sub(r"[\s-]", "", cui or "")


def validar(cui: str):
    """Devuelve (ok, detalle). detalle trae el motivo o los datos derivados."""
    c = normalizar(cui)
    if not re.fullmatch(r"\d{13}", c):
        return False, "Debe tener exactamente 13 digitos numericos"

    correlativo = c[:8]
    verificador = int(c[8])
    depto = int(c[9:11])
    muni = int(c[11:13])

    if depto < 1 or depto > len(MUNICIPIOS_POR_DEPTO):
        return False, f"Departamento invalido: {depto:02d}"
    if muni < 1 or muni > MUNICIPIOS_POR_DEPTO[depto - 1]:
        return False, f"Municipio invalido: {muni:02d} para {NOMBRE_DEPTO[depto - 1]}"

    total = sum(int(d) * (i + 2) for i, d in enumerate(correlativo))
    if total % 11 != verificador:
        return False, "Digito verificador incorrecto"

    return True, {
        "cui": c,
        "correlativo": correlativo,
        "departamento": depto,
        "departamento_nombre": NOMBRE_DEPTO[depto - 1],
        "municipio": muni,
        "formato_dpi": f"{c[:4]} {c[4:9]} {c[9:]}",
    }


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print(__doc__)
        raise SystemExit(2)
    for arg in sys.argv[1:]:
        ok, det = validar(arg)
        print(f"{arg}: {'VALIDO' if ok else 'INVALIDO'} -> {det}")
