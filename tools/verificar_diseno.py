#!/usr/bin/env python3
"""Verificacion e inferencia del diseno ejecutado a partir del conteo de puntadas.

Problema: la maquina no reporta que prenda esta bordando; solo entrega un contador
de puntadas. Cada diseno del catalogo tiene una firma conocida (puntadas por
repeticion, cambios de color, tiempo de ciclo esperado).

Dos modos:

  verificar(delta, diseno, repeticiones)
      El operario declara el codigo de diseno en la PWA. El sistema compara las
      puntadas medidas contra las esperadas y devuelve un veredicto. Este es el
      modo confiable y el que debe gobernar la produccion.

  inferir(delta, catalogo)
      Sin declaracion del operario, busca candidatos. Solo es util sobre corridas
      individuales cerradas (una corrida = un diseno completo). Sobre acumulados
      de turno el espacio de soluciones explota y el resultado no sirve.

Uso:
    python3 verificar_diseno.py demo
"""
from dataclasses import dataclass


@dataclass
class Diseno:
    codigo: str
    nombre: str
    puntadas: int
    cambios_color: int = 0


# Tolerancias sugeridas. La maquina puede sumar puntadas por reposicion tras rotura
# de hilo, por lo que la desviacion esperada es positiva y pequena.
TOL_OK = 0.005        # <=0.5% -> coincide
TOL_REVISAR = 0.03    # <=3%   -> coincide con observacion; arriba de eso, discrepancia


def verificar(delta_puntadas: int, diseno: Diseno, repeticiones: int):
    esperado = diseno.puntadas * repeticiones
    if esperado == 0:
        return {"veredicto": "DATOS_INVALIDOS", "esperado": 0}
    desviacion = (delta_puntadas - esperado) / esperado
    if abs(desviacion) <= TOL_OK:
        v = "OK"
    elif abs(desviacion) <= TOL_REVISAR:
        v = "REVISAR"
    else:
        v = "DISCREPANCIA"
    return {
        "veredicto": v,
        "diseno": diseno.codigo,
        "esperado": esperado,
        "medido": delta_puntadas,
        "desviacion_pct": round(desviacion * 100, 3),
        "repeticiones_implicitas": round(delta_puntadas / diseno.puntadas, 3),
    }


def inferir(delta_puntadas: int, catalogo, rep_max=1, tol=TOL_OK):
    """Candidatos (diseno, repeticiones) compatibles con el conteo medido."""
    out = []
    for d in catalogo:
        for n in range(1, rep_max + 1):
            esperado = d.puntadas * n
            if esperado and abs(delta_puntadas - esperado) <= tol * delta_puntadas:
                out.append({
                    "codigo": d.codigo,
                    "nombre": d.nombre,
                    "repeticiones": n,
                    "esperado": esperado,
                    "desviacion_pct": round((delta_puntadas - esperado) / esperado * 100, 3),
                })
    out.sort(key=lambda r: abs(r["desviacion_pct"]))
    return out


def _demo():
    catalogo = [
        Diseno("HUI-001", "Huipil Solola cuello grande", 42500, 9),
        Diseno("HUI-002", "Huipil Quetzaltenango aves", 38900, 11),
        Diseno("FAJ-010", "Faja Totonicapan greca", 12400, 5),
        Diseno("TZU-004", "Tzute Chichicastenango", 21300, 7),
        Diseno("COR-021", "Randa para corte", 8600, 3),
    ]
    print("== VERIFICACION (el operario declaro HUI-001 x 12) ==")
    for medido in (510000, 512400, 528000, 425000):
        print(" ", verificar(medido, catalogo[0], 12))

    print("\n== INFERENCIA sobre una corrida cerrada (1 diseno) ==")
    print("  medido 42.500 ->", inferir(42500, catalogo, rep_max=1))
    print("  medido 12.410 ->", inferir(12410, catalogo, rep_max=1))

    print("\n== INFERENCIA sobre acumulado de turno (por que NO sirve) ==")
    cand = inferir(1_000_000, catalogo, rep_max=300, tol=0.02)
    print(f"  medido 1.000.000 con 5 disenos y n<=300 -> {len(cand)} candidatos")
    for c in cand[:5]:
        print("   ", c)


if __name__ == "__main__":
    _demo()
