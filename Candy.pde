/******************************************************
 * Class for a peice of candy
 ******************************************************/
class Candy {
  
  // Some position stuff
  int posX;
  int posY;
  PImage cover = loadImage("candy.png");
  
  /*****************************************
   * Default constructor
   *****************************************/
  Candy(int x, int y) {
    // Set our position
    posX = x;
    posY = y;
  }
  
  /*****************************************
   * Method for drawing the candy
   *****************************************/
  void draw() {
    // Draw the candy at the position
    image(cover, posX, posY);
  }
  
  /*****************************************
   * Method for getting the candies position
   *****************************************/
  PVector getPosition() {
    // Return where the candy is located
    return new PVector(posX, posY); 
  }
  
}
