// We need a world to work on.
AiWorld world;

/******************************************************
 * Setup our program
 ******************************************************/
void setup () {
  // This is the size of our screen
  size(1000,700);
  // We will slow things down a bit
  frameRate(10);
  
  // Initialize our world
  world = new AiWorld();
  // Put some ants into our world
  for (int i = 0; i < 100; i++)
    world.addAnt();
}

/******************************************************
 * Main loop for our program to run
 ******************************************************/
void draw() {
  // This will be a dark gray background (one variable)
  background(50);
  
  // Check for next generation
  if (world.isDead()) {
    world.reproduce();
    world.mutate();
  }
 
  // Update and draw our ants
  world.update();
  world.draw();
}


void keypressed() {
  if (key == 's');
}
