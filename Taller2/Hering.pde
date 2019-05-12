
boolean showLines=true;
void hering() {
  int aux=height/12;
  stroke(0,0,255);
  strokeWeight(1);  
  line(((width/4)), 10, ((width/4)), height-10);
  line(width-((width/4)), 10, width-((width/4)), height-10);
  stroke(255,0,0);
  if (showLines==true) {
    for (int i=aux; i<aux*12; i+=aux) {
      line(width/2, height/2,-1, 20, i,-1);
    }
    for (int i=aux; i<aux*12; i+=aux) {
      line(width/2, height/2,-1, width-20,i ,-1);
    }
  }
}

void mousePressed2() {
  background(255);
  showLines=!showLines;
}
