float posX;
float posY;
int boxSize = 100;
boolean overBox = false;
boolean locked = false;
//float xOffset = 0.0; 
//float yOffset = 0.0; 

void setup() 
{
  size(640, 480);
  posX = width/2.0;
  posY = height/2.0;
  rectMode(RADIUS);  
}

void draw() 
{ 
  background(0);
  
  // Test if the cursor is over the box 
  if (mouseX > posX-boxSize && mouseX < posX+boxSize && 
      mouseY > posY-boxSize && mouseY < posY+boxSize) {
    overBox = true;  
    if(!locked) { 
      stroke(255); 
      fill(153);
    } 
  } else {
    stroke(153);
    fill(153);
    overBox = false;
  }
  
  // Draw the box
  rect(posX, posY, boxSize, boxSize);
}

void mousePressed() {
  if(overBox) { 
    locked = true; 
    fill(255, 255, 255);
    posX = int(random(width-boxSize));
    posY = int(random(height-boxSize));
  } else {
    locked = false;
  }
//  xOffset = mouseX-posX; 
//  yOffset = mouseY-posY; 

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

