/******************************************************
 * Class for our Artificial world
 ******************************************************/
class AiWorld {
  
  // We need a population of ants
  ArrayList<Ant> ants;
  // We need to know when theyr dead
  boolean dead;
  // We need some candy for them to chase after
  Candy candy;
  
  /*****************************************
   * A defoult constructor
   *****************************************/
  AiWorld() {
    ants = new ArrayList<Ant>();
    dead = false;
    candy = new Candy(width/2, height/2);
  }
  
  /*****************************************
   * Update our world
   *****************************************/
  void update() {
    // Go through all of the ants
    for(Ant a : ants) {
      // And update them if they're not dead
      if (!a.isDead())
        a.update();
      // Otherwise mark them as dead
      else
        dead = true;
    }
  }
  
  /*****************************************
   * Draw our world
   *****************************************/
  void draw() {
    // Go through all of the ants
    for(Ant a : ants) {
      // And draw them if they're not dead
      if (!a.isDead())
        a.draw();
    }
    // Draw the candy
    candy.draw();
  }
  
  /*****************************************
   * Add an ant to our world
   *****************************************/
  void addAnt() {
    Ant a  = new Ant();
    ants.add(a);
  }
  
  /*****************************************
   * Check if the current generation has
   * died
   *****************************************/
  boolean isDead() {
    return dead;
  }
  
  /*****************************************
   * Create a new generation
   *****************************************/
  void reproduce() {
    
  }
  
  /*****************************************
   * Create mutations in the new generation
   *****************************************/
  void mutate() {
    
  }
  
}
