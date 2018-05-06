void create_Item(int x, int y, int type, int data) {
    int itemx = x;
    int itemy = y;

    Item currItem = new Item(itemx, itemy, type, data);

    items.add(currItem);
}

void create_Item(int x, int y, int type) {
    create_Item(x, y, type, 0);
}

class Item {
    boolean deleteMe = false;
    int currSlot = 1;
    int futureSlot = 1;
    int waitMove = 30;
    int x;
    int y;
    int type;
    int data;
    int direction;
    int animationx;
    int animationy;
    Tile tileMovingTo = null;
    Tile tileIn;


    Item(int x, int y, int type, int data) {
        this.x = x;
        this.y = y;
        this.type=type;
        this.data=data;
        if (this.data == -1) {
            this.currSlot = 3;
            this.data = 0;
        }
    }
    void push() {
        if (tileMovingTo == null) {
            Tile tileIn = null;
            for (int i = 0; i <= tiles.size()-1; i++) {
                if (tiles.get(i).x == this.x) {
                    if (tiles.get(i).y == this.y) {
                        if (tiles.get(i).y == this.y) {
                            tileIn = tiles.get(i);
                        }
                    }
                }
            }
            if (tileIn!=null) {
                if (tileIn.type == 5) {
                    if (this.currSlot != 3) {
                        tileIn = null;
                    }
                }
            }
            if (tileIn != null) {
                int enterx = x;
                int entery = y;

                if (tileIn.direction == 0) {
                    entery = y-1;
                }
                if (tileIn.direction == 1) {
                    enterx = x+1;
                }
                if (tileIn.direction == 2) {
                    entery = y+1;
                }
                if (tileIn.direction == 3) {
                    enterx = x-1;
                }

                Tile tileout = null;
                for (int i = 0; i <= tiles.size()-1; i++) {
                    if (tiles.get(i).x == enterx) {
                        if (tiles.get(i).y == entery) {
                            tileout = tiles.get(i);
                        }
                    }
                }
                if (tileout != null) {
                    if (tileout.slot == false) {
                        tileout.slot = true;
                        this.tileIn = tileIn;
                        tileMovingTo = tileout;
                        if (currSlot == 3) {
                            tileIn.slot3 = false;
                        }
                        futureSlot = 1;
                    } else if (tileout.type==5) {
                        if (tileout.slot2 == false) {
                            tileout.slot2 = true;
                            this.tileIn = tileIn;
                            tileMovingTo = tileout;
                            futureSlot = 2;
                        }
                    }
                }
            }
        } else {
            if (waitMove < 0) {
                this.x = tileMovingTo.x;
                this.y = tileMovingTo.y;
                this.tileIn.slot = false;
                if (tileMovingTo.type == 2) {
                    deleteMe = true;
                    outputIncrease(this.type);
                    tileMovingTo.slot = false;
                }
                tileMovingTo = null;
                waitMove = 31;
                animationx = 0;
                animationy = 0;
                currSlot = futureSlot;
            } else {
                if (tileIn.direction==0) {
                    animationy-=2*tileSize/64;
                }
                if (tileIn.direction==1) {
                    animationx+=2*tileSize/64;
                }
                if (tileIn.direction==2) {
                    animationy+=2*tileSize/64;
                }
                if (tileIn.direction==3) {
                    animationx-=2*tileSize/64;
                }
                waitMove -= 1;
            }
        }
    }

    void display() {
        PImage temp;
        temp = loadImage("Horizontal Pipe Body.png");
        imageMode(CENTER);
        rectMode(CENTER);

        if (this.type ==0) {
            temp = brackishBrine;
        } else if (this.type == 1) {
            temp = drainPlug;
        } else if (this.type == 2) {
            temp = eyeEngine;
        } else if (this.type == 3) {
            temp = eyeForest;
        } else if (this.type == 4) {
            temp = magmaHeart;
        } else if (this.type == 5) {
            temp = mithrilPlate;
        } else if (this.type == 6) {
            temp = thermalCapacitor;
        } else if (this.type == 7) {
            fill(0, 120, 120);
            noStroke();
            rect((-camx+x*tileSize+tileSize/2+animationx)*SCREENMULTIPLIER, (-camy+y*tileSize+tileSize/2+animationy)*SCREENMULTIPLIER, (tileSize/2)*SCREENMULTIPLIER, (tileSize/2)*SCREENMULTIPLIER);
        } else if (this.type == 8) {
            fill(120, 120, 0);
            noStroke();
            rect((-camx+x*tileSize+tileSize/2+animationx)*SCREENMULTIPLIER, (-camy+y*tileSize+tileSize/2+animationy)*SCREENMULTIPLIER, (tileSize/2)*SCREENMULTIPLIER, (tileSize/2)*SCREENMULTIPLIER);
        } else if (this.type == 9) {
            fill(120, 0, 250);
            noStroke();
            rect((-camx+x*tileSize+tileSize/2+animationx)*SCREENMULTIPLIER, (-camy+y*tileSize+tileSize/2+animationy)*SCREENMULTIPLIER, (tileSize/2)*SCREENMULTIPLIER, (tileSize/2)*SCREENMULTIPLIER);
        } else if (this.type == 10) {
            fill(250, 120, 250);
            noStroke();
            rect((-camx+x*tileSize+tileSize/2+animationx)*SCREENMULTIPLIER, (-camy+y*tileSize+tileSize/2+animationy)*SCREENMULTIPLIER, (tileSize/2)*SCREENMULTIPLIER, (tileSize/2)*SCREENMULTIPLIER);
        }

        image(temp, (-camx+x*tileSize+tileSize/2+animationx)*SCREENMULTIPLIER, (-camy+y*tileSize+tileSize/2+animationy)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER, (tileSize)*SCREENMULTIPLIER);
    }
}
