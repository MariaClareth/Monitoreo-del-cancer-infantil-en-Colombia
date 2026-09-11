# Análisis estadístico espacio-temporal del cáncer infantil en Colombia, 2020–2024

[![Abrir en Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/MariaClareth/Monitoreo-del-cancer-infantil-en-Colombia/blob/main/notebooks/analisis_cancer_infantil.ipynb)

Modelos de conteo aplicados a los casos de cáncer infantil notificados al sistema de
vigilancia en Colombia entre 2020 y 2024.

**Grupo de investigación GEMMA** — Estadística y Modelamiento Matemático Aplicado a la
Calidad Educativa, Universidad de Sucre.
Nohelis Muslaco Bohorquez · Maria Mendez R. · Melba Vertel M.

Presentado en la 3.ª Feria de Innovación, Universidad de Córdoba (CONASIE 2026).

---

## Qué se encontró

| Resultado | Valor |
|---|---|
| Casos analizados | 5.383 en 250 registros (zona × año × edad × sexo) |
| Zona Andina frente a la Amazonía | **25,2 veces** más casos (p < 0,001) |
| Caribe / Pacífico / Orinoquía frente a la Amazonía | 6,7 × / 6,7 × / 2,1 × (todos p < 0,001) |
| Efecto del año | **no significativo** (p = 0,352) |
| R² de Nagelkerke (binomial negativa) | 0,970 |
| Desviación | de 1.054,10 (modelo nulo) a 272,59 |
| Regresión lineal comparativa | R² = 0,696, con intervalos de predicción negativos |

La conclusión corta: **la zona explica casi todo y el año no explica nada**. Entre 2020 y
2024 el patrón geográfico se mantuvo estable.

El modelo lineal ordinario se ajustó solo como comparación y falla de forma visible:
predice para la Amazonía en 2020 un intervalo de **−3,85 a 7,51 casos**. Un conteo
negativo no existe, y por eso el análisis usa un modelo para datos de conteo.

## Cómo reproducirlo

La forma más rápida es el botón de Colab de arriba: abre el cuaderno, ejecuta todo y
obtiene las mismas tablas y figuras sin instalar nada.

En local:

```bash
git clone https://github.com/MariaClareth/Monitoreo-del-cancer-infantil-en-Colombia.git
cd Monitoreo-del-cancer-infantil-en-Colombia
pip install -r requirements.txt
jupyter notebook notebooks/analisis_cancer_infantil.ipynb
```

## Estructura

```
datos/
  base_completa.csv    5.413 notificaciones individuales
  DataE.csv            250 registros agregados: zona × año × edad × sexo
  DICCIONARIO.md       significado de cada variable y procedencia
notebooks/
  analisis_cancer_infantil.ipynb    análisis completo en Python
scripts/
  analisis.R           el mismo análisis en R (código original)
figuras/               figuras en PNG a 300 ppp
resultados/            tablas y resumen en CSV y JSON
```

## Modelo

$$\log(\mu_i)=\beta_0+\beta_{\text{zona}(i)}+\beta_{\text{año}}\cdot \text{año}_i,
\qquad Y_i \sim \text{BN}(\mu_i,\theta),\quad \hat\theta = 3{,}474$$

La binomial negativa permite que la varianza crezca más rápido que la media, cosa que
el modelo de Poisson no admite y que estos conteos sí presentan.

## Nota sobre los datos

`base_completa.csv` contiene registros individuales de notificación de cáncer en menores
de 18 años. No incluye nombres ni documentos, pero sí edad, sexo, semana epidemiológica y
municipio. Antes de difundir el repositorio conviene verificar que la base provenga de un
conjunto de datos abiertos ya publicado. `DataE.csv`, que es lo que alimenta los modelos,
está agregado y no permite identificar a nadie.

## Licencia

Código bajo licencia MIT. Ver `LICENSE`.

## Cómo citar

> Muslaco Bohorquez, N., Mendez R., M. y Vertel M., M. (2026). *Análisis estadístico
> espacio-temporal para los datos de conteo del cáncer infantil en Colombia: 2020–2024*.
> Grupo GEMMA, Universidad de Sucre.
