class Controller {
  boolean inventoryOpen = true;
  int[] inventory = new int[60];
  Controller() {
    this.inventory[0] = 80;
    this.inventory[1] = 20;
    this.inventory[2] = 12;
    this.inventory[3] = 13;
    this.inventory[4] = 14;
    this.inventory[5] = 25;
    this.inventory[8] = 16;
    this.inventory[13] = 17;
    this.inventory[26] = 18;
  }

  void displayInventory() {
    rectMode(CENTER);
    fill(256, 256, 256);
    rect((-camx+width/2), (-camy+height/2), (610)*SCREENMULTIPLIER, (610)*SCREENMULTIPLIER);
    for (int i = 0; i <= inventory.length-1; i++) {
      fill(111, 256, 256);
      if (inventory[i] > 0) {
        if (selectedTile == i) {
          fill(256, 111, 256);
        }
        rect((-camx+width/2)-(300-30)*SCREENMULTIPLIER+(i%10*60)*SCREENMULTIPLIER, (-camy+height/2)-(300-30)*SCREENMULTIPLIER+(int(i/10)*60)*SCREENMULTIPLIER, (40)*SCREENMULTIPLIER, (40)*SCREENMULTIPLIER);
        textAlign(CENTER);
        textSize(32*SCREENMULTIPLIER);
        fill(0, 0, 0);
        text(inventory[i], (-camx+width/2)-(300-30)*SCREENMULTIPLIER+(i%10*60)*SCREENMULTIPLIER, (-camy+height/2)-(300-40)*SCREENMULTIPLIER+(int(i/10)*60)*SCREENMULTIPLIER);
      }
    }
  }
  void click() {
    for (int i = 0; i <= inventory.length-1; i++) {
      if (inventory[i] > 0) {
        float xcenter = (-camx+width/2)-(300-30)*SCREENMULTIPLIER+(i%10*60)*SCREENMULTIPLIER;
        float ycenter = (-camy+height/2)-(300-30)*SCREENMULTIPLIER+(int(i/10)*60)*SCREENMULTIPLIER;
        if (mouseX > xcenter-(40*SCREENMULTIPLIER) && mouseX < xcenter+(40*SCREENMULTIPLIER)) {
          if (mouseY > ycenter-(40*SCREENMULTIPLIER) && mouseY < ycenter+(40*SCREENMULTIPLIER)) {
            selectedTile = i;
          }
        }
      }
    }
  }
}
