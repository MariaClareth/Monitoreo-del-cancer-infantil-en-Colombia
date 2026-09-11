# Cómo subir estos archivos al repositorio

El repositorio ya está creado en
<https://github.com/MariaClareth/Monitoreo-del-cancer-infantil-en-Colombia>
y todos los archivos de esta carpeta ya traen esa dirección, así que no hay que editar nada.

## Subirlos desde el navegador

1. Descomprime el ZIP. Te queda una carpeta llamada
   `Monitoreo-del-cancer-infantil-en-Colombia`.
2. En la página del repositorio, haz clic en **uploading an existing file**
   (el enlace azul del recuadro «Quick setup»).
3. **Abre la carpeta** y selecciona todo lo que hay dentro: `README.md`, `LICENSE`,
   `requirements.txt`, `COMO_PUBLICAR.md`, `.gitignore` y las carpetas `datos`,
   `notebooks`, `scripts`, `figuras` y `resultados`. Arrástralo a la ventana del navegador.

   No arrastres la carpeta completa: si lo haces, GitHub anida todo un nivel más abajo y
   el botón de Colab deja de encontrar el cuaderno.

4. Abajo, en **Commit changes**, escribe `Análisis inicial` y presiona el botón verde.

En el Mac, para ver el `.gitignore` tienes que pulsar `Cmd + Shift + .` en el Finder; los
archivos que empiezan por punto están ocultos. Si no aparece, tampoco pasa nada: solo
sirve para que git ignore archivos temporales.

## O desde la terminal, si tienes git

```bash
cd Monitoreo-del-cancer-infantil-en-Colombia
git init
git add .
git commit -m "Análisis inicial"
git branch -M main
git remote add origin https://github.com/MariaClareth/Monitoreo-del-cancer-infantil-en-Colombia.git
git push -u origin main
```

## Comprobar que quedó bien

Abre el repositorio y presiona el botón **Abrir en Colab** del README. Debe cargar el
cuaderno; al ejecutarlo, descarga los datos solo y reproduce todas las tablas y figuras.
Si eso funciona, el enlace ya sirve para el código QR del flyer.

## El QR del flyer

Genera el código con esta dirección:

```
https://github.com/MariaClareth/Monitoreo-del-cancer-infantil-en-Colombia
```

Sirve cualquier generador gratuito. Descarga el PNG y, en el flyer, haz clic derecho
sobre el recuadro punteado que dice `[ QR ]` → *Cambiar imagen*.

## Antes de difundirlo

`datos/base_completa.csv` tiene los registros individuales de notificación. No incluye
nombres ni documentos, pero sí edad, sexo, semana y municipio de menores de 18 años con
cáncer. Conviene confirmar que la base venga de un conjunto de datos abiertos ya publicado
—por ejemplo de datos.gov.co— antes de dejarla en un repositorio público. Si hubiera
dudas, basta con no subir ese archivo: `DataE.csv` reproduce por sí solo todos los
resultados del análisis.
