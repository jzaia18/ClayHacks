class Platform {
 float x, x2, y, dy;
 float w, h;
  
 Platform(float x, float y, float x2) { 
   this.x = x;
   this.y = y;
   this.x2 = x2;
   this.w = x2 - x;
   this.h = 25;
   this.dy = -3;
 };
 
 void update() {
   move();
   display();
 }
 
 void move() {
   y += dy;
 }
 
 void display() {
   rectMode(CORNERS);
   fill(150);
   rect(x, y, x2, y + h);
 }
}