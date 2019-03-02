/******************************************************
 * Class for an indevidual ant
 ******************************************************/
class Ant {
  
  // Set the magnitude of movement.
  float mag = 7;
  // Our object for drawing the bugs body
  Animate sprite;
  // Some position stuff
  int posX;
  int posY;
  // About our ant and its lifespan
  float dna[];
  int age;
  
  /*****************************************
   * Default constructor
   *****************************************/
  Ant() {
    // Set up our animation
    sprite = new Animate("ant_sprite", 4);
    // Setup our starting location
    posX = 10;
    posY = 10;
    // Fill our DNA with random directions of travle
    dna = new float[100];
    for(int i = 0; i < dna.length; i++) {
      dna[i] = random(TWO_PI);
    }
    // Set our starting age
    age = 0;
  }
  
  /*****************************************
   * Method for updating the ants position
   *****************************************/
  void update() {
    // Set our new direction (Our image doesnt point towards 0
    //   so this is kind of funky)
    int x = (int)(sin(dna[age]) * mag);
    int y = (int)(-cos(dna[age]) * mag);
    // Change our position
    posX += x;
    posY += y;
    // We want our screen to wrap around the edges
    posX = (((posX+25 % width) + width) % width) - 25;
    posY = (((posY+25 % height) + height) % height) - 25;
  }
  
  /*****************************************
   * Method for drawing the ants on the
   * screen
   *****************************************/
  void draw() {
    sprite.draw(posX,posY,dna[age]);
    age++;
  }
  
  /*****************************************
   * Return true if the ant died
   *****************************************/
  boolean isDead() {
    return age >= dna.length;
  }
  
  /*****************************************
   * Get how well the ant did
   *****************************************/
  int getFitness() {
    return 0;
  }
  
}
