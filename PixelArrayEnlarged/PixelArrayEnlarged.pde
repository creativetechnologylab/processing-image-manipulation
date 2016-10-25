/*
 * Gareth Foote
 * Draw image one pixel per draw() & scaling image up.
 */ 

PImage img;
int currentPixel = 0;
int debug = 0;
int scaleX = 0;
int scaleY = 0;
color tint;

void setup() {
  size(960, 540);
  img = loadImage("sea.jpg");
  img.loadPixels();
  scaleX = round(width/img.width);
  scaleY = round(height/img.height);
  
  tint(255, 50);
  image(img, 0, 0, width, height);
}

void draw() {
  if(currentPixel+1 <= img.pixels.length){
    // Load pixels that are on the screen so we can later update them.
    loadPixels();
  
    boolean relevantKeyPressed = keyPressed == true && (key == 'r' || key == 'g' || key == 'b');  
    // The functions red(), green(), and blue() pull out the three color components from a pixel.
    float r = (relevantKeyPressed == false || key == 'r') ? red(img.pixels [currentPixel]) : 0; 
    float g = (relevantKeyPressed == false || key == 'g') ? green(img.pixels[currentPixel]) : 0;
    float b = (relevantKeyPressed == false || key == 'b') ? blue(img.pixels[currentPixel]) : 0;
  
    int posY = floor(currentPixel/img.width)*scaleY;
    int posX = (currentPixel%img.width)*scaleX;
    int startingPx = posY*width+posX;
    
    // Set the display pixel to the image pixel
    for(int i = 0; i < scaleX; i++){
      //pixels[currentPixel*scaleX+i] = color(r, g, b);
      for(int j = 0; j < scaleX; j++){
        pixels[(startingPx)+(width*i)+j] = color(r, g, b);
      }
    }
    currentPixel++;
    updatePixels();
  }
  
  if(!mousePressed){
    image(img, width-img.width, height-img.height);
  }
}
void mouseDragged(){
  findColour();
}
void mousePressed(){
  findColour();
}
void findColour(){
  int scaledX = mouseX/scaleX;
  int scaledY = (mouseY/scaleY)+1;
  int pixelLocation = ((img.width)*(scaledY-1)+scaledX);
  if(pixelLocation > 0 && pixelLocation < img.pixels.length-1){
    fill(img.pixels[pixelLocation]);
    noStroke();
    rect(width-img.width, height-img.height, img.width, img.height);
  }
}