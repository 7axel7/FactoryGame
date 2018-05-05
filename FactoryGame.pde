float SCREENMULTIPLIER; //Used for zoom
float camx = 0;
float camy = 0;
float tileSize = 64;
Controller c;

ArrayList<Tile> tiles;

void setup() {

  //Define variables that dont reset after each session here
  size(768, 768, P2D);
  frameRate(60);
  startGame();
}

void startGame() {
  //Define variables that reset after each session here
  tiles = new ArrayList<Tile>();
  SCREENMULTIPLIER = 1/(768/max(float(width), float(height))); //768 by 768 is the default, zoom from theres
  c = new Controller();
}

void draw() {
  background(100, 100, 100);
  for (int i = tiles.size()-1; i >= 0; i--) {
    Tile currtile = tiles.get(i);
    currtile.display();
  }
  if (keys[5]) {
    create_Tile(mouseX*SCREENMULTIPLIER, mouseY*SCREENMULTIPLIER, 0, 0);
  }
  if (keys[0]) {
    create_Tile(mouseX*SCREENMULTIPLIER, mouseY*SCREENMULTIPLIER, 1, 0);
  }
  if (c.inventoryOpen) {
    c.displayInventory();
  }
}
