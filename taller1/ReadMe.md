# Taller de análisis de imágenes por software

## Propósito

Introducir el análisis de imágenes/video en el lenguaje de [Processing](https://processing.org/).

## Tareas

Implementar las siguientes operaciones de análisis para imágenes/video:

* Conversión a escala de grises.
* Aplicación de algunas [máscaras de convolución](https://en.wikipedia.org/wiki/Kernel_(image_processing)).
* (solo para imágenes) Despliegue del histograma.
* (solo para imágenes) Segmentación de la imagen a partir del histograma.
* (solo para video) Medición de la [eficiencia computacional](https://processing.org/reference/frameRate.html) para las operaciones realizadas.

Emplear dos [canvas](https://processing.org/reference/PGraphics.html), uno para desplegar la imagen/video original y el otro para el resultado del análisis.

## Integrantes

Complete la tabla:

| Integrante | github nick |
|------------|-------------|
|   Diego Duarte Camacho         |   dduartec          |
|   David Santiago Gantiva         |   dsgantivac          |
|   Sergion Ayala Castillo         |   saayalac         |
|   Cristian Laiton         |   cglaitong          |

## Discusión
#### Aclaraciones
Para ser ejecutado correctamente son necesarias las siguientes aclaraciones
- librerías Video (manejo de video) y ControlP5 (interfaz gráfica).
- Recibe únicamente videos de formato mp4 y mov. 
- Dentro de la carpeta Data se encuentran distintas imágenes y videos de prueba. Los videos totoro y transit tienen resolución de 360p. El video "videoplayback" tiene resolución 1080p.
#### Eficiencia computacional
Al abrir un video, se muestra el framerate de la ventana. Al añadir máscaras de convolución, escala de grises o segmentación, observamos como cambia el framerate
#### Escala de grises
Mediante el botón sc, ponemos la imagen o el video en escala de grises, esto se logra calculando el rgb de cada píxel y dividirlo entre 3
#### Mascaras de convolución
Hay 3 mascaras de convolución a escoger para imagen o video.
- c1: Emboss, sensación de profundidad.
- c2: detección de bordes.
- c3: sharpen, la imagen parece más vivida.
#### Segmentación por histograma
Se muestra el histograma de brillo de la imagen, ya este modificada o no.
Se puede seleccionar un rango entre 0 y 255 y dar clic en seg para segmentar la imagen dentro del rango seleccionado, es decir, pintar únicamente los pixeles dentro de ese rango.
En el histograma se visualizará la segmentación mostrando el rango en rojo.

## Entrega

* Hacer [fork](https://help.github.com/articles/fork-a-repo/) de la plantilla. Plazo: 28/4/19 a las 24h.
* (todos los integrantes) Presentar el trabajo presencialmente en la siguiente sesión de taller.
