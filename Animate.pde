/******************************************************
 * Class for animating images
 ******************************************************/
class Animate {

  // We need an image set
  PImage[] images;
  // Number of frames in the set
  int imageCount;
  // Current frame to display
  int frame;
  
  /*****************************************
   * Non-default constructor
   *****************************************/
  Animate(String imagePrefix, int count) {
    // Set our frame count and initialize our image array
    imageCount = count;
    images = new PImage[imageCount];

    // Go through all of the images
    for (int i = 0; i < imageCount; i++) {
      // Grab the file with the incramented name
      String filename = imagePrefix + "/" + nf(i, 4) + ".gif";
      // Add the image to the array
      images[i] = loadImage(filename);
    }
  }

  /*****************************************
   * Draw the next frame
   *****************************************/
  void draw(float xpos, float ypos, float r) {
    // Incrament fram and wrap back to start
    frame = (frame+1) % imageCount;
    // Push a new transforation onto the app fame stack
    pushMatrix();
    // Move to the objects location
    translate(xpos + 25, ypos + 25);
    rotate(r);
    // draw the image
    image(images[frame], -25, -25);
    // Pop our transformation off the stack
    popMatrix();
  }

}
