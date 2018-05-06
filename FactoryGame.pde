float SCREENMULTIPLIER; //Used for zoom
float camx = 0;
float camy = 0;
float tileSize = 64;
int selectedTile;
boolean update = true;
Controller c;
int t = 0;
int titleScreen = 1;

ArrayList<Tile> tiles;
ArrayList<Item> items;

void setup() {

    //Define variables that dont reset after each session here
    size(768, 768, P2D);
    ((PGraphicsOpenGL)g).textureSampling(3);
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
    if (titleScreen == 0) {
        t++;
        background(100, 100, 100);
        rectMode(CORNERS);
        fill(20, 20, 20);
        rect(0, 0, (width/2*(1/SCREENMULTIPLIER)-400)*SCREENMULTIPLIER, (height/2*(1/SCREENMULTIPLIER)+400)*SCREENMULTIPLIER);
        rect(0, 0, (width/2*(1/SCREENMULTIPLIER)+400)*SCREENMULTIPLIER, (height/2*(1/SCREENMULTIPLIER)-400)*SCREENMULTIPLIER);
        rect(width, height, (width/2*(1/SCREENMULTIPLIER)-400)*SCREENMULTIPLIER, (height/2*(1/SCREENMULTIPLIER)+400)*SCREENMULTIPLIER);
        rect(width, height, (width/2*(1/SCREENMULTIPLIER)+400)*SCREENMULTIPLIER, (height/2*(1/SCREENMULTIPLIER)-400)*SCREENMULTIPLIER);
        for (int i = tiles.size()-1; i >= 0; i--) {
            Tile currTile = tiles.get(i);
            currTile.display();
        }
        update = false;
        if (c.inventoryOpen) {
            c.displayInventory();
        }
        for (int i = items.size()-1; i >= 0; i--) {
            Item currItem = items.get(i);
            currItem.push();
            currItem.display();
            if (currItem.deleteMe == true) {
                items.remove(i);
            }
        }
        if (keys[7]) {
            int tilex = int(mouseX/tileSize);
            int tiley = int(mouseY/tileSize);
            for (int i = tiles.size()-1; i >= 0; i--) {
                if (tilex==tiles.get(i).x&&tiley==tiles.get(i).y){
                    c.inventory[tiles.get(i).type] += 1;
                    tiles.remove(i);
                    
                }
            }
        }

        if (keys[5]) {
            if (c.inventoryOpen) {
                c.click();
            } else {
                if (c.inventory[selectedTile] > 0) {
                    create_Tile(mouseX/SCREENMULTIPLIER, mouseY/SCREENMULTIPLIER, selectedTile, Scroll);
                }
            }
        }

        for (int i = tiles.size()-1; i >= 0; i--) {
            Tile currTile = tiles.get(i);
            currTile.display();

            if (currTile.type==1) {
                if (currTile.slot==false) {
                    currTile.output(1);
                    currTile.slot=true;
                }
            }
            if (currTile.type==5) {
                currTile.craftCheck();
            }

            if (currTile.type==3 && currTile.slot==true) {
                currTile.data = 1;
            }
            if (currTile.type==4) {
                currTile.updateActivator();
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
    } else {
        fill(0, 102, 153);
        image(logo, 1, 1);
        textSize(64*SCREENMULTIPLIER);
        textAlign(CENTER);
        text("START Game", width/2, height*3/5);
        if (keys[5]) {
            if (mouseX<width*2/3&&mouseX>width*1/3) {
                if (mouseY<width*2/3&&mouseY>width*1/3) {
                    titleScreen = 0;
                }
            }
        }
    }
}
