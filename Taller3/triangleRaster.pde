color c1=color(255, 0, 0);
color c2=color(0, 255, 0);
color c3=color(0, 0, 255);
boolean as=false;
boolean colorized =false;

// Implement this function to rasterize the triangle.
// Coordinates are given in the node system which has a dimension of 2^n
void triangleRaster() { 
  for (int i=0; i<arr.size(); i++) {
    pushStyle();
    strokeWeight(0);
    if (as && colorized) {
      fill(red.get(i), green.get(i), blue.get(i), alpha.get(i)*255);
    }else if(colorized){
      fill(red.get(i), green.get(i), blue.get(i));
    }else if(as){
      fill(255,alpha.get(i)*255);
    }else{
      fill(255);
    }
    Vector p=arr.get(i);    
    rect(floor(node.location(p).x()), floor(node.location(p).y()), squareSize, squareSize);
    popStyle();
  }

  if (debug) {
    pushStyle();
    strokeWeight(0);
    fill(c1);
    rect(floor(node.location(v1).x()), floor(node.location(v1).y()), squareSize, squareSize);
    fill(c2);
    rect(floor(node.location(v2).x()), floor(node.location(v2).y()), squareSize, squareSize);
    fill(c3);
    rect(floor(node.location(v3).x()), floor(node.location(v3).y()), squareSize, squareSize);
    popStyle();
  }
}
float ran=10*pow(2,n);
void calcPoints() {
  if (as && colorized) {
      ran=10*pow(2,n);
    }else if(colorized){
      ran=0;
    }else if(as){
      ran=10*pow(2,n);
    }else{
      ran=0;
    }
  arr.clear();
  red.clear();
  green.clear();
  blue.clear();
  alpha.clear();
  float nPixels=pow(2, n);
  float pixelSize=width/pow( 2, n);
  float x=-pixelSize*(nPixels/2)+(pixelSize/2);
  float area = edgeFunction(node.location(v1), node.location(v2), node.location(v3)); 
  for (float i=x; i<width/2; i+=pixelSize) {
    for (float j=x; j<width/2; j+=pixelSize) {
      Vector p= new Vector(i, j);
      float w3= edgeFunction(node.location(v1), node.location(v2), node.location(p));
      float w1= edgeFunction(node.location(v2), node.location(v3), node.location(p));
      float w2= edgeFunction(node.location(v3), node.location(v1), node.location(p));
      if ((w3 >= -ran && w1 >= -ran && w2 >= -ran)||(w3 <= ran && w1 <= ran && w2 <= ran)) {        
        arr.add(p);
        w1 = w1/area; 
        w2 = w2/area; 
        w3 = w3/area;
        float r = w1 * red(c1) + w2 * red(c2) + w3 * red(c3); 
        float g = w1 * green(c1) + w2 * green(c2) + w3 * green(c3); 
        float b = w1 * blue(c1) + w2 * blue(c2) + w3 * blue(c3);
        red.add(r);
        green.add(g);
        blue.add(b);
        alpha.add(antialiasing(p));
      }
    }
  }
}
float edgeFunction(Vector a, Vector b, Vector c)
{
  return ((c.x() - a.x()) * (b.y() - a.y()) - (c.y() - a.y()) * (b.x() - a.x()));
}

float antialiasing(Vector p) {
  float pixelSize=width/pow(2, n);
  float sum=0;
  for (float i=p.x(); i<p.x()+pixelSize; i+=pixelSize/2) {
    for (float j=p.y(); j<p.y()+pixelSize; j+=pixelSize/2) {
      Vector aux= new Vector(i, j);
      float w3= edgeFunction(node.location(v1), node.location(v2), node.location(aux));
      float w1= edgeFunction(node.location(v2), node.location(v3), node.location(aux));
      float w2= edgeFunction(node.location(v3), node.location(v1), node.location(aux));
      if ((w3 >= 0 && w1 >= 0 && w2 >= 0)||(w3 <= 0 && w1 <= 0 && w2 <= 0)) {
        sum++;
      }
    }
  }
  return sum/4;
}
