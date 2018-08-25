class Player {
  float x, y, dx, dy;
  float hitbox;
  boolean secondWind;
  
  Player() {
     x = width/2;
     y = height/3;
     hitbox = 50;
     dy = 3;
  }

  void update() {
    move();
    display();
  }
  
  void move() {
    if (x + hitbox/2 >= width || x - hitbox/2 <= 0) {
      if (x < width/2)
        x += 2;
      else 
        x -= 2;
      dx *= -0.6; 
      }
      x += dx;
    
  //  y += dy; //debuggin!
  }

  void display() {
    fill(255, 0, 0);
    ellipse(x, y, hitbox, hitbox);
  }
}