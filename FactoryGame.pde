float SCREENMULTIPLIER; //Used for zoom
float camx = 0;
float camy = 0;
float tileSize = 64;
int selectedTile;
boolean update = true;
Controller c;


ArrayList<Tile> tiles;
ArrayList<Item> items;

void setup() {

    //Define variables that dont reset after each session here
    size(768, 768, P2D);
    noSmooth();
    imgLoad();
    
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
        Tile currTile = tiles.get(i);
        currTile.display();
        if (currTile.type==1) {
            if (currTile.slot==false) {
                currTile.output(0);
                currTile.slot=true;
            }
        }
        if (currTile.type==2 && currTile.slot==true) {
            currTile.data = 1;
        }
        if (currTile.type==3) {
            currTile.data = 0;
            for (int j = tiles.size()-1; j >= 0; j--) {
                Tile detecttile = tiles.get(j);
                if (detecttile.type ==2) {
                    if (detecttile.x <=currTile.x+2 && detecttile.x >=currTile.x-2 ) {
                        if (detecttile.y <=currTile.y+2 && detecttile.y >=currTile.y-2 ) {
                            if (detecttile.data == 1) {
                                currTile.data = 1;
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
    update = false;
    
    for (int i = items.size()-1; i >= 0; i--) {
        Item currItem = items.get(i);
        currItem.push();
        currItem.display();
    }
    if (c.inventoryOpen) {
        c.displayInventory();
    }
}
