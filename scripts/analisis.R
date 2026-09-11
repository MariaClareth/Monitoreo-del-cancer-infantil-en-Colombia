# ============================================================================
# Análisis espacio-temporal del cáncer infantil en Colombia, 2020-2024
# Grupo GEMMA - Universidad de Sucre
#
# Este es el análisis original en R. El cuaderno de Colab reproduce
# exactamente estos mismos resultados en Python.
# ============================================================================

library(MASS)         # glm.nb
library(performance)  # model_performance
library(ggplot2)
library(dplyr)

DataE <- read.csv("datos/DataE.csv", stringsAsFactors = TRUE)
DataE$zona <- relevel(DataE$zona, ref = "AMAZ")

# ---- Modelo binomial negativa ----------------------------------------------
m_bn <- glm.nb(casos ~ zona + anno, data = DataE, link = log)
summary(m_bn)

fit1 <- m_bn
model_performance(fit1)

# Razones de tasas (IRR) e intervalos
exp(cbind(IRR = coef(m_bn), confint.default(m_bn)))

# ---- Comparación: regresión lineal ordinaria --------------------------------
m_ols <- lm(casos ~ factor(anno) + zona, data = DataE)
summary(m_ols)

nuevo <- expand.grid(anno = 2020, zona = levels(DataE$zona))
predict(m_ols, newdata = nuevo, interval = "confidence")
# La Amazonía y la Orinoquía reciben límites inferiores negativos:
# un conteo no puede ser negativo, de ahí la necesidad del modelo de conteo.

# ---- Figuras ----------------------------------------------------------------
ggplot(DataE, aes(x = factor(anno), y = casos)) +
  geom_boxplot(fill = "#7B68EE") + facet_grid(zona ~ .) + labs(x = "anno")

ggplot(DataE, aes(x = zona, y = casos)) +
  geom_boxplot(fill = "#7B68EE") + facet_grid(anno ~ .)

ggplot(DataE, aes(x = edad, y = casos)) +
  geom_boxplot(fill = "#7B68EE") + facet_grid(sexo ~ .)
