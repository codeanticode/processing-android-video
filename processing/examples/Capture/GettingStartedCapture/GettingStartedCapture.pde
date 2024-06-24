/**
 * Getting started camera example for processing video for Android
 * By Umair Khan
 */

import processing.video.android.*;

Capture cap;

void setup() {
  fullScreen(P2D);
  orientation(PORTRAIT);
  requestPermission("android.permission.CAMERA", "handlePermission");
}

void draw() {
  if (cap != null) {
    cap.read();
    float w = height  * float(cap.width) / cap.height;
    image(cap, (width - w) /2, 0, w, height);
  }
}

//void captureEvent(Capture c) {
//  c.read();
//}

void handlePermission(boolean granted) {
  if (granted) {
    //Use this to print list of resolutions supported by the camera
    //Capture.printCompatibleResolutionsList(cap);

    String[] cameras = Capture.list();
    cap = new Capture(this, cameras[0]);
    cap.start();
  }
}
