void create_Tile(float x, float y, int type, int direction, int data) {

    int tilex = int(x/tileSize);
    int tiley = int(y/tileSize);
    boolean fail = false;
    for (int i = tiles.size()-1; i >= 0; i--) {
        Tile oldtile = tiles.get(i);
        if (oldtile.x==tilex) {
            if (oldtile.y==tiley) {
                fail = true;
            }
        }
    }
    if (fail == false) {
        Tile currtile = new Tile(tilex, tiley, type, direction, data);
        tiles.add(currtile);
    }

}

void create_Tile(float x, float y, int type, int direction) {
    create_Tile(x, y, type, direction, 0);
}

class Tile {
    int x;
    int y;
    int type;
    int direction;
    int data;
    boolean slot;
    boolean slot2;


    Tile(int x, int y, int type, int direction, int data) {
        this.x = x;
        this.y = y;
        this.type=type;
        this.direction=direction;
        this.data=data;
    }
    void display() {
        rectMode(CORNER);
        if (type == 0) {
            fill(0, 0, 0);
        } else if (type == 1) {
            fill(0, 255, 0);
        }
        rect((-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
        fill(255, 0, 0);
        int tempx = 0;
        int tempy = 0;
        if (direction==0) {
            tempy += -16*SCREENMULTIPLIER;
        }
        if (direction==1) {
            tempx += 16*SCREENMULTIPLIER;
        }
        if (direction==2) {
            tempy += 16*SCREENMULTIPLIER;
        }
        if (direction==3) {
            tempx += -16*SCREENMULTIPLIER;
        }
        rectMode(CENTER);
        rect((-camx+x*tileSize+tempx+32)*SCREENMULTIPLIER, (-camy+y*tileSize+tempy+32)*SCREENMULTIPLIER, (tileSize/2)*SCREENMULTIPLIER, (tileSize/2)*SCREENMULTIPLIER);    
    }
    void output(int type, int data){
      create_Item(this.x, this.y, type, data);
    }
 
    void output(int type){
      output(type,0);
    }
}
