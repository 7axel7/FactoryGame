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
        tutorialText = "You can use the Right Mouse Button \n to remove tiles and place them \n in your inventory. \n Press 'R' or use the scroll wheel \n to rotate your tile.";
        create_Tile(5*tileSize, 0*tileSize, 1, 2, 0);
        create_Tile(5*tileSize, 8*tileSize, 2, 0, 0);

        c.inventory[0] = 0;
        success[0] = 5;
    } else if (level==3) {
        for (int i = 0; i <= 11; i++) {
            create_Tile(0*tileSize, i*tileSize, 1, 1, 0);
        }
        tutorialText = "Crafter Tiles combine 2 items \n to create one new item.";
        create_Tile(5*tileSize, 0*tileSize, 1, 2, 0);
        create_Tile(5*tileSize, 1*tileSize, 5, 2, 0);
        create_Tile(5*tileSize, 8*tileSize, 2, 0, 0);

        c.inventory[0] = 10;
        success[0] = 0;
        success[1] = 5;
    } else if (level==4) {
        for (int i = 0; i <= 11; i++) {
            create_Tile(0*tileSize, i*tileSize, 0, 0);
        }
        tutorialText = "Tiles craft moar garbo barbos.";
        create_Tile(5*tileSize, 0*tileSize, 5, 0, 0);
        create_Tile(5*tileSize, 1*tileSize, 5, 0, 0);
        create_Tile(5*tileSize, 8*tileSize, 5, 0, 0);
        create_Tile(5*tileSize, 9*tileSize, 1, 0, 0);


        c.inventory[0] = 40;
        c.inventory[2] = 10;

        success[0] = 0;
        success[1] = 0;
        success[2] = 5;
    }else if (level==4) {
        for (int i = 0; i <= 11; i++) {
            create_Tile(i*tileSize, 0*tileSize, 1, 0);
        }
        create_Tile(5*tileSize, 5*tileSize, 1, 1);
        create_Tile(6*tileSize, 5*tileSize, 0, 1);
        create_Tile(7*tileSize, 5*tileSize, 0, 2);
        create_Tile(7*tileSize, 6*tileSize, 0, 2);
        create_Tile(7*tileSize, 7*tileSize, 0, 3);
        create_Tile(6*tileSize, 7*tileSize, 0, 3);
        create_Tile(5*tileSize, 7*tileSize, 0, 3);
        create_Tile(4*tileSize, 7*tileSize, 5, 0);
        create_Tile(4*tileSize, 6*tileSize, 0, 0);
        
        tutorialText = "In Russia, garbo barbos craft you.";
        
        create_Tile(5*tileSize, 0*tileSize, 5, 0, 0);
        create_Tile(5*tileSize, 1*tileSize, 5, 0, 0);
        create_Tile(5*tileSize, 8*tileSize, 5, 0, 0);
        create_Tile(5*tileSize, 9*tileSize, 1, 0, 0);


        c.inventory[0] = 40;
        c.inventory[2] = 10;
        c.inventory[1] = 40;
        c.inventory[2] = 10;
        c.inventory[3] = 40;
        c.inventory[4] = 10;
        c.inventory[5] = 40;
        c.inventory[6] = 10;
        c.inventory[7] = 40;
        c.inventory[8] = 10;

        success[0] = 0;
        success[1] = 0;
        success[2] = 5;
    }
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
        for (int i = 0; i <= outputs.length-1; i++) {
            outputs[i] = 0;
        }
    }
}
