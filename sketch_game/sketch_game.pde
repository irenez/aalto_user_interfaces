boolean locked = false;
boolean overBox = false;

float boundary = 600;
float posX;
float posY;
float x, y;
float xOffset = 0.0; 
float yOffset = 0.0;
float ID, MT, TP_f, TP_h;

int boxSize = 75;
int frame = 0;
int hits = 0;
int level = 1;
int score = 0;


void setup() 
{
  size(640, 480);
  posX = randomize(posX);
  posY = randomize(posY);
  x = randomize(x);
  y = randomize(y);
  rectMode(RADIUS);
}

void draw() 
{ 
  background(0);
  frame +=1;

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

  text(frame, width-50, height-50);
  text("Level: " + level, 20, 20);
  text("Score: " + score, 20, 40);
  text("ID: "+ metrics(), 20, height-10);

  // Draw a box
  rect(x, y, boxSize, boxSize);


  // Draw the clickable box
  fill(255);
  rect(posX, posY, boxSize, boxSize);

  // If player runs out of time:
  if (frame == 300) {
    
    boxSize = boxSize-10;
    posX = randomize(posX);
    posY = randomize(posY);
    redraw();
    frame = 0;
    score -=300;
  }

  // Move up level after 10 'hits'
  if (hits == 10) {
    level += 1;
    boxSize -= 10;
    display();
    hits = 0;
  }
}

void mousePressed() {
  if (overBox) { 
    locked = true; 
    posX = randomize(posX);
    posY = randomize(posY);
    x = randomize(x);
    y = randomize(y);
    score += 300-frame;
    frame = 0;
    hits +=1;
  } else {
    locked = false;
  }
  xOffset = mouseX-posX; 
  yOffset = mouseY-posY;
}

void mouseReleased() {
  locked = false;
}

void display() {
  x = randomize(x);
  y = randomize(y);
  fill(126);
  rect(x, y, boxSize, boxSize);
}

public float randomize(float x) {
  x = int(random(boundary-boxSize));
  return x;
}

float metrics() {
  float offset = dist(xOffset, yOffset, posX+boxSize/2, posY+boxSize/2);
  ID = log2(offset/boxSize) + 1 ;
  MT = -31.4 + 122 * ID ;
  TP_f = ID / MT ;
  int N = level + 1;
  TP_h = log2(N+1) / MT ;
  return ID;
}

float log2 (float x) {
  return (log(x)/log(2));
}

