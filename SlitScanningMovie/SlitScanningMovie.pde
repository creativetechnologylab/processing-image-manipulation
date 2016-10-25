/**
 * Slit Scanning Movie
 * @author Gareth Foote
 */

import processing.video.*;

Movie myVideo;
int video_width     = 640;
int video_height    = 360;
int video_slice_x   = video_width/2;
int window_width    = 640;
int window_height   = video_height;
int draw_position_x = 0; 
boolean newFrame  = false;

void setup() {
  size(640, 360, P2D);
  myVideo = new Movie(this, "maria.mov");
  background(0);
  myVideo.loop();
  myVideo.volume(0);
}

void movieEvent(Movie myMovie) {
  myMovie.read();
  newFrame = true;
}

void draw() {
  if (newFrame) {
    loadPixels();
    myVideo.loadPixels();
    for (int y=0; y<window_height; y++) {
      int setPixelIndex = y*window_width + draw_position_x;
      int getPixelIndex = y*video_width  + video_slice_x;
      pixels[setPixelIndex] = myVideo.pixels[getPixelIndex];
    }

    updatePixels();

    video_slice_x++;
    if (video_slice_x >= video_width) {
      video_slice_x = 0;
    }

    draw_position_x++;
    if (draw_position_x >= window_width) {
      //exit();
      myVideo.pause();
    }
    newFrame = false;
  }
}