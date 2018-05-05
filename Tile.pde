void create_Tile(float x, float y, int type, float data) {
    int tilex = int(x/tileSize);
    int tiley = int(y/tileSize);

    Tile currtile = new Tile(tilex, tiley, type, data);
    tiles.add(currtile);
}

void create_Tile(float x, float y, int type) {
    create_Tile(x,y,type,0);
}

class Tile {
    float x;
    float y;
    int type;
    float data;

    Tile(int x, int y, int type, float data) {
        this.x = x;
        this.y = y;
        this.type=type;
        this.data=data;
    }
    void display() {
        rectMode(CORNER);
        fill(0, 0, 0);
        rect((-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
    }
}
