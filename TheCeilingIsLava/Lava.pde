class Lava {
  float y, dy;
  PImage lava = loadImage("lava.png");
  PImage lava2 = loadImage("lava2.png");
  int state;

  Lava() {
    y = 20;
    dy = 0.03;
  }

  void update() {
    if (y < height/2)
      y += dy;
    fill(255, 0, 0);
    rectMode(CORNER);
    if (state%100 < 50)
      image(lava, 0, y - 420);
    else
      image(lava2, 0, y - 420);
    state++;
  }
}