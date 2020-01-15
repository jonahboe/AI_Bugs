/******************************************************
 * Class holding cycle data
 ******************************************************/
class CycleInfo {
   
  // Our data to track
  public int generationsPassed = 1;
  public int closestDistance = 0;
  public int mutationCount = 0;
  
  // Display on screen
  public void draw() {
    fill(200,150,50);
    textSize(15);
    textAlign(CENTER);
    text("Generations passed: " + generationsPassed, width/2, 20);
    text("Closest distance: " + closestDistance, width/2, 40);
    text("Mutations from last cycle: " + mutationCount, width/2, 60);
  }
  
}
