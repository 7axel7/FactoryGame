void create_Item(float x, float y, int type, int data) {
  int itemx = int(x/tileSize);
  int itemy = int(y/tileSize);

  Item currItem = new Item(itemx, itemy, type, data);
  items.add(currItem);
}

void create_Item(float x, float y, int type) {
  create_Item(x, y, type, 0);
}

class Item{
 int x;
 int y;
 int type;
 int data;
 
 Item(int x, int y, int type, int data) {
    this.x = x;
    this.y = y;
    this.type=type;
    this.data=data;
  }
}
