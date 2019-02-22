class Ant {
  
  float res = 7;
  
  Animate sprite;
  int posX;
  int posY;
  float life[];
  int age;
  boolean dead;
  
  Ant() {
    sprite = new Animate("ant_sprite", 4);
    posX = 10;
    posY = 10;
    
    life = new float[200];
    for(int i = 0; i < life.length; i++) {
      life[i] = random(TWO_PI);
    }
    age = 0;
    dead = false;
  }
  
  void update() {
    int x = (int)(sin(life[age]) * res);
    int y = (int)(-cos(life[age]) * res);
    posX += x;
    posY += y;
    
    // create some wrap around
    posX = (((posX+25 % width) + width) % width) - 25;
    posY = (((posY+25 % height) + height) % height) - 25;
  }
  
  void draw() {
    sprite.draw(posX,posY,life[age]);
    age++;
  }
  
  boolean isDead() {
    return (age >= life.length) || dead;
  }
  
}
