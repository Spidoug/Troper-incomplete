class PWindowAss extends PApplet {
  int xLoc, yLoc;

  PWindowAss(int xLoc, int yLoc) {
    this.xLoc = xLoc;
    this.yLoc = yLoc;
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }

  public void settings() {
    size(400, 300);
  }

  public void setup() {
    surface.setTitle("Assinatura");
    surface.setLocation(xLoc + 300, yLoc + 150);
  }

  public void draw() {
    background(210);
  }

  void keyPressed() {

    if (key == ESC) {
      key = 0;
    }
  }

  PApplet parent;

  void exit() {
  }
}
