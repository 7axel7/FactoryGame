float SCREENMULTIPLIER; //Used for zoom
float camx = 0;
float camy = 0;
float tileSize = 64;
int selectedTile;
Controller c;

ArrayList<Tile> tiles;
ArrayList<Item> items;

void setup() {

  //Define variables that dont reset after each session here
  size(800, 800, P2D);
  //size(768, 768, P2D);
  frameRate(60);
  startGame();
}

void startGame() {
  //Define variables that reset after each session here
  tiles = new ArrayList<Tile>();
  items = new ArrayList<Item>();
  SCREENMULTIPLIER = 1/(768/min(float(width), float(height))); //768 by 768 is the default, zoom from theres
  c = new Controller();
  selectedTile = 0;
}

void draw() {
  background(100, 100, 100);
  for (int i = tiles.size()-1; i >= 0; i--) {
    Tile currtile = tiles.get(i);
    currtile.display();
    if (currtile.type==1) {
      currtile.output(0);
    }
    if (currtile.type==2 && currtile.slot==true) {
      currtile.data = 1;
    }
    if (currtile.type==3) {
      currtile.data = 0;
      for (int j = tiles.size()-1; j >= 0; j--) {
        Tile detecttile = tiles.get(j);
        if (detecttile.type ==2) {
          if (detecttile.x <=currtile.x+2 && detecttile.x >=currtile.x-2 ) {
            if (detecttile.y <=currtile.y+2 && detecttile.y >=currtile.y-2 ) {
              if (detecttile.data == 1) {
                currtile.data = 1;
              }
            }
          }
        }
      }
    }
  }
  if (keys[5]) {
    if (c.inventoryOpen) {
      c.click();
    } else {
      create_Tile(mouseX/SCREENMULTIPLIER, mouseY/SCREENMULTIPLIER, selectedTile, Scroll);
    }
  }
  if (c.inventoryOpen) {
    c.displayInventory();
  }
  if (keys[6]) {
    keys[6] = false;
    if (c.inventoryOpen) {
      c.inventoryOpen = false;
    } else {
      c.inventoryOpen = true;

    for (int i = items.size()-1; i >= 0; i--) {
        Item currItem = items.get(i);
        currItem.push();
        currItem.display();
    }
  }
  rectMode(CORNERS);
  fill(20, 20, 20);
  rect(0, 0, (width/2*(1/SCREENMULTIPLIER)-400)*SCREENMULTIPLIER, (height/2*(1/SCREENMULTIPLIER)+400)*SCREENMULTIPLIER);
  rect(0, 0, (width/2*(1/SCREENMULTIPLIER)+400)*SCREENMULTIPLIER, (height/2*(1/SCREENMULTIPLIER)-400)*SCREENMULTIPLIER);
  rect(width, height, (width/2*(1/SCREENMULTIPLIER)-400)*SCREENMULTIPLIER, (height/2*(1/SCREENMULTIPLIER)+400)*SCREENMULTIPLIER);
  rect(width, height, (width/2*(1/SCREENMULTIPLIER)+400)*SCREENMULTIPLIER, (height/2*(1/SCREENMULTIPLIER)-400)*SCREENMULTIPLIER);
  background(100, 100, 100);
  for (int i = tiles.size()-1; i >= 0; i--) {
    Tile currTile = tiles.get(i);
    currTile.display();
  }
  if (c.inventoryOpen) {
    c.displayInventory();
  }
  for (int i = items.size()-1; i >= 0; i--) {
    Item currItem = items.get(i);
    currItem.move();
    currItem.display();
  }
}
