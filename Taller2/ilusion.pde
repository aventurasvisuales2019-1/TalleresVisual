

float x, y;
float startX, startY, endX, endY;
int quantity = 900; 
float [] xPos = new float[quantity]; 
float [] yPos = new float[quantity]; 
int [] squareSize = new int[quantity]; 
int [] direction = new int[quantity]; 
int minSquareSize = 10; 
int maxSquareSize = 20;

void drawIlusion() {
  
  background(0);


  for (int i = 0; i < xPos.length; i++) {

    rect(xPos[i], yPos[i], squareSize[i], squareSize[i]);

    fill(random(0, 255), random(0, 255), random(0, 255));

    if (mousePressed) {

      yPos[i] += squareSize[i] + direction[i]; 

      if (yPos[i] > height + squareSize[i]) {
        xPos[i] = random(0, width);
        yPos[i] = -squareSize[i];
      }
    }
  }
}                                








//tomado y modificado de https://forum.processing.org/two/discussion/16806/optical-illusion
