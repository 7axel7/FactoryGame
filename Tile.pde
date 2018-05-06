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
        if (type == 0) {
            fill(0, 0, 0);
        } else if (type == 1) {
            fill(0, 255, 0);
        }
        // 0=up, 1=right, 2=down, 3=left
        //rect((-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
        if (type==0) {
            if (connections[0] && connections[1] && connections[2] && connections[3]) {
            } else if (connections[0] && connections[1] == false && connections[2] && connections[3] == false) {
                image(vPipeBody, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                image(vPipeCage, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
            } else if (connections[0] && connections[1]&& connections[2] == false  && connections[3] == false) {
                image(neCurveBody, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                image(neCurveCage, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
            } else if (connections[0] && connections[1]==false&& connections[2] == false  && connections[3]) {
                image(nwCurveBody, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                image(nwCurveCage, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
            } else if (connections[0]==false && connections[1]&& connections[2]  && connections[3] == false) {
                image(seCurveBody, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                image(seCurveCage, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
            } else if (connections[0] == false && connections[1] == false && connections[2]  && connections[3]) {
                image(swCurveBody, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                image(swCurveCage, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
            } else if (connections[0]||connections[2]) {
                image(vPipeBody, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                image(vPipeCage, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
            } else {
                image(hPipeBody, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                image(hPipeCage, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
            }
        } else if (type==1) {
            if (direction == 0) {
                if (t%2 == 0) {
                    image(nInserter1, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                } else {
                    image(nInserter2, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                }
            } else if (direction == 1) {
                if (t%2 == 0) {
                    image(eInserter1, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                } else {
                    image(eInserter2, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                }
            } else if (direction == 2) {
                if (t%2 == 0) {
                    image(sInserter1, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                } else {
                    image(sInserter2, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                }
            } else {
                if (t%2 == 0) {
                    image(wInserter1, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                } else {
                    image(wInserter2, (-camx+x*tileSize)*SCREENMULTIPLIER, (-camy+y*tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
                }
            }//direction == 3
        }

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
}
