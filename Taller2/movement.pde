PImage img;
int num_circles = 12;
int flag = 0;
int radius = 40;
int sq1x = 5;
int sq2x = 5;
int drawLines = 1;



void drawLines() {
  frameRate(20);
  int rectWidth = 80;
  int lineWeight = 20;
  background(242);
  strokeWeight(lineWeight);  

  stroke(19);

  if (drawLines == 1) {
    for (int i=0; i<width; i+=lineWeight*2) {
      line(i+20, 0, -1, i+20, height, -1);
    }
  }
  noStroke();

  fill(47, 2, 144);
  //fill(0);
  rect(sq1x, height/2+50, rectWidth, 50);

  fill(232, 254, 58);
  //fill(225);
  rect(sq2x, height/2-50, rectWidth, 50);

  sq1x+=1;
  sq2x+=1;

  if (sq1x >= width) {
    sq1x = -rectWidth;
    sq2x = -rectWidth;
  }
}

void mouseClicked() {
  if (drawLines == 0) {
    drawLines = 1;
  } else {
    drawLines = 0;
  }
}



void drawSquares() {
  int x = 10;
  int y = 10;
  fill(0);
  for (int i=0; i<25; i++) {
    for (int j=0; j< 25; j++) {
      rect(x+20*i, y+20*j, 15, 15);
    }
  }
}
//https://en.wikipedia.org/wiki/Troxler%27s_fading

void drawCircles() {
  int x = width/2;
  int y = height/2;

  background(255);
  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0; i < num_circles; i++) {
    rotate(radians(360/float(num_circles)));
    if (i != flag) {
      drawGradient(120, 0);
    }
    if (flag == num_circles) {
      flag =0;
    }
  }
  //println(flag);
  flag++;
  popMatrix();

  stroke(0);
  strokeWeight(1);
  line(-10+x, y,-1, 10+x, y,-1);
  line(x, -10+y,-1, x, 10+y,-1);
}

void drawGradient(float x, float y) {
  colorMode(HSB, 360, 100, 100);
  noStroke();
  //  int radius = width/(2*2);
  for (int r = radius; r > 0; --r) {
    fill(309, 39, 65, 5);
    ellipse(x, y, r, r);
  }
}
