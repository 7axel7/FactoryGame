void create_Item(int x, int y, int type, int data) {
    float itemx = x*tileSize+tileSize/2;
    float itemy = y*tileSize+tileSize/2;

    Item currItem = new Item(itemx, itemy, type, data);
    items.add(currItem);
}

void create_Item(int x, int y, int type) {
    create_Item(x, y, type, 0);
}

class Item {
    float x;
    float y;
    int type;
    int data;
    int direction;

    Item(float x, float y, int type, int data) {
        this.x = x;
        this.y = y;
        this.type=type;
        this.data=data;
    }
    void move() {
        
    }
    void display() {
        rectMode(CENTER);
        fill(123, 0, 123);
        rect((-camx+x)*SCREENMULTIPLIER, (-camy+y)*SCREENMULTIPLIER, (32)*SCREENMULTIPLIER, (32)*SCREENMULTIPLIER);
    }
    void pushed() {
        for (int i = 0; i <= tiles.size()-1; i++) {
            if (tiles.get(i).type == 0) {
                Tile currtile = tiles.get(i);
                float xcenter = currtile.x*tileSize;
                float ycenter = currtile.y*tileSize;
                if (this.x > xcenter-(40*SCREENMULTIPLIER) && this.x < xcenter+(40*SCREENMULTIPLIER)) {
                    if (this.y > ycenter-(40*SCREENMULTIPLIER) && this.y < ycenter+(40*SCREENMULTIPLIER)) {
                        this.direction = currtile.direction;
                    }
                }
            }
        }
    }
}
