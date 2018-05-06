void create_Item(int x, int y, int type, int data) {
  int itemx = x;
  int itemy = y;

    Item currItem = new Item(itemx, itemy, type, data);

    items.add(currItem);
}

void create_Item(int x, int y, int type) {
  create_Item(x, y, type, 0);
}

class Item {
    int waitMove = 30;
    int x;
    int y;
    int type;
    int data;
    int direction;
    int animationx;
    int animationy;
    Tile tileMovingTo = null;
    Tile tileIn;


    Item(int x, int y, int type, int data) {
        this.x = x;
        this.y = y;
        this.type=type;
        this.data=data;
    }
    void push() {
        if (tileMovingTo == null) {
            Tile tileIn = null;
            for (int i = 0; i <= tiles.size()-1; i++) {
                if (tiles.get(i).x == this.x) {
                    if (tiles.get(i).y == this.y) {
                        if (tiles.get(i).y == this.y) {
                            tileIn = tiles.get(i);
                        }
                    }
                }
            }
            if (tileIn != null) {
                int enterx = x;
                int entery = y;

                if (tileIn.direction == 0) {
                    entery = y-1;
                }
                if (tileIn.direction == 1) {
                    enterx = x+1;
                }
                if (tileIn.direction == 2) {
                    entery = y+1;
                }
                if (tileIn.direction == 3) {
                    enterx = x-1;
                }

                Tile tileout = null;
                for (int i = 0; i <= tiles.size()-1; i++) {
                    if (tiles.get(i).x == enterx) {
                        if (tiles.get(i).y == entery) {
                            tileout = tiles.get(i);
                        }
                    }
                }
                if (tileout != null) {
                    if (tileout.slot == false) {
                        tileout.slot = true;
                        this.tileIn = tileIn;
                        tileMovingTo = tileout;
                    }
                }
            }
        } else {
            if (waitMove < 0) {
                this.x = tileMovingTo.x;
                this.y = tileMovingTo.y;
                this.tileIn.slot = false;
                tileMovingTo = null;
                waitMove = 31;
                animationx=0;
                animationy=0;
            } else {
                if (tileIn.direction==0) {
                    animationy-=2*tileSize/64;
                }
                if (tileIn.direction==1) {
                    animationx+=2*tileSize/64;
                }
                if (tileIn.direction==2) {
                    animationy+=2*tileSize/64;
                }
                if (tileIn.direction==3) {
                    animationx-=2*tileSize/64;
                }
                waitMove -= 1;
            }
        }
      }
    


    void display() {
        imageMode(CENTER);
        
        image(bBrine,(-camx+x*tileSize+tileSize/2+animationx)*SCREENMULTIPLIER, (-camy+y*tileSize+tileSize/2+animationy)*SCREENMULTIPLIER, (64)*SCREENMULTIPLIER, (64)*SCREENMULTIPLIER);
    }
}
