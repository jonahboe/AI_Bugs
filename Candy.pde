class Candy {
  
  PVector pos;
  PImage cover = loadImage("candy.png");
  
  Candy(int x, int y) {
    pos = new PVector(x,y);
  }
  
  void draw() {
    image(cover, pos.x-25, pos.y-25);
  }
  
  PVector getPosition() {
    return pos; 
  }
}
