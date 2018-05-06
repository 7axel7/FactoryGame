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
ArrayList<int[]> recipies;


void setup() {
    recipies = new ArrayList<int[]>();
    int[] recipie = new int[2]; 
    recipie[0] = 1;
    recipie[1] = 2;
    recipies.add(0, recipie);
    recipie = new int[2]; 
    recipie[0] = 0;
    recipie[1] = 0;
    recipies.add(1, recipie);
    recipie = new int[2]; 
    recipie[0] = 1;
    recipie[1] = 1;
    recipies.add(2, recipie);
    recipie = new int[2]; 
    recipie[0] = 2;
    recipie[1] = 2;
    recipies.add(3, recipie);
    recipie = new int[2]; 
    recipie[0] = 3;
    recipie[1] = 3;
    recipies.add(4, recipie);
    recipie = new int[2]; 
    recipie[0] = 4;
    recipie[1] = 4;
    recipies.add(5, recipie);
    recipie = new int[2]; 
    recipie[0] = 5;
    recipie[1] = 5;
    recipies.add(6, recipie);
    recipie = new int[2]; 
    recipie[0] = 6;
    recipie[1] = 6;
    recipies.add(7, recipie);
    recipie = new int[2]; 
    recipie[0] = 7;
    recipie[1] = 7;
    recipies.add(8, recipie);
    recipie = new int[2]; 
    recipie[0] = 8;
    recipie[1] = 8;
    recipies.add(9, recipie);
    recipie = new int[2]; 
    recipie[0] = 9;
    recipie[1] = 9;
    recipies.add(10, recipie);
    recipie = new int[2]; 
    recipie[0] = 1;
    recipie[1] = 5;
    recipies.add(11, recipie);
    recipie = new int[2]; 
    recipie[0] = 0;
    recipie[1] = 1;
    recipies.add(12, recipie);
    recipie = new int[2]; 
    recipie[0] = 0;
    recipie[1] = 2;
    recipies.add(13, recipie);
    recipie = new int[2]; 
    recipie[0] = 0;
    recipie[1] = 3;
    recipies.add(14, recipie);
    recipie = new int[2]; 
    recipie[0] = 0;
    recipie[1] = 4;
    recipies.add(15, recipie);
    recipie = new int[2]; 
    recipie[0] = 0;
    recipie[1] = 5;
    recipies.add(16, recipie);
    recipie = new int[2]; 
    recipie[0] = 0;
    recipie[1] = 6;
    recipies.add(17, recipie);
    recipie = new int[2]; 
    recipie[0] = 0;
    recipie[1] = 7;
    recipies.add(18, recipie);
    recipie = new int[2]; 
    recipie[0] = 0;
    recipie[1] = 8;
    recipies.add(19, recipie);
    recipie = new int[2]; 
    recipie[0] = 0;
    recipie[1] = 9;
    recipies.add(20, recipie);
    recipie = new int[2]; 
    recipie[0] = 1;
    recipie[1] = 2;
    recipies.add(21, recipie);
    recipie = new int[2]; 
    recipie[0] = 1;
    recipie[1] = 3;
    recipies.add(22, recipie);
    recipie = new int[2]; 
    recipie[0] = 1;
    recipie[1] = 4;

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
                if (tilex==tiles.get(i).x&&tiley==tiles.get(i).y) {
                    c.inventory[tiles.get(i).type] += 1;
                    tiles.get(i).direction = -1;
                    tiles.remove(i);
                    update = true;
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
            currTile.power = true;
            if (currTile.type==1) {
                if (currTile.slot==false) {
                    currTile.output(0);
                    currTile.slot=true;
                }
            }
            if (currTile.type==5) {
                currTile.craft();
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
