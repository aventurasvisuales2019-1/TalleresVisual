# Taller de shaders

## Propósito

Estudiar los [patrones de diseño de shaders](http://visualcomputing.github.io/Shaders/#/4).

## Tarea

1. Hacer un _benchmark_ entre la implementación por software y la de shaders de varias máscaras de convolución aplicadas a imágenes y video.
2. Implementar un modelo de iluminación que combine luz ambiental con varias fuentes puntuales de luz especular y difusa. Tener presente _factores de atenuación_ para las fuentes de iluminación puntuales.
3. (grupos de dos o más) Implementar el [bump mapping](https://en.wikipedia.org/wiki/Bump_mapping).

## Integrantes

Complete la tabla:

| Integrante | github nick |
|------------|-------------|
|   Diego Duarte Camacho         |   dduartec          |
|   David Santiago Gantiva         |   dsgantivac          |
|   Sergion Ayala Castillo         |   saayalac         |
|   Cristian Laiton         |   cglaitong          |


## Informe

# Punto 2

Se realizo la implementacion de luz especular junto a luz difusa y luz ambiental sobre un objeto cilindrico, mostrando las fuentes de luz como esperas de color negro en el ambiente.

Para la realizacion de la luz difusa, se uso el producto punto entre la direccion de la luz y el vector normal de los vertices.

Para la luz especular, se realizao el producto punto entre la direccion de la luz que es reflejada, y la direccion del observador.

<p align="center">
  <b>Imagen con mapeo de vectores normales</b><br>
  <br><br>
  <img src="https://github.com/aventurasvisuales2019-1/TalleresVisual/blob/master/Taller4/punto3/data/punto2Screenshot.png">
</p>

# Punto 3

Para la realizacion de esta parte, se tomo la siguiente imagen:
<p align="center">
  <b>Imagen original</b><br>
  <br><br>
  <img src="https://github.com/aventurasvisuales2019-1/TalleresVisual/blob/master/Taller4/punto3/data/elixir.png">
</p>


Se realizo mapeo de vectores normales con ayuda de la pagina que se encuentra en el siguiente link: 
https://cpetry.github.io/NormalMap-Online/

<p align="center">
  <b>Imagen con mapeo de vectores normales</b><br>
  <br><br>
  <img src="https://github.com/aventurasvisuales2019-1/TalleresVisual/blob/master/Taller4/punto3/data/norm%20(copy).jpg">
</p>




Se uso luz especular, luz ambiental y luz difusa, com fuentes de iluminaciones, con ayuda del mapa de vectores normales se pudo determinar la intensidad para generar un mejor efecto en la superficie. 

<p align="center">
  <b>Resultado final en processing</b><br>
  <br><br>
  <img src="https://github.com/aventurasvisuales2019-1/TalleresVisual/blob/master/Taller4/punto3/data/screenshot.png">
</p>

