class AiWorld {
  
  ArrayList<Ant> ants;
  boolean dead;
  
  AiWorld() {
    ants = new ArrayList<Ant>();
    dead = false;
  }
  
  void update() {
    for(Ant a : ants) {
      if (!a.isDead())
        a.update();
      else
        dead = true;
    }
  }
  
  void draw() {
    for(Ant a : ants) {
      if (!a.isDead())
        a.draw();
    }
  }
  
  void addAnt() {
    Ant a  = new Ant();
    ants.add(a);
  }
  
  boolean isDead() {
    return dead;
  }
  
  void reproduce() {
    
  }
  
  void mutate() {
    
  }
  
}
