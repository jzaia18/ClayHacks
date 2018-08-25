class Player {
  float x, y, dx, dy;
  float hitbox;
  boolean secondWind;
  long startInvulnTime;
  PImage sadice = loadImage("sadice.png");

  Player() {
    x = width/2;
    y = height/3;
    hitbox = 35;
    dy = 3;
    secondWind = false;
  }

  void update(ArrayList<Platform> platforms, Lava lava) {
    if (x + hitbox/2 >= width || x - hitbox/2 <= 0) {
      if (x < width/2)
        x += 2;
      else 
      x -= 2;
      dx *= -0.6;
    }
    x += dx;
    boolean onPlatform = false;
    for (int i = 0; i < platforms.size(); i++) {
      Platform curr = platforms.get(i);
      if ( ((curr.y < (this.y + hitbox/2) ) && (curr.y + curr.h > (this.y + hitbox/2) )) //x is above platform 
        && !((x - hitbox/2 > curr.x && x > curr.x2) || (x + hitbox/2 < curr.x && x < curr.x2))
        )
        onPlatform = true;
    }
    if (onPlatform)
      y += platforms.get(0).dy;
    else if (y + hitbox/2 <= height)
      y += dy; //debuggin!
    if (y - hitbox/2 < lava.y) {
      if (!secondWind) {
        secondWind = true;
        lava.y = 25;
        startInvulnTime = System.currentTimeMillis();
      } else if (System.currentTimeMillis() - startInvulnTime > 4000) {
        stop();
      }
    }

    display();
  }

  void display() {
    fill(0, 100, 160);
    //    rectMode(CENTER);
    //  rect(x, y, hitbox, hitbox);
    image(sadice, x - hitbox/2, y - hitbox/2);
  }
}