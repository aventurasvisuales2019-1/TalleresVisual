int seleccion=0;
int sep=10;
int butwid=100;
int buthei=50;
Button b1 = new Button("Breathing Square", 50, 20, butwid, buthei);
Button b2 = new Button("Motion Parallax", 50, 20+(buthei+sep)*1, butwid, buthei);
Button b3 = new Button("Bailarina", 50, 20+(buthei+sep)*2,  butwid, buthei);
Button b4 = new Button("Stepping Feet", 50, 20+(buthei+sep)*3,  butwid, buthei);
Button b5 = new Button("Lilac Chaser", 50, 20+(buthei+sep)*4,  butwid, buthei);
Button b6 = new Button("Grid", 50, 20+(buthei+sep)*5,  butwid, buthei);
Button b7 = new Button("Figura de Hering", 50, 20+(buthei+sep)*6,  butwid, buthei);

void setup() {
  size(400, 500,P3D);
  surface.setResizable(true); 
  s = loadShape("bailarina.obj");
  s2 = loadShape("bailarina.obj");
  s.setFill(color(0));  
  s.rotateX(135);
  
  for (int i = 0; i < quantity; i++) { 
    squareSize[i] = round(random(minSquareSize, maxSquareSize)); 
    xPos[i] = random(0, 1500); 
    yPos[i] = random(0, 1500); 
    direction[i] = round(random(0, 4));
  }
}

void draw() {
  if (seleccion==0) {
    colorMode(RGB, 255, 255, 255);
    surface.setSize(400,500);    
    background(255);
    frameRate(60);
    strokeWeight(0);    
    b1.Draw();
    b2.Draw();
    b3.Draw();
    b4.Draw();
    b5.Draw();
    b6.Draw();
    b7.Draw();
    text("Presionar e para volver a este menú",200,height-50);
    text("INTEGRANTES",300,75);
    text("Sergio Ayala",300,100);
    text("Diego Duarte",300,125);
    text("David Gantiva",300,150);
    text("Cristian Laiton",300,175);
  } else if (seleccion==1) {
    rotar();
  } else if (seleccion==2) {
    drawIlusion();
  } else if (seleccion==3) {
    drawBailarina();
  } else if (seleccion==4) {
    drawLines();
  } else if (seleccion==5) {
    drawCircles();
  } else if (seleccion==6) {
    drawSquares();
  }  else if (seleccion==7) {
    hering();
  }
}

void mousePressed()
{
  if (seleccion==0) {
    if (b1.MouseIsOver()) {
       surface.setSize(400, 400);
      seleccion=1;
    } else if (b2.MouseIsOver()) {
      surface.setSize(1500, 1500);
      seleccion=2;
    } else if (b3.MouseIsOver()) {
      surface.setSize(1000, 600);
      seleccion=3;
    } else if (b4.MouseIsOver()) {
      surface.setSize(520, 520);
      seleccion=4;
    }else if (b5.MouseIsOver()) {
      frameRate(5);
      surface.setSize(520, 520);
      seleccion=5;
    } else if (b6.MouseIsOver()) { 
      surface.setSize(520, 520);
      seleccion=6;
    } else if (b7.MouseIsOver()) { 
      surface.setSize(131, 252);
      seleccion=7;
    }
  } else if (seleccion==1) {
    mousePressed1();
  }else if (seleccion==7) {
    mousePressed2();
  }
}

void keyPressed() {
  if (key == 'E' || key == 'e') {
    seleccion=0;
    background(255);
  }
}
