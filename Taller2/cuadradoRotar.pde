float angle=0;
float speed=0.04;
int tam=185;
boolean pressed = false;
color c1 = 0;
color c2 = 255;
int cont=0;


void rotar() {
  background(255);
  push();
  angle += speed;
  fill(c1);
  translate(width / 2, height / 2);
  rotate(angle);
  rect(-115, -115, 230, 230);
  pop();
  if (pressed) {
    stroke(0);
    strokeWeight(0);
    fill(c2);
    rect(0, 0, tam, tam);
    rect(0, width-tam, tam, tam);
    rect(width-tam, 0, tam, tam);
    rect(width-tam, width-tam, tam, tam);
  }
}
void mousePressed1() {
  pressed=!pressed;
  cont++;
  if (cont==2) {
    c1=color(random(255), random(255), random(255));
    c2=color(255-red(c1), 255-green(c1), 255-blue(c1));
    cont=0;
  }
}
