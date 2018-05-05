float SCREENMULTIPLIER; //Used for zoom
float camx = 0;
float camy = 0;
float tileSize = 64;

ArrayList<Tile> tiles;

void setup() {
    
    //Define variables that dont reset after each session here
    size(800, 800, P2D);
    frameRate(60);
    startGame();
}

void startGame() {
    //Define variables that reset after each session here
    tiles = new ArrayList<Tile>();
    SCREENMULTIPLIER = 1/(800/max(float(width), float(height))); //800 by 800 is the default, zoom from there
    create_Tile(64,64,0);
}

void draw() {
    background(100, 100, 100);
    for (int i = tiles.size()-1; i >= 0; i--) {
        Tile currtile = tiles.get(i);
        currtile.display();
    }
    if (keys[5]){
    create_Tile(mouseX,mouseY,0);
    }
}
