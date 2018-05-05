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
    SCREENMULTIPLIER = 1/(768/min(float(width), float(height))); //768 by 768 is the default, zoom from theres
    c = new Controller();
    selectedTile = 0;
}

void draw() {
    background(100, 100, 100);
    for (int i = tiles.size()-1; i >= 0; i--) {
        Tile currtile = tiles.get(i);
        currtile.display();
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
        Tile currtile = tiles.get(i);
        currtile.display();
    }
    if (c.inventoryOpen) {
        c.displayInventory();
    }
}
