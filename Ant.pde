class Ant {
  
  float res = 7;
  
  Animate sprite;
  int posX;
  int posY;
  float dna[];
  int age;
  
  Ant() {
    sprite = new Animate("ant_sprite", 4);
    posX = 10;
    posY = 10;
    
    dna = new float[100];
    for(int i = 0; i < dna.length; i++) {
      dna[i] = random(TWO_PI);
    }
    age = 0;
  }
  
  void update() {
    int x = (int)(sin(dna[age]) * res);
    int y = (int)(-cos(dna[age]) * res);
    posX += x;
    posY += y;
    
    // create some wrap around
    posX = (((posX+25 % width) + width) % width) - 25;
    posY = (((posY+25 % height) + height) % height) - 25;
  }
  
  void draw() {
    sprite.draw(posX,posY,dna[age]);
    age++;
  }
  
  boolean isDead() {
    return age >= dna.length;
  }
  
  int getFitness() {
    return 0;
  }
  
}
