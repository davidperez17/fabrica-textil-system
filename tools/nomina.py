#!/usr/bin/env python3
"""Calculadora de nomina a destajo por puntadas, Guatemala 2026.

Reglas aplicadas:
  Art. 88 b) Codigo de Trabajo  - salario por unidad de obra (destajo) es legal.
  Art. 91  Codigo de Trabajo    - el monto no puede ser inferior al salario minimo.
  Art. 126 Codigo de Trabajo    - a quien labora por unidad de obra se le adiciona
                                  una sexta parte de los salarios totales de la semana
                                  (septimo dia). Es 1/6, no 1/7.
  Art. 92  Codigo de Trabajo    - plazo maximo de pago quincenal para trabajo manual.
  AG 256-2025                   - salarios minimos vigentes del 01/01/2026 al 31/12/2026.
  Decreto 78-89                 - bonificacion incentivo Q250 mensuales, no forma parte
                                  del salario para prestaciones y no cotiza al IGSS.
  IGSS                          - cuota laboral 4.83%; patronal 12.67% (10.67 IGSS +
                                  1% INTECAP + 1% IRTRA).

Uso:
    python3 nomina.py 3000000 --dias 13 --categoria CE2_no_agricola
"""
import argparse
from dataclasses import dataclass, asdict

SALARIO_MINIMO_2026 = {
    "CE1_agricola": 3791.20,
    "CE1_no_agricola": 4002.28,
    "CE1_maquila": 3409.73,
    "CE2_agricola": 3625.89,
    "CE2_no_agricola": 3816.90,
    "CE2_maquila": 3221.10,
}

BONIFICACION_INCENTIVO_MES = 250.00
IGSS_LABORAL = 0.0483
IGSS_PATRONAL = 0.1267          # IGSS 10.67 + INTECAP 1 + IRTRA 1
PROV_AGUINALDO = 1 / 12
PROV_BONO14 = 1 / 12
PROV_VACACIONES = 15 / 360      # 15 dias habiles
PROV_INDEMNIZACION = 1 / 12


@dataclass
class Resultado:
    puntadas: int
    puntadas_por_quetzal: int
    destajo: float
    septimo_dia: float
    devengado_destajo: float
    salario_minimo_periodo: float
    complemento_minimo: float
    base_prestaciones: float
    bonificacion_incentivo: float
    bonificaciones_extra: float
    descuentos: float
    igss_laboral: float
    total_bruto: float
    total_neto: float
    costo_patronal_total: float
    alerta_minimo: bool


def calcular(puntadas, puntadas_por_quetzal=1500, categoria="CE2_no_agricola",
             periodos_por_mes=2, bonificaciones=0.0, descuentos=0.0) -> Resultado:
    sm_mes = SALARIO_MINIMO_2026[categoria]
    sm_periodo = sm_mes / periodos_por_mes

    destajo = puntadas / puntadas_por_quetzal
    septimo = destajo / 6                    # Art. 126: una sexta parte
    devengado = destajo + septimo

    complemento = max(0.0, sm_periodo - devengado)
    base = devengado + complemento           # base para IGSS y prestaciones
    bonif_inc = BONIFICACION_INCENTIVO_MES / periodos_por_mes

    igss = base * IGSS_LABORAL
    bruto = base + bonif_inc + bonificaciones
    neto = bruto - igss - descuentos

    provisiones = base * (PROV_AGUINALDO + PROV_BONO14 + PROV_VACACIONES + PROV_INDEMNIZACION)
    costo = base * (1 + IGSS_PATRONAL) + bonif_inc + bonificaciones + provisiones

    return Resultado(
        puntadas=puntadas,
        puntadas_por_quetzal=puntadas_por_quetzal,
        destajo=round(destajo, 2),
        septimo_dia=round(septimo, 2),
        devengado_destajo=round(devengado, 2),
        salario_minimo_periodo=round(sm_periodo, 2),
        complemento_minimo=round(complemento, 2),
        base_prestaciones=round(base, 2),
        bonificacion_incentivo=round(bonif_inc, 2),
        bonificaciones_extra=round(bonificaciones, 2),
        descuentos=round(descuentos, 2),
        igss_laboral=round(igss, 2),
        total_bruto=round(bruto, 2),
        total_neto=round(neto, 2),
        costo_patronal_total=round(costo, 2),
        alerta_minimo=complemento > 0,
    )


def umbral_puntadas(categoria="CE2_no_agricola", puntadas_por_quetzal=1500, periodos_por_mes=2):
    """Puntadas del periodo a partir de las cuales el destajo ya cubre el minimo."""
    sm_periodo = SALARIO_MINIMO_2026[categoria] / periodos_por_mes
    return sm_periodo * (6 / 7) * puntadas_por_quetzal


if __name__ == "__main__":
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("puntadas", type=int)
    p.add_argument("--tarifa", type=int, default=1500, help="puntadas por quetzal")
    p.add_argument("--categoria", default="CE2_no_agricola", choices=sorted(SALARIO_MINIMO_2026))
    p.add_argument("--periodos", type=int, default=2, help="periodos de pago por mes")
    p.add_argument("--bonificaciones", type=float, default=0.0)
    p.add_argument("--descuentos", type=float, default=0.0)
    a = p.parse_args()

    r = calcular(a.puntadas, a.tarifa, a.categoria, a.periodos, a.bonificaciones, a.descuentos)
    ancho = max(len(k) for k in asdict(r))
    for k, v in asdict(r).items():
        print(f"{k:<{ancho}} : {v}")
    print(f"\numbral sin complemento: {umbral_puntadas(a.categoria, a.tarifa, a.periodos):,.0f} puntadas")
