PShader shade;
PImage img;
PImage norm;
color diffuse;

boolean flag = false;
float deg = 0;
  

void setup() {
  size(700,700,P3D);
  stroke(255);
  noStroke();
  tint(255);
  fill(255);
  shade = loadShader("PhongFrag.glsl", "PhongVert.glsl");
  textureMode(NORMAL);
  img = loadImage("img.jpg");
  norm = loadImage("norm.jpg");
  shade.set("normTex", norm);
  //frameRate(20);
}

void draw() {
  background(0);
  translate(width/2, height/2);
  ambientLight(255, 255, 255);
  lightSpecular(256, 256, 256);
  directionalLight(255, 255, 220, -1, 1, -1);
  lightSpecular(0,0,32);
  directionalLight(64, 64, 90, 0, -1, 0);
  if (flag){
    rotateY(deg);
    deg += 0.01;
  }
  specular(255);
  shininess(50);
  ambient(60);
  diffuse(120);
  shader(shade);
  uvbox(350);
}

void diffuse(float val) {
  diffuse = color(val);
}

void uvbox(float a) {
  float x1 = -a/2;
  float x2 =  a/2;
  float y1 = -a/2;
  float y2 =  a/2;
  float z1 =  a/2;
  float z2 = -a/2;
  float u1 = 0;
  float u2 = 1;
  float v1 = 1;
  float v2 = 0;
  beginShape(QUADS);
  texture(img);
  attrib("diffuse", red(diffuse)/255f, green(diffuse)/255f, blue(diffuse)/255f, 1.0);
  
  // front
  normal(0, 0, 1);
  tangent(1, 0, 0);
  vertex(x1, y1, z1, u2, v1);
  vertex(x2, y1, z1, u1, v1);
  vertex(x2, y2, z1, u1, v2);
  vertex(x1, y2, z1, u2, v2);
  endShape();
}

void tangent(float x, float y, float z) {
  attribNormal("tangent", x, y, z);
}

void keyPressed(){
  if(key == 'a'){
    flag = !flag;
  }

}
