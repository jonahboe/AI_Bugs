/******************************************************
 * Class for an indevidual ant
 ******************************************************/
class Ant {
  
  // Set the magnitude of movement.
  float mag = 7;
  // Our object for drawing the bugs body
  Animate sprite;
  // Some position stuff
  float posX;
  float posY;
  // About our ant and its lifespan
  FloatList dna = new FloatList();
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
    for(int i = 0; i < 200; i++) {
      dna.append(random(TWO_PI));
    }
    // Set our starting age
    age = 0;
  }
  
  /*****************************************
   * Non-default constructor
   *****************************************/
  Ant(FloatList d) {
    // Set up our animation
    sprite = new Animate("ant_sprite", 4);
    // Setup our starting location
    posX = 10;
    posY = 10;
    // Fill our DNA with random directions of travle
    dna = d;
    // Set our starting age
    age = 0;
  }
  
  /*****************************************
   * Method for updating the ants position
   *****************************************/
  void update() {
    // Set our new direction (Our image doesnt point towards 0
    //   so this is kind of funky)
    float x = sin(dna.get(age)) * mag;
    float y = -cos(dna.get(age)) * mag;
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
    sprite.draw(posX,posY,dna.get(age));
    age++;
  }
  
  /*****************************************
   * Get the DNA of this ant
   *****************************************/
  FloatList getDNA() {
    return dna;
  }
  
  /*****************************************
   * Return true if the ant died
   *****************************************/
  boolean isDead() {
    return age >= dna.size();
  }
  
  /*****************************************
  ***********
   * Get how well the ant did
   **********
   *****************************************/
  float getFitness(PVector target) {
    return 0;
  }
  
}
