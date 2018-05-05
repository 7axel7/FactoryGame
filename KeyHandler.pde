boolean[] keys = new boolean[6];

void keyPressed() {
    String whichKey = "default";
    if (key == CODED) {
        whichKey = str(keyCode);
    } else {
        whichKey = str(key);
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
    keys[5] = true;
}

void mouseReleased() {
    keys[5] = false;
}
