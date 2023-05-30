/**
 * Emboss shader example for processing video for Android
 * By Umair Khan
 */

import processing.video.android.*;

Capture cap;

PShader embossShader;

void setup() {
  fullScreen(P2D);
  orientation(LANDSCAPE);

  String[] cameras = Capture.list();
  cap = new Capture(this, cameras[0]);
  cap.start();
  embossShader = loadShader("fragmentShader.glsl");
}

void draw() {
  cap.read();
  shader(embossShader);
  float w = height  * float(cap.width) / cap.height;
  image(cap, (width - w) /2, 0, w, height);
}
