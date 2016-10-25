// Declaring a variable of type PImage
PImage img;

void setup() {
  size(800, 800, P3D);  
  // Make a new instance of a PImage by loading an image file
  img = loadImage("trees.jpg");
}

void draw() {
  background(0);
  
  beginShape();
  texture(img);
  vertex(10, 20, 0, 0);
  vertex(500, 5, 2000, 0);
  vertex(605, 575, 2000, 2000);
  vertex(40, 650, 0, 2000);
  endShape();
}