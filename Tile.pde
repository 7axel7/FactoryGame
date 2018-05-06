void create_Tile(float x, float y, int type, int direction, int data) { // Type: 0 = Pipe, 1 = Inputter, 2 = Goal, 3 = Detector, 4 = Activator

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
        update = true;
        c.inventory[selectedTile]-=1;
        Tile currtile = new Tile(tilex, tiley, type, direction, data);
        tiles.add(currtile);
    }
}

void create_Tile(float x, float y, int type, int direction) {
    create_Tile(x, y, type, direction, 0);
}

class Tile {
    boolean[] connections = new boolean[4];
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
        if (update == true) {
            updateConnections();
        }
        imageMode(CORNER);
        // 0=up, 1=right, 2=down, 3=left
        //rect((-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
        if (type==0) {
            if (connections[0] && connections[1] && connections[2] && connections[3]) {
                tint(255, 63);
                image(crossBody, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                tint(255, 255);
                image(crossCage, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
            } else if (connections[0] && connections[1] == false && connections[2] && connections[3] == false) {
                tint(255, 63);
                image(vPipeBody, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                tint(255, 255);
                image(vPipeCage, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
            } else if (connections[0] && connections[1]&& connections[2] == false  && connections[3] == false) {
                tint(255, 63);
                image(neCurveBody, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                tint(255, 255);
                image(neCurveCage, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
            } else if (connections[0] && connections[1]==false&& connections[2] == false  && connections[3]) {
                tint(255, 63);
                image(nwCurveBody, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                tint(255, 255);
                image(nwCurveCage, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
            } else if (connections[0]==false && connections[1]&& connections[2]  && connections[3] == false) {
                tint(255, 63);
                image(seCurveBody, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                tint(255, 255);
                image(seCurveCage, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
            } else if (connections[0] == false && connections[1] == false && connections[2]  && connections[3]) {
                tint(255, 63);
                image(swCurveBody, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                tint(255, 255);
                image(swCurveCage, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
            } else if (connections[0] == false && connections[1]&& connections[2]&&connections[3]) {
                tint(255, 63);
                image(xNTBody, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                tint(255, 255);

                image(xNTCage, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
            } else if (connections[0]&& connections[1]&& connections[2] == false &&connections[3]) {
                tint(255, 63);
                image(xSTBody, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                tint(255, 255);

                image(xSTCage, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
            } else if (connections[0]&& connections[1]&& connections[2] == false &&connections[3]) {
                tint(255, 63);
                image(xSTBody, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                tint(255, 255);

                image(xSTCage, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
            } else if (connections[0]&& connections[1] == false && connections[2]&&connections[3]) {
                tint(255, 63);
                image(xETBody, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                tint(255, 255);

                image(xETCage, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
            } else if (connections[0]&& connections[1]&& connections[2]&&connections[3] == false ) {
                tint(255, 63);
                image(xWTBody, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                tint(255, 255);
                image(xWTCage, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
            } else if (connections[0]||connections[2]) {
                tint(255, 63);
                image(vPipeBody, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                tint(255, 255);
                image(vPipeCage, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
            } else {
                tint(255, 63);
                image(hPipeBody, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                tint(255, 255);
                image(hPipeCage, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
            }
        } else if (type==1) {
            if (direction == 0) {
                tint(255, 63);
                image(vPipeBody, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                tint(255, 255);
                if (t%2 == 0) {
                    image(nInserter1, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                } else {
                    image(nInserter2, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                }
            } else if (direction == 1) {
                tint(255, 63);
                image(hPipeBody, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                tint(255, 255);
                if (t%2 == 0) {
                    image(eInserter1, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                } else {
                    image(eInserter2, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                }
            } else if (direction == 2) {
                tint(255, 63);
                image(vPipeBody, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                tint(255, 255);
                if (t%2 == 0) {
                    image(sInserter1, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                } else {
                    image(sInserter2, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                }
            } else {
                tint(255, 63);
                image(hPipeBody, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                tint(255, 255);
                if (t%2 == 0) {
                    image(wInserter1, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                } else {
                    image(wInserter2, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                }
            }//direction == 3
        }
        if (this.type==1 || this.type == 0) {
            imageMode(CENTER);
            pushMatrix();
            int tempx = 0;
            int tempy = 0;
            if (direction==0) {
                tempy += -16*SCREENMULTIPLIER;
                translate((-camx+x*tileSize+tempx+32)*SCREENMULTIPLIER, (-camy+y*tileSize+tempy+32)*SCREENMULTIPLIER);
                rotate(radians(270));
            }
            if (direction==1) {
                tempx += 16*SCREENMULTIPLIER;
                translate((-camx+x*tileSize+tempx+32)*SCREENMULTIPLIER, (-camy+y*tileSize+tempy+32)*SCREENMULTIPLIER);
            }
            if (direction==2) {
                tempy += 16*SCREENMULTIPLIER;
                translate((-camx+x*tileSize+tempx+32)*SCREENMULTIPLIER, (-camy+y*tileSize+tempy+32)*SCREENMULTIPLIER);
                rotate(radians(90));
            }
            if (direction==3) {
                tempx += -16*SCREENMULTIPLIER;
                translate((-camx+x*tileSize+tempx+32)*SCREENMULTIPLIER, (-camy+y*tileSize+tempy+32)*SCREENMULTIPLIER);
                rotate(radians(180));
            }
            image(arrow, 0, 0, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
            popMatrix();
        }
    }
    void output(int type, int data) {
        create_Item(this.x, this.y, type, data);
    }

    void output(int type) {
        output(type, 0);
    }
    void updateConnections() {
        for (int i = 0; i <= tiles.size()-1; i++) {
            if (tiles.get(i).x == x) {
                if (tiles.get(i).y == y-1) {
                    if (tiles.get(i).direction == 2) {
                        connections[0] = true;
                    }
                }
            }
        }
        for (int i = 0; i <= tiles.size()-1; i++) {
            if (tiles.get(i).x == x+1) {
                if (tiles.get(i).y == y) {
                    if (tiles.get(i).direction == 3) {
                        connections[1] = true;
                    }
                }
            }
        }
        for (int i = 0; i <= tiles.size()-1; i++) {
            if (tiles.get(i).x == x) {
                if (tiles.get(i).y == y+1) {
                    if (tiles.get(i).direction == 0) {
                        connections[2] = true;
                    }
                }
            }
        }
        for (int i = 0; i <= tiles.size()-1; i++) {
            if (tiles.get(i).x == x-1) {
                if (tiles.get(i).y == y) {
                    if (tiles.get(i).direction == 1) {
                        connections[3] = true;
                    }
                }
            }
        } 
        if (this.direction == 0) {
            connections[0] = true;
        }
        if (this.direction == 1) {
            connections[1] = true;
        }
        if (this.direction == 2) {
            connections[2] = true;
        }
        if (this.direction == 3) {
            connections[3] = true;
        }
    }
    void updateActivator() {
        this.data = 0;
        for (int j = tiles.size()-1; j >= 0; j--) {
            Tile detecttile = tiles.get(j);
            if (detecttile.type ==3) {
                if (detecttile.x <=this.x+2 && detecttile.x >=this.x-2 ) {
                    if (detecttile.y <=this.y+2 && detecttile.y >=this.y-2 ) {
                        if (detecttile.data == 1) {
                            this.data = 1;
                        }
                    }
                }
            }
        }
    }
    void craftCheck() {
        int[] holding = new int[2];
        for (int i = items.size()-1; i >= 0; i--) {
            Item currItem = items.get(i);
            if (currItem.x==this.x) {
                if (currItem.y==this.y) {
                    if (holding[0] == 0) {
                        holding[0] = currItem.type+1;
                    } else {
                        holding[1] = currItem.type+1;
                    }
                }
            }
        }
        if(holding[1] < holding[0]){
        int temp = holding[0];
        holding[0] = holding[1];
        holding[1] = temp;
        }
    }
}
