boolean flag=false;

// Implement this function to rasterize the triangle.
// Coordinates are given in the node system which has a dimension of 2^n
void triangleRaster() {
  pushStyle();
  strokeWeight(0);
  stroke(255);    
  for (int i=0; i<arr.size(); i++) {
    Vector p=arr.get(i);
    rect(floor(node.location(p).x()), floor(node.location(p).y()), squareSize, squareSize);
  }
  popStyle();

  if (debug) {    
    pushStyle();
    strokeWeight(0);
    stroke(255);    
    for (int i=0; i<arr.size(); i++) {
      Vector p=arr.get(i);
      rect(floor(node.location(p).x()), floor(node.location(p).y()), squareSize, squareSize);
    }
    strokeWeight(0);
    fill(255, 0, 0);
    rect(floor(node.location(v1).x()), floor(node.location(v1).y()), squareSize, squareSize);
    fill(0, 255, 0);
    rect(floor(node.location(v2).x()), floor(node.location(v2).y()), squareSize, squareSize);
    fill(0, 0, 255);
    rect(floor(node.location(v3).x()), floor(node.location(v3).y()), squareSize, squareSize);
    popStyle();
  }
}

void calcPoints() {
  arr.clear();
  float nPixels=pow(2, n);
  float pixelSize=width/pow( 2, n);
  float x=-pixelSize*(nPixels/2)+(pixelSize/2);
  for (float i=x; i<width/2; i+=pixelSize) {
    for (float j=x; j<width/2; j+=pixelSize) {
      Vector p= new Vector(i, j);
      float w3= edgeFunction(node.location(v1), node.location(v2), node.location(p));
      float w1= edgeFunction(node.location(v2), node.location(v3), node.location(p));
      float w2= edgeFunction(node.location(v3), node.location(v1), node.location(p));
      if ((w3 >= 0 && w1 >= 0 && w2 >= 0)||(w3 <= 0 && w1 <= 0 && w2 <= 0)) {
        arr.add(p);
      }
    }
  }
  /*for(int i=0;i<arr.size();i++){
   Vector p=arr.get(i);
   rect(floor(node.location(p).x()), floor(node.location(p).y()), squareSize, squareSize);
   }*/

  /*flag=false;
   arr.clear();
   Vector p = new Vector(0, 0);
   for (int i=0; i<width; i++) {
   for (int j=0; j<height; j++) {
   p=new Vector(i, j);
   boolean inside = true;
   
   inside &= edgeFunction(node.location(v1), node.location(v2), node.location(p));
   inside &= edgeFunction(node.location(v1), node.location(v3), node.location(p));
   inside &= edgeFunction(node.location(v2), node.location(v3), node.location(p));
   if (inside == true) {
   arr.add(p);
   }
   }
   }
   println(arr.size());*/
}

/*boolean edgeFunction(Vector v0, Vector v1, Vector p)
 {
 float aux=(v0.y()-v1.y())*p.x() + (v1.x()-v0.x())*p.y() + (v0.x()*v1.y() - v0.y()*v1.x());
 println(aux);
 return aux>=0 ;
 }*/
float edgeFunction(Vector a, Vector b, Vector c)
{
  return ((c.x() - a.x()) * (b.y() - a.y()) - (c.y() - a.y()) * (b.x() - a.x()));
}
