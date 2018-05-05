void create_Tile(float x, float y, int type, int direction, int data) {
  int tilex = int(x/tileSize);
  int tiley = int(y/tileSize);

  Tile currtile = new Tile(tilex, tiley, type, direction, data);
  tiles.add(currtile);
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
  }
}
