import processing.sound.*;
SoundFile song;
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
ArrayList<int[]> recipes;
PFont courier;

void setup() {
    courier = createFont("Courier New Bold",64);
    textFont(courier);
    song = new SoundFile(this, "IndustrialSwing.wav");
    song.loop();
    recipes = new ArrayList<int[]>();
    int[] recipe = new int[2]; 
    recipe[0] = 1;
    recipe[1] = 2;
    recipes.add(0, recipe);
    recipe = new int[2]; 
    recipe[0] = 0;
    recipe[1] = 0;
    recipes.add(1, recipe);
    recipe = new int[2]; 
    recipe[0] = 1;
    recipe[1] = 1;
    recipes.add(2, recipe);
    recipe = new int[2]; 
    recipe[0] = 2;
    recipe[1] = 2;
    recipes.add(3, recipe);
    recipe = new int[2]; 
    recipe[0] = 3;
    recipe[1] = 3;
    recipes.add(4, recipe);
    recipe = new int[2]; 
    recipe[0] = 4;
    recipe[1] = 4;
    recipes.add(5, recipe);
    recipe = new int[2]; 
    recipe[0] = 5;
    recipe[1] = 5;
    recipes.add(6, recipe);
    recipe = new int[2]; 
    recipe[0] = 6;
    recipe[1] = 6;
    recipes.add(7, recipe);
    recipe = new int[2]; 
    recipe[0] = 7;
    recipe[1] = 7;
    recipes.add(8, recipe);
    recipe = new int[2]; 
    recipe[0] = 8;
    recipe[1] = 8;
    recipes.add(9, recipe);
    recipe = new int[2]; 
    recipe[0] = 9;
    recipe[1] = 9;
    recipes.add(10, recipe);
    recipe = new int[2]; 
    recipe[0] = 1;
    recipe[1] = 5;
    recipes.add(11, recipe);
    recipe = new int[2]; 
    recipe[0] = 0;
    recipe[1] = 1;
    recipes.add(12, recipe);
    recipe = new int[2]; 
    recipe[0] = 0;
    recipe[1] = 2;
    recipes.add(13, recipe);
    recipe = new int[2]; 
    recipe[0] = 0;
    recipe[1] = 3;
    recipes.add(14, recipe);
    recipe = new int[2]; 
    recipe[0] = 0;
    recipe[1] = 4;
    recipes.add(15, recipe);
    recipe = new int[2]; 
    recipe[0] = 0;
    recipe[1] = 5;
    recipes.add(16, recipe);
    recipe = new int[2]; 
    recipe[0] = 0;
    recipe[1] = 6;
    recipes.add(17, recipe);
    recipe = new int[2]; 
    recipe[0] = 0;
    recipe[1] = 7;
    recipes.add(18, recipe);
    recipe = new int[2]; 
    recipe[0] = 0;
    recipe[1] = 8;
    recipes.add(19, recipe);
    recipe = new int[2]; 
    recipe[0] = 0;
    recipe[1] = 9;
    recipes.add(20, recipe);
    recipe = new int[2]; 
    recipe[0] = 1;
    recipe[1] = 2;
    recipes.add(21, recipe);
    recipe = new int[2]; 
    recipe[0] = 1;
    recipe[1] = 3;
    recipes.add(22, recipe);
    recipe = new int[2]; 
    recipe[0] = 1;
    recipe[1] = 4;

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
        updateSuccess();
        background(255, 240, 180);
        image(bGround, 384, (t%768)+384);
        image(bGround, 384, (t%768)-384);
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
        if (levelComplete) {
            fill(255, 200, 0);
            textSize(64*SCREENMULTIPLIER);
            textAlign(CENTER);
            text("Level Complete!", width/2, height*2/10);
            textSize(32*SCREENMULTIPLIER);
            text("Click to Continue", width/2, height*3/10);
            if (keys[5]) {
                keys[5] = false;
                levelComplete = false;
                for (int i = tiles.size()-1; i >= 0; i--) {
                    tiles.remove(i);
                }
                for (int i = items.size()-1; i >= 0; i--) {
                    Item currItem = items.get(i);
                    currItem.deleteMe = true;
                }
                setLevel(currLevel+1);
                
            }
        }

        fill(255, 200, 0);
        textSize(32*SCREENMULTIPLIER);
        textAlign(CENTER);
        text(tutorialText, width/2, height*7/10);
    } else {

        background(255, 255, 180);

        fill(255, 200, 0);
        image(bGround, 0, 0);
        image(logo, 1, 1);
        textSize(64*SCREENMULTIPLIER);
        textAlign(CENTER);
        text("START Game", width/2, height*3/5);
        text("Sandbox Mode", width/2, height*4/5);
        if (keys[5]) {
            if (mouseX<width*2/3&&mouseX>width*1/3) {
                if (mouseY<width*7/10&&mouseY>width*5/10) {
                    setLevel(1);
                    titleScreen = 0;
                }
            }
            if (mouseX<width*2/3&&mouseX>width*1/3) {
                if (mouseY<width*9/10&&mouseY>width*7/10) {  
                    titleScreen = 0;
                }
            }
        }
    }
}
