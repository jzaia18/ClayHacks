Player player;
ArrayList<Platform> platforms;

void setup() { //happens once at the beginning
  size(600, 900);
  player = new Player();
  platforms = new ArrayList<Platform>();
  platforms.add(new Platform());
}

void draw() { //happens 60 times per second
  background(255);
  for (Platform each: platforms) {
    each.update();
  }
  player.update();
}

void keyPressed() {
  if (keyCode == LEFT || key == 97 || key == 65)
    player.dx -= 0.1;
  else if (keyCode == RIGHT || key == 100 || key == 68)
    player.dx += 0.1;
}  