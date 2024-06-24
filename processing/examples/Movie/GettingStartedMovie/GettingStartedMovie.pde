/**
 * Getting started video playback example for processing video for Android
 * By Umair Khan
 */

import processing.video.android.*;

Movie movie;

void setup() {
  fullScreen(P2D);
  orientation(LANDSCAPE);
  movie = new Movie(this, "transit.mp4");
  movie.loop();
  movie.play();
}

void draw() {
  float w = height  * float(movie.width) / movie.height;
  image(movie, (width - w) /2, 0, w, height);
}

void movieEvent(Movie m) {
  m.read();
}