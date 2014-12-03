import controlP5.*;

int boxHeight = 25;
int boxWidth = 100;
int posX = 100;
int posY = 50;

boolean isOver = false;

PFont txtFont;
ControlP5 controlP5;
ListBox menu, submenu;


void setup() {
  size(700, 400);
  frameRate(30);
  smooth();

  txtFont = createFont("Tahoma-12.vlw", 14);
  textFont(txtFont);

  controlP5 = new ControlP5(this);
  menu = controlP5.addListBox(" ")
    .setPosition(posX, posY)
      .setSize(boxWidth, 11*boxHeight)
        .setItemHeight(boxHeight)
          .setBarHeight(1)
            .setColorBackground(color(20))
              .setColorActive(color(0))
                .setColorForeground(color(150))
                  .disableCollapse()
                    ;

  for (int i=1; i<=10; i++) {
    ListBoxItem item = menu.addItem("Level " + i, i);
    color c = color(100);
    item.setColorBackground(c);
  }

  if (isOver) {
    submenu = controlP5.addListBox(" ")
      .setPosition(posX+boxWidth, posY)
        .setSize(boxWidth, 6*boxHeight)
          .setItemHeight(boxHeight)
            .setBarHeight(1)
              .setColorBackground(color(20))
                .setColorActive(color(0))
                  .setColorForeground(color(150))
                    .disableCollapse()
                      ;
    for (int i=1; i<=5; i++) {
      ListBoxItem item = submenu.addItem("Level " + i, i);
      color c = color(100);
      item.setColorBackground(c);
      item.setValue(i);
    }
  }
}

void draw() {
  background(200);
}

void mouseMoved() {
  if (menu.isMouseOver()) {
    isOver = true;
    print (menu.getPosition());
    print (menu.getValue());
  } else {
    isOver = false;
  }
}

