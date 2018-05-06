int[] outputs = new int[10];
int[] success = new int[10];
int[] inv = new int[6];
int currLevel = 0;
void setLevel (int level){
  if (level==1){
    create_Tile(5*tileSize,6*tileSize,1,1,0);
    create_Tile(6*tileSize,5*tileSize,2,2,0);
    inv[0] = 1;
    c.setInventory(inv);
    success[0] = 5;
  }
  currLevel = level;
}
void outputIncrease(int type){
  outputs[type] ++;
}
void updateSuccess(){
  for (int i = 0; i <= success.length-1; i++) {
    if (outputs[i] != success[i]){
    return;
    }
  }
  println("level complete.");
  setLevel(currLevel+1);
}
