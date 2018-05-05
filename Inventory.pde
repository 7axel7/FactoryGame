class Controller {
    boolean inventoryOpen = true;
    Controller() {
    }
    
    void displayInventory(){
        rectMode(CENTER);
        fill(256, 256, 256);
        rect((-camx+384)*SCREENMULTIPLIER, (-camy+384)*SCREENMULTIPLIER, (600)*SCREENMULTIPLIER, (600)*SCREENMULTIPLIER);
    
    
    }
}
