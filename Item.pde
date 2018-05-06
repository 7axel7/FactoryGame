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
    int x;
    int y;
    int type;
    int data;
    int direction;
    Tile tileIn;

    Item(int x, int y, int type, int data) {
        this.x = x;
        this.y = y;
        this.type=type;
        this.data=data;
    }
    void push() {
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
                    tileIn.slot = false;
                    this.x = tileout.x;
                    this.y = tileout.y;
                }
            }
        }
    }
    void display() {
        rectMode(CENTER);
        fill(123, 0, 123);
        rect((-camx+x)*SCREENMULTIPLIER, (-camy+y)*SCREENMULTIPLIER, (32)*SCREENMULTIPLIER, (32)*SCREENMULTIPLIER);
    }
}
