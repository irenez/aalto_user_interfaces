// *** Acknowledgements: ***
// * Part of the code is downloaded from Processing.org website *
// *** https://processing.org/examples/mousefunctions.html ***

float posX;
float posY;
int boxSize = 75;
boolean overBox = false;
boolean locked = false;
int score = 0;
int frame = 0;     // in seconds
//float xOffset = 0.0; 
//float yOffset = 0.0; 

void setup() 
{
  size(640, 480);
  posX = width/2.0;
  posY = height/2.0;
  rectMode(RADIUS);
  float tp = (boxSize/ 
}

void draw() 
{ 
  background(0);

  // Test if the cursor is over the box 
  if (mouseX > posX-boxSize && mouseX < posX+boxSize && 
    mouseY > posY-boxSize && mouseY < posY+boxSize) {
    overBox = true;  
    if (!locked) { 
      stroke(255); 
      fill(153);
    }
  } else {
    stroke(153);
    fill(153);
    overBox = false;
  }
  fill(255);
  text(frame, width-50, height-50);
  text("Score: " + score, 20, 20);

  // Draw the box
  rect(posX, posY, boxSize, boxSize);
  
  frame +=1;
  if (frame == 200) {
    //  background(255);
    boxSize = boxSize-10;
    posX = int(random(width-boxSize));
    posY = int(random(height-boxSize));
    redraw();
    frame = 0;
  }
}

void mousePressed() {
  if (overBox) { 
    locked = true; 
    fill(255, 255, 255);
    posX = int(random(width-boxSize));
    posY = int(random(height-boxSize));
    frame = 0;
    score +=1;
  } else {
    locked = false;
  }
  xOffset = mouseX-posX; 
  yOffset = mouseY-posY;
}

//void mouseDragged() {
//  if(locked) {
//    posX = mouseX-xOffset; 
//    posY = mouseY-yOffset; 
//  }
//}

void mouseReleased() {
  locked = false;
}

class metrics {
  ID = (log(boxSize/xOffset)/log(2)) + 1 ;
  MT = -31.4 + 122 * ID ;
  TP_f = ID / MT ;
  TP_h = (log(N+1)/log(2)) / MT ;
}


