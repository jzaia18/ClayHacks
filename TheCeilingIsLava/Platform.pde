class Platform {
 float x, y, dy;
 float w, h;
  
 Platform() {
   x = 400;
   y = 400;
   w = 200;
   h = 25;
 };
 
 void update() {
   move();
   display();
 }
 
 void move() {
 }
 
 void display() {
   rectMode(CENTER);
   rect(x, y, w, h);
 }
}