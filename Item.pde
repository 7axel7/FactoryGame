void create_Item(float x, float y, int type, int data) {
  float itemx = x*tileSize+tileSize/2;
  float itemy = y*tileSize+tileSize/2;

  Item currItem = new Item(itemx, itemy, type, data);
  items.add(currItem);
}

void create_Item(float x, float y, int type) {
  create_Item(x, y, type, 0);
}

class Item{
 float x;
 float y;
 int type;
 int data;
 
 Item(float x, float y, int type, int data) {
    this.x = x;
    this.y = y;
    this.type=type;
    this.data=data;
  }
}
