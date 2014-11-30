class MultiList {
  String t;
  int x, y;


  public MultiList(String title, int posX, int posY) {
    t = title;
    x = posX;
    y = posY;
  }

  add() {
    stroke(0);
    fill(126);
    rect(x, y, boxWidth, boxHeight);
    fill(0);
    text(t, x+boxWidth/3, y+boxHeight-boxHeight/3);
  }
  
}
