# Taller raster

## Integrantes

Complete la tabla:

| Integrante | github nick |
|------------|-------------|
|   Diego Duarte Camacho         |   dduartec          |
|   David Santiago Gantiva         |   dsgantivac          |
|   Sergion Ayala Castillo         |   saayalac         |
|   Cristian Laiton         |   cglaitong          |


## Discusión

 El objetivos para este taller fueron: 
 1. Rasterizar un triangulo con cordenadas baricentricas
 2. Sombrear la superficie del triangulo a partir de los colores de los vertices
 3. Implementacion de un algoritmo de antialiasing 
 
 Raster:
 
 ![alt text]( https://github.com/aventurasvisuales2019-1/TalleresVisual/blob/master/Taller3/raster1.png "Raster")
 
 Sombreado de superficie:
 
 ![alt text](https://github.com/aventurasvisuales2019-1/TalleresVisual/blob/master/Taller3/raster.png "Sombreado")
 
 Algoritmo de Anti-Aliasing :
 
Los píxeles individuales se dividen en múltiples muestras de cobertura. Al analizar el color de los píxeles que rodean cada una de estas muestras, se produce un promedio, que determina el color general del píxel original.
 
 ![alt text](https://github.com/aventurasvisuales2019-1/TalleresVisual/blob/master/Taller3/antialisingExplain.png "Algoritmo")
 
 Anti-Aliasing :
 
 ![alt text](https://github.com/aventurasvisuales2019-1/TalleresVisual/blob/master/Taller3/antialising.png "Antialising")

 
 
 
 ### Referencias 
 [Antialiasing strategies](https://web.cs.wpi.edu/~matt/courses/cs563/talks/antialiasing/methods.html)
 
 [Antialising comparision](https://sapphirenation.net/anti-aliasing-comparison-performance-quality/)
 
 [How To Choose the Right Anti-Aliasing Mode](https://www.tested.com/tech/pcs/1194-how-to-choose-the-right-anti-aliasing-mode-for-your-gpu/)

