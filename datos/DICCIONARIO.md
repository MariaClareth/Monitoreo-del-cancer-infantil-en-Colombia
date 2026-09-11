# Diccionario de datos

## `DataE.csv` — 250 registros

Es la tabla que alimenta los modelos. Resulta de contar las notificaciones por cada
combinación de zona, año, grupo de edad y sexo.

| Variable | Tipo | Valores | Descripción |
|---|---|---|---|
| `zona` | texto | AMAZ, AND, CAR, ORIN, PACF | Región natural de residencia |
| `anno` | entero | 2020–2024 | Año de notificación |
| `edad` | texto | e<1, e1-5, e5-9, e9-14, e14-18 | Grupo etario del protocolo de vigilancia |
| `sexo` | texto | F, M | Sexo |
| `casos` | entero | 0–129 | Número de casos notificados en esa combinación |

5 zonas × 5 años × 5 grupos de edad × 2 sexos = 250 filas. Las combinaciones sin casos
figuran con `casos = 0`, no se omiten: un cero es información, no un dato faltante.

Se excluye la zona insular (San Andrés y Providencia, 27 notificaciones), porque con esos
conteos la estimación por zona no es estable. Total: 5.383 casos.

## `base_completa.csv` — 5.413 registros

Una fila por notificación individual.

| Variable | Descripción |
|---|---|
| `CONSECUTIVE` | Identificador del registro en el sistema de vigilancia |
| `SEMANA` | Semana epidemiológica (1–53) |
| `ANO` | Año de notificación |
| `EDAD` + `UNI_MED` | Edad y su unidad: Año, Meses o Dias |
| `edad_anios` | Edad convertida a años (columna añadida en este repositorio) |
| `GRUP_ETARIOS` | Grupo de edad |
| `SEXO` | F o M |
| `TIP_SS` | Régimen de afiliación: S subsidiado, C contributivo, P excepción, N no afiliado, I indeterminado, E especial |
| `TIP_CAS` | Tipo de caso según el protocolo de vigilancia |
| `Nombre_evento` | Evento notificado (cáncer infantil en toda la base) |
| `Departamento_ocurrencia`, `Municipio_ocurrencia` | Lugar donde ocurre el caso |
| `Departamento_residencia`, `Municipio_residencia` | Lugar de residencia |
| `ZONA` | Región natural: AMAZ, AND, CAR, INS, ORIN, PACF |

Valores faltantes: 165 en `Departamento_residencia` y 27 en `ZONA`. Ninguna de las
variables usadas en los modelos tiene faltantes.

## Zonas

| Código | Región | Departamentos |
|---|---|---|
| AMAZ | Amazonía | Amazonas, Caquetá, Guainía, Guaviare, Putumayo, Vaupés |
| AND | Andina | Antioquia, Bogotá D.C., Boyacá, Caldas, Cundinamarca, Huila, Norte de Santander, Quindío, Risaralda, Santander, Tolima |
| CAR | Caribe | Atlántico, Bolívar, Cesar, Córdoba, La Guajira, Magdalena, Sucre |
| ORIN | Orinoquía | Arauca, Casanare, Meta, Vichada |
| PACF | Pacífico | Cauca, Chocó, Nariño, Valle del Cauca |
| INS | Insular | San Andrés y Providencia (excluida del análisis) |
