boolean overBox = false;
int boxWidth = 100;
int boxHeight = 25;
int posX;
int [] posY = new int[10];

void setup() {

  size(640, 480);
  smooth(); 
  
  PFont txtFont;
  txtFont = createFont("Tahoma-12.vlw", 14);
  textFont(txtFont);
  posX = width/4;

}

void draw() {
  background(200);

  posY[1] = height/5;
  for ( int i=2; i<10; i++) {
    posY[i] = posY[i-1] + boxHeight;
  }
  menu menu1 = new menu("File", posX, posY[1]);
  menu1.display();
  menu menu2 = new menu("Edit", posX, posY[2]);
  menu2.display();
  menu menu3 = new menu("Sketch", posX, posY[3]);
  menu3.display();
  menu menu4 = new menu("Tools", posX, posY[4]);
  menu4.display();
  menu menu5 = new menu("Help", posX, posY[5]);
  menu5.display();

  if (overBox) {
    menu submenu1 = new menu("New", posX+boxWidth, posY[1]);
    submenu1.display();
    menu submenu2 = new menu("Open", posX+boxWidth, posY[1]+boxHeight);
    submenu2.display();
  }
}


void mouseMoved() {
  for ( int i=1; i<10; i++) {
    if (mouseX > posX-boxWidth && mouseX < posX+boxWidth && 
      mouseY > posY[i]-boxHeight && mouseY < posY[i]+boxHeight) {
      overBox = true;
    } else {
      overBox = false;
    }
  }
}

