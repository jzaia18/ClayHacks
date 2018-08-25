class Lava {
  float y, dy;
  
  Lava() {
    y = 20;
    dy = 0.03;
  }
  
  void update() {
    if (y < height/2)
      y += dy;
    fill(255, 0, 0);
    rectMode(CORNER);
    rect(0, 0, width, y); 
  }
}