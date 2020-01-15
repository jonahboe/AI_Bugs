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
  
  // Info about the ants
  CycleInfo cycleInfo;
  
  /*****************************************
   * A defoult constructor
   *****************************************/
  AiWorld() {
    ants = new ArrayList<Ant>();
    cycleInfo = new CycleInfo();
    dead = false;
    candy = new Candy(width/2, height/2);
  }
  
  /*****************************************
   * Update our world
   *****************************************/
  void update() {
    // Go through all of the ants
    for (Ant a : ants) {
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
    // Draw the candy
    candy.draw();
    // Go through all of the ants
    for (Ant a : ants) {
      // And draw them if they're not dead
      if (!a.isDead())
        a.draw();
    }
    
    cycleInfo.draw();
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
  
  /***************************************************
   * Create a new generation
   **************************************************/
  void reproduce() {
    ArrayList<Ant> genePool = new ArrayList<Ant>();
    ArrayList<Ant> nextGen = new ArrayList<Ant>();
    float maxFitness = 0;
    float minFitness = 100;
    
    // Normalize
    for (Ant a : ants) {
      if (a.getFitness(candy.getPosition()) > maxFitness)
        maxFitness = a.getFitness(candy.getPosition());
      if (a.getFitness(candy.getPosition()) < minFitness)
        minFitness = a.getFitness(candy.getPosition());
    }
    minFitness = (minFitness / maxFitness) * 100;
    
    // Add ants based on health
    for (Ant a : ants) {
      float fit = a.getFitness(candy.getPosition());
      int prob = (int)map((fit/maxFitness)*100, minFitness, 100, 0, 100);
      for (int j = 0; j < prob; j++) {
        genePool.add(a);
      }
    }
    
    // Create a new population
    for (int i = 0; i < ants.size(); i++)
    {
      FloatList parentA = genePool.get((int)random(genePool.size())).getDNA();
      FloatList parentB = genePool.get((int)random(genePool.size())).getDNA();
      FloatList child = new FloatList();
      for (int j = 0; j < parentA.size(); j++) {
        if (j % 2 == 0)
          child.append(parentA.get(j));
        else
          child.append(parentB.get(j));
      }
      Ant a = new Ant(child);
      nextGen.add(a);
    }
    
    // Set the new population and make restart
    ants = nextGen;
    dead = false;
    
    // Update some info
    cycleInfo.generationsPassed++;
    cycleInfo.closestDistance = int (1/maxFitness);
  }
  
  /***************************************************
   * Create mutations in the new generation
   **************************************************/
  void mutate() {
    int mutations = 0;
    for (Ant a : ants) {
      for (int i = 0; i < a.getDNA().size(); i++)
      if (((int)random(100)) <= 2) {
        a.getDNA().set(i, random(TWO_PI));
        mutations++;
      }
    }
   
    // Update the info
    cycleInfo.mutationCount = mutations;
  }
  
}
