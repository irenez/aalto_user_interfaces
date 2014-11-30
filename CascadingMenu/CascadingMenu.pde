/**
 * ControlP5 MultiList
 * by andreas schlegel, 2009
 */

/** modified **/

import controlP5.*;

int boxHeight = 25;
int boxWidth = 100;
int posX = 20;
int posY = 20;

ControlP5 controlP5;
MultiList menu;

void setup() {
  size(700, 400);
  frameRate(30);
  controlP5 = new ControlP5(this);

  // add a multiList to controlP5.
  menu = controlP5.addMultiList("menuList", posX, posY, boxWidth, boxHeight);

  // create a multiListButton which we will use to
  // add new buttons to the multilist
  MultiListButton btn;
  for (int i=1; i<=10; i++) {
    btn = menu.add("level "+i, i);

    for (int j=0; j<5; j++) {
      MultiListButton sub = btn.add("level "+i+(j+1), 20+i+1);
      sub.setLabel("L"+i+" - item"+(j+1));
      sub.setColorBackground(color(64 + 18*j, 0, 0));

      for (int k=1; k<=3; k++) {
        MultiListButton sub2 = sub.add("level "+i+(j+1)+(k+1), 20+i+1+k+1);
        sub2.setLabel("L"+i+" - IT"+(j+1)+" - sub "+(k+1));
        sub2.setColorBackground(color(64 + 18*k, 0, 36*k));
      }
    }
  }
}


void draw() {
  background(0);
}


