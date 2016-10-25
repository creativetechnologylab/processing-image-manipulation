// Declaring a variable of type PImage
PImage img;

void setup() {
  size(800, 800, P3D);  
  // Make a new instance of a PImage by loading an image file
  img = loadImage("trees-small.jpg");
}

void draw() {
  loadPixels(); 
  // Since we are going to access the image's pixels too  
  img.loadPixels(); 
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y*width;

      // The functions red(), green(), and blue() pull out the 3 color components from a pixel.
      float r = red(img.pixels[loc]);
      float g = green(img.pixels[loc]);
      float b = blue(img.pixels[loc]);

      r = (keyPressed == true && key == 'r') ?  255 : r;
      g = (keyPressed == true && key == 'g') ?  255 : g;
      b = (keyPressed == true && key == 'b') ?  255 : b;
      
      // Change brightness according to the mouse here
      float adjustBrightness = ((float) mouseX / width) * 8.0;
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness; 
      
      // Constrain RGB to between 0-255
      r = constrain(r,0,255);
      g = constrain(g,0,255);
      b = constrain(b,0,255);
        
      // Set the display pixel to the image pixel
      pixels[loc] =  color(r, g, b);
    }
  }
  updatePixels();
}