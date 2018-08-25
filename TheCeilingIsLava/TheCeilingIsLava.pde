Player player;
ArrayList<Platform> platforms;
long startTime, lastSpawn;
Lava lava;
PImage bkgd;
PImage menu;
PImage button_unpressed;
PImage button_pressed;
boolean gameStarted = false;
int score = 0;

void setup() { //happens once at the beginning
  size(600, 900);
  bkgd = loadImage("bkgd.png");
  menu = loadImage("menu.png");
  button_unpressed = loadImage("button_unpressed.png");
  button_pressed = loadImage("button_pressed.png");
  player = new Player();
  platforms = new ArrayList<Platform>();
  lava = new Lava();
  startTime = lastSpawn = System.currentTimeMillis();
  spawnPlatPair();
}

void draw() { //happens 60 times per second
  if (gameStarted) {
    background(bkgd);
    updatePlatforms();
    lava.update();
    player.update(platforms, lava);
    if ((System.currentTimeMillis() - lastSpawn)/1000  >= (3/((System.currentTimeMillis() - startTime)/15000 + 1) + 1)) {
      spawnPlatPair();
      lastSpawn = System.currentTimeMillis();
    }
    displayScore();
    if (player.gameover) displayGameOverScreen();
  } else {
    displayMainMenu();
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
    } else
      curr.update(lava.y);
  }
}

void spawnPlatPair() { //spawns 2 platforms with a gap
  float gapSize = 120/((System.currentTimeMillis() - startTime)/30000 + 1) + 60;
  float gapX = 160 + random(width - 360);
  platforms.add(new Platform(0, 900, gapX, true));
  platforms.add(new Platform(gapX + gapSize, 900, width, false));
}

void displayMainMenu() {
  background(menu);
  if (mousePressed && mouseX > width/2 - 100 && mouseX < width/2 + 100 && mouseY > height - 325 && mouseY < height - 125) {
    image(button_pressed, width/2 - 100, height - 225);
    startTime = System.currentTimeMillis();
    gameStarted = true;
  } else 
  image(button_unpressed, width/2 - 100, height - 225);
  if (score > 0) {
    textSize(30);
    fill(255);
    text("Score: " + score, width/2 - 150, height - 20);
  }
}

void displayScore() {
  textSize(30);
  fill(255);
  text("Score: " + (int)(System.currentTimeMillis()-startTime)/13, width - 220, height - 20);
}

void displayGameOverScreen() {
  gameStarted = false;
  score = (int)(System.currentTimeMillis()-startTime)/13;
  menu=loadImage("gameover.png");
}