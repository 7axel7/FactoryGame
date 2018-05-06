int[] outputs = new int[10];
int[] success = new int[10];
int currLevel = 0;
boolean levelComplete = false;
String tutorialText = "";
void setLevel (int level) {
    c.clearInventory();

    if (level==1) {
        create_Tile(5*tileSize, 6*tileSize, 1, 1, 0);
        create_Tile(6*tileSize, 5*tileSize, 2, 2, 0);
        c.inventory[0] = 1;
        success[0] = 5;
        tutorialText = "Welcome to Yipes Pipes! \n Press E to exit the inventory. \n Click to place a tile!";
    } else if (level==2) {
        for (int i = 0; i <= 4; i++) {
            for (int j = 0; j <= 4; j++) {
                create_Tile(i*tileSize, j*tileSize, 0, j%4, 0);
            }
        }
        tutorialText = "You can use the Right Mouse Button\n to remove tiles and place them in your inventory.";
        create_Tile(5*tileSize, 0*tileSize, 1, 2, 0);
        create_Tile(5*tileSize, 8*tileSize, 2, 0, 0);

        c.inventory[0] = 0;
        success[0] = 5;
    }else if (level==2) {
        for (int i = 0; i <= 4; i++) {
            for (int j = 0; j <= 4; j++) {
                create_Tile(i*tileSize, j*tileSize, 0, j%4, 0);
            }
        }
        tutorialText = "Tiles craft garbo barbs.";
        create_Tile(5*tileSize, 0*tileSize, 1, 2, 0);
        create_Tile(5*tileSize, 1*tileSize, 5, 2, 0);
        create_Tile(5*tileSize, 8*tileSize, 2, 0, 0);

        c.inventory[0] = 10;
        success[0] = 5;
        
    currLevel = level;
}
void outputIncrease(int type) {
    outputs[type] ++;
}
void updateSuccess() {

    for (int i = 0; i <= success.length-1; i++) {
        if (outputs[i] != success[i]) {
            return;
        }
    }
    if (levelComplete == false) {
        levelComplete = true;
        success[0] = 0;

    }
}
