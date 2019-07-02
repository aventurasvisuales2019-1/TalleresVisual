import processing.video.*;
Movie mov;
PGraphics pg;
int maskSelected = 1;
boolean showMask = false;

void setup() {
  size(1100, 500);
  mov = new Movie(this, "videoplayback.mp4");
  mov.loop();
  background(0);
  pg=createGraphics(1920, 1080);
}

void draw() {
  println(maskSelected);
  pg.beginDraw();
  pg.image(mov, 0, 0);
  pg.loadPixels();
  if (showMask) {
    if (maskSelected==1) {
      //convolucion 1
      float[][] matrix = { { -2, -1, 0 }, 
        { -1, 1, 1 }, 
        { 0, 1, 2 } }; 
      int matrixsize = 3;
      for (int x = 0; x < mov.width; x++) {
        for (int y = 0; y < mov.height; y++ ) {
          color c = convolution(x, y, matrix, matrixsize, mov);
          int loc = x + y*pg.width;
          pg.pixels[loc] = c;
        }
      }
    } else if (maskSelected==2) {
      //convolucion 2
      float[][] matrix = { { -1, -1, -1 }, 
        { -1, 8, -1 }, 
        { -1, -1, -1 } }; 
      int matrixsize = 3;
      for (int x = 0; x < mov.width; x++) {
        for (int y = 0; y < mov.height; y++ ) {
          color c = convolution(x, y, matrix, matrixsize, mov);
          int loc = x + y*pg.width;
          pg.pixels[loc] = c;
        }
      }
    } else if (maskSelected==3) {
      //convolucion 3
      float[][] matrix = { { 0, -1, 0 }, 
        { -1, 5, -1 }, 
        { 0, -1, 0 } }; 
      int matrixsize = 3;
      for (int x = 0; x < mov.width; x++) {
        for (int y = 0; y < mov.height; y++ ) {
          color c = convolution(x, y, matrix, matrixsize, mov);
          int loc = x + y*pg.width;
          pg.pixels[loc] = c;
        }
      }
    }
  }
  pg.updatePixels();   
  pg.textSize(map(3, 0, 100, 0, mov.width));
  pg.text(this.frameRate, mov.width-map(50, 0, 640, 0, mov.width), map(30, 0, 640, 0, mov.width));
  pg.endDraw(); 
  image(pg, 0, 0, 1100, 500);
}

void movieEvent(Movie m) {
  m.read();
}

color convolution(int x, int y, float[][] matrix, int matrixsize, PImage img)
{
  float rtotal = 0.0;
  float gtotal = 0.0;
  float btotal = 0.0;
  int offset = matrixsize / 2;
  for (int i = 0; i < matrixsize; i++) {
    for (int j= 0; j < matrixsize; j++) {
      // What pixel are we testing
      int xloc = x+i-offset;
      int yloc = y+j-offset;
      int loc = xloc + img.width*yloc;
      // Make sure we haven't walked off our image, we could do better here
      loc = constrain(loc, 0, img.pixels.length-1);
      // Calculate the convolution
      rtotal += (red(img.pixels[loc]) * matrix[i][j]);
      gtotal += (green(img.pixels[loc]) * matrix[i][j]);
      btotal += (blue(img.pixels[loc]) * matrix[i][j]);
    }
  }
  // Make sure RGB is within range
  rtotal = constrain(rtotal, 0, 255);
  gtotal = constrain(gtotal, 0, 255);
  btotal = constrain(btotal, 0, 255);
  // Return the resulting color
  return color(rtotal, gtotal, btotal);
}
void keyPressed() {
  handleKeyPress(key);
}
void handleKeyPress(char pressed) { 
  if (pressed == 'm') {
    showMask = !showMask;
  }
  if (pressed == '1') {
    maskSelected = 1;
  }
  if (pressed == '2') {
    maskSelected = 2;
  }
  if (pressed == '3') {
    maskSelected = 3;
  }
}
