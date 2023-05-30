/**
 * B&W shader example for processing video for Android
 * By Umair Khan
 */

import processing.video.android.*;

Capture cap;

PShader bwShader;

void setup() {
  fullScreen(P2D);
  orientation(LANDSCAPE);

  String[] list = Capture.list();
  cap = new Capture(this, list[0]);
  
  cap.start();
  bwShader = loadShader("fragmentShader.glsl");
}

void draw() {
  cap.read();
  shader(bwShader);
  float w = height  * float(cap.width) / cap.height;
  image(cap, (width - w) /2, 0, w, height);
}