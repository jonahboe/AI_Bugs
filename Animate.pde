class Animate {

  PImage[] images;
  int imageCount;
  int frame;
  
  Animate(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + "/" + nf(i, 4) + ".gif";
      images[i] = loadImage(filename);
    }
  }

  void draw(float xpos, float ypos, float r) {
    frame = (frame+1) % imageCount;
    pushMatrix();
    translate(xpos + 25, ypos + 25);
    rotate(r);
    image(images[frame], -25, -25);
    popMatrix();
  }

}
