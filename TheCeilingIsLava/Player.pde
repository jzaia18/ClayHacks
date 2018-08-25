class Player {
  float x, y, dx, dy;
  float hitbox;
  boolean secondWind;
  long startInvulnTime;

  Player() {
    x = width/2;
    y = height/3;
    hitbox = 50;
    dy = 3;
    secondWind = false;
  }

  void update(ArrayList<Platform> platforms, float lavaHeight) {
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
    else if (y + hitbox +5 < height)
      y += dy; //debuggin!
    if (y - hitbox/2 < lavaHeight) {
      if (!secondWind) {
        secondWind = true;
        startInvulnTime = System.currentTimeMillis();
      } else if (System.currentTimeMillis() - startInvulnTime > 4000) {
        stop();
      }
    }

    display();
  }

  void display() {
    fill(0, 100, 160);
    rectMode(CENTER);
    rect(x, y, hitbox, hitbox);
  }
}