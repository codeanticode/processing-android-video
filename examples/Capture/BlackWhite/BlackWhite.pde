/**
 * B&W shader example for processing video for Android
 * By Umair Khan
 */

import processing.video.android.*;

Capture cap;

PShader bwShader;

void setup() {
  fullScreen(P2D);
  orientation(PORTRAIT);
  requestPermission("android.permission.CAMERA", "handlePermission");
  bwShader = loadShader("fragmentShader.glsl");
}

void draw() {
  if (cap != null) {
    cap.read();
    shader(bwShader);
    float w = height  * float(cap.width) / cap.height;
    image(cap, (width - w) /2, 0, w, height);
  }
}

void handlePermission(boolean granted) {
  if (granted) {
    String[] cameras = Capture.list();
    cap = new Capture(this, cameras[0]);
    cap.start();
  }
}