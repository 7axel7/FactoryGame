float SCREENMULTIPLIER; //Used for zoom

void setup() {
    //Define variables that dont reset after each session here
    size(800, 800, P2D);
    frameRate(60);
    startGame();
}

void startGame() {
    //Define variables that reset after each session here
    SCREENMULTIPLIER = 1/(800/max(float(width), float(height))); //800 by 800 is the default, zoom from there
    
}

void draw() {
    background(100, 100, 100);
}
