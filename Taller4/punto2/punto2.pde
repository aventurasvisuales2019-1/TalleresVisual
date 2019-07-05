PShape can;
float angle;

PShader lightShader;

float zCamera = height/2.0+600;
float xCamera = height/2.0;
float yCamera = height/2.0;

float zLigth1 = -800;
float zLigth2 = height+450;
float xLigth3 = 100;

void setup() {
  size(640, 360, P3D);
  can = createCan(250, 800, 64);
  lightShader = loadShader("lightfrag.glsl", "lightvert.glsl");
}

void draw() {    
  background(0);
  
  camera(xCamera, yCamera, zCamera / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);

  shader(lightShader);
  
  pointLight(255, 255, 255, width/2, zLigth1, 200);
  pointLight(255, 255, 255, width/2, zLigth2, 200);
  pointLight(255, 255, 255, mouseX, mouseY, 260);
  
  translate(width/2, height/2);
  rotateY(angle);  
  shape(can);  
  angle += 0.01;
}

PShape createCan(float r, float h, int detail) {
  textureMode(NORMAL);
  PShape sh = createShape();
  sh.beginShape(QUAD_STRIP);
  sh.noStroke();
  for (int i = 0; i <= detail; i++) {
    float angle = TWO_PI / detail;
    float x = sin(i * angle);
    float z = cos(i * angle);
    float u = float(i) / detail;
    sh.normal(x, 0, z);
    sh.vertex(x * r, -h/2, z * r, u, 0);
    sh.vertex(x * r, +h/2, z * r, u, 1);    
  }
  sh.endShape(); 
  return sh;
}

void keyPressed() {
  if (key == CODED){
    if (keyCode == DOWN) {
      zCamera += 10;
    } else if(keyCode == UP){
      zCamera -=10;
    }
    else if (keyCode == LEFT) {
      yCamera += 100;
    } else if(keyCode == RIGHT){
      yCamera -=100;
    }
  }
  
  
  if (key == 'q') {
    zLigth1 += 40;
  } else if(key == 'w'){
    zLigth1 -=40;
  }
  
  if (key == 'a') {
    zLigth2 += 40;
  } else if(key == 's'){
    zLigth2 -=40;
  }
  
  if (key == 'z') {
    xLigth3 += 40;
  } else if(key == 'x'){
    xLigth3 -=40;
  }
}
