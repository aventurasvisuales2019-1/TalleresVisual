import processing.video.*;
PGraphics pg;
Movie video;

PImage image;
PShape window; 
PShader convShader;
int maskSelected = 1;
boolean showMask = false;
float ballX;
float ballY;

void settings() {
  size(1200, 600, P2D);
  smooth();
}

void setup() {  
  video = new Movie(this, "videoplayback.mp4");
  video.loop();
  convShader = loadShader("convfrag.glsl");
  background(0);
  pg=createGraphics(1920, 1080, P2D);
}

void draw() {   
  shader(convShader);
  convShader.set("maskSelected", maskSelected);
  convShader.set("showMask", showMask);
  translate(50, height/2);
  if (video.available()) {
    pg.beginDraw();
    pg.image(video, 0, 0);
    pg.textSize(40);
    pg.text(frameRate, 50, 50);
    pg.endDraw();
    video.read();
    window  = createWindow(1100, 500, pg, 100);
    shape(window);
    ballX = mouseX;
    ballY = mouseY;
  }
}
PShape createWindow(int imageW, int imageH, PImage texture, int detail) {
  textureMode(NORMAL); // Normalize the coordinates in texture [0,1]
  PShape wd = createShape();
  wd.beginShape(QUAD_STRIP); // First 4 coordinates generate an rectangle the next two too.
  wd.noStroke();
  wd.texture(texture);
  for (int i = 0; i <= detail; i++) {
    float u = float(i) / detail;
    float x = (imageW / detail) * i;
    wd.normal(1, 0, 1); // Out side in plane z-x
    wd.vertex(x, -imageH/2, 1, u, 0);
    wd.vertex(x, imageH/2, 1, u, 1);
  }
  wd.endShape();  
  return wd;
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
    maskSelected = 2;
  }
  if (pressed == '4') {
    maskSelected = 2;
  }
}
