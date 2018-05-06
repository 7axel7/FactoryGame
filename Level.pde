int[] inv = new int[6];
void setLevel (int level){
  if (level==1){
    create_Tile(5*tileSize,6*tileSize,1,1,0);
    create_Tile(6*tileSize,5*tileSize,2,2,0);
    inv[0] = 1;
    c.setInventory(inv);
  }
}
