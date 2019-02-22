class AiWorld {
  
  ArrayList<Ant> ants;
  boolean dead;
  Candy candy;
  
  AiWorld() {
    ants = new ArrayList<Ant>();
    dead = false;
    candy = new Candy(width/2, height/2);
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
    candy.draw();
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
