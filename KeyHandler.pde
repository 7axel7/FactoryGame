boolean[] keys = new boolean[9];

void keyPressed() {
  String whichKey = "default";
  if (key == CODED) {
    whichKey = str(keyCode);
  } else {
    whichKey = str(key);
  }

  if (whichKey.equals("e") || whichKey.equals("i")) {
    keys[6] = true;
  }
  if (whichKey.equals("r")) { //R for Rotate
    Scroll += 1;
    if (Scroll>3) {
      Scroll =0;
    } else if (Scroll<0) {
      Scroll = 3;
    }
  }
  if (whichKey.equals("w") || whichKey.equals("38")) {
    keys[0] = true;
  } else if (whichKey.equals("s") || whichKey.equals("40")) {
    keys[1] = true;
  } else if (whichKey.equals("a") || whichKey.equals("37")) {
    keys[2] = true;
  } else if (whichKey.equals("d") || whichKey.equals("39")) {
    keys[3] = true;
  } else if (whichKey.equals(" ")) {
    keys[4] = true;
  }
}

void keyReleased() {
  String whichKey = "default";
  if (key == CODED) {
    whichKey = str(keyCode);
  } else {
    whichKey = str(key);
  }
  if (whichKey.equals("e") || whichKey.equals("i")) {
    keys[6] = false;
  }
  if (whichKey.equals("w") || whichKey.equals("38")) {
    keys[0] = false;
  } else if (whichKey.equals("s") || whichKey.equals("40")) {
    keys[1] = false;
  } else if (whichKey.equals("a") || whichKey.equals("37")) {
    keys[2] = false;
  } else if (whichKey.equals("d") || whichKey.equals("39")) {
    keys[3] = false;
  } else if (whichKey.equals(" ")) {
    keys[4] = false;
  }
}

void mousePressed() {
  if (mouseButton == RIGHT){
  keys[7] = true;
  } else {
  keys[5] = true;
  }
}

void mouseReleased() {
  if (mouseButton == RIGHT){
  keys[7] = false;
  } else {
  keys[5] = false;
  }
}

int Scroll = 0; // 0=up, 1=right, 2=down, 3=left
void mouseWheel(MouseEvent scroll) {
  Scroll += scroll.getCount();
  if (Scroll>3) {
    Scroll =0;
  } else if (Scroll<0) {
    Scroll = 3;
  }
  //println(Scroll);
}
