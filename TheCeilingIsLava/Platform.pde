class Platform {
  float x, x2, y, dy;
  float w, h;
  boolean leftSide; //left vs right
  PImage clay_tile_endright = loadImage("clay_tile_endright.png");
  PImage clay_tile_endleft = loadImage("clay_tile_endleft.png");
  PImage clay_tile = loadImage("clay_tile.png");
  PImage brick_tile_endright = loadImage("brick_tile_endright.png");
  PImage brick_tile_endleft = loadImage("brick_tile_endleft.png");
  PImage brick_tile = loadImage("brick_tile.png");


  Platform(float x, float y, float x2, boolean side) { 
    this.x = x;
    this.y = y;
    this.x2 = x2;
    this.w = x2 - x;
    this.h = 25;
    this.dy = -3;
    leftSide = side;
  };

  void update(float lavaHeight) {
    y += dy;
    display(lavaHeight);
  }

  void display(float lavaHeight) {
    if (y > lavaHeight) { //clay
      if (leftSide) {
        image(clay_tile_endright, x2 - 50, y);
        float i = x2 - 30;
        while (i > 0) { 
          image(clay_tile, i - 50, y);
          i -= 30;
        }
      } else {
        image(clay_tile_endleft, x, y);
        float i = x + 30;
        while (i < width) { 
          image(clay_tile, i, y);
          i += 30;
        }
      }
    } else { //brick
      if (leftSide) {
        image(brick_tile_endright, x2 - 50, y);
        float i = x2 - 30;
        while (i > 0) { 
          image(brick_tile, i - 50, y);
          i -= 30;
        }
      } else {
        image(brick_tile_endleft, x, y);
        float i = x + 30;
        while (i < width) { 
          image(brick_tile, i, y);
          i += 30;
        }
      }
    }
  }
}