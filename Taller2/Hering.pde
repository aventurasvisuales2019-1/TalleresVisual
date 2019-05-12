

void hering(){
  int aux=height/12;
  stroke(0);
  strokeWeight(1);
  for(int i=aux;i<aux*12;i+=aux){
    line(width/2,height/2,20,i);
  }
  for(int i=aux;i<aux*12;i+=aux){
    line(width/2,height/2,width-20,i);
  }
  line(((width/4)),10,((width/4)),height-10);
  line(width-((width/4)),10,width-((width/4)),height-10);
}
