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
    posX = width/2;
    posY = height/2;
    
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
    
    if(posX < 0 || posX > width ||
       posY < 0 || posY > width)
        dead = true;
  }
  
  void draw() {
    sprite.draw(posX,posY,life[age]);
    age++;
  }
  
  boolean isDead() {
    return (age >= life.length) || dead;
  }
  
}
