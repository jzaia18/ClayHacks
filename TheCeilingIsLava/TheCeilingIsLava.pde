Player player;
ArrayList<Platform> platforms;
long startTime, lastSpawn;
Lava lava;

void setup() { //happens once at the beginning
  size(600, 900);
  player = new Player();
  platforms = new ArrayList<Platform>();
  lava = new Lava();
  startTime = lastSpawn = System.currentTimeMillis();
  spawnPlatPair();
}

void draw() { //happens 60 times per second
  background(255);
  updatePlatforms();
  lava.update();
  player.update(platforms, lava.y);
  if ((System.currentTimeMillis() - lastSpawn)/1000  >= 3) { //spawn every 3 secs
   spawnPlatPair();
   lastSpawn = System.currentTimeMillis();
  }
}

void keyPressed() {
  if (keyCode == LEFT || key == 97 || key == 65)
    player.dx -= 0.15;
  else if (keyCode == RIGHT || key == 100 || key == 68)
    player.dx += 0.15;
}  

void updatePlatforms() {
  for (int i = 0; i < platforms.size(); i++) {
    Platform curr = platforms.get(i);
    if (curr.y < 0) {
      platforms.remove(i);
      i--;
    }
    else
      curr.update();
  }
}

void spawnPlatPair() { //spawns 2 platforms with a gap
  float gapSize = 120/((System.currentTimeMillis() - startTime)/30000 + 1) + 60;
  float gapX = 160 + random(width - 320);
  platforms.add(new Platform(0, 900, gapX));
  platforms.add(new Platform(gapX + gapSize, 900, width));
}