# Processing Video library for Android

This library exposes the same API endpoints as that of processing-video library for Java mode.
Any sketches using the processing-video library should work the same when using this library on Android.

**Demo:** https://www.youtube.com/watch?v=kjqcWGLH6Q8

**A simple example :**
```
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
```

**Behind the hood :**

The idea is to render camera preview on a `SurfaceTexture` and as soon as the new frame is received, copy the data from this `SurfaceTexture` to a custom texture bound to target `GL_TEXTURE_2D`
(Note : We cannot directly render to a texture bound to `GL_TEXTURE_2D` target, because for the preview to happen, the texture must be bound to `GL_TEXTURE_EXTERNAL_OES`).
This custom texture is then rendered to a PGraphics object.
The backing texture of that PGraphics object is then used as the texture cache for our PImage file which stores the video.

## Building the Project

`gradle dist` will build the project, copy it to the user's Processing sketchbook folder, and prepare a .zip file ready for distribution.

## Authors

* [Mohammad Umair](https://github.com/omerjerk): Original implementation supporting video playback and camera capture, library examples
* [Kate Hollenbach](http://www.katehollenbach.com): Updates to make the library compatible with Processing 4, updates in gradle build script
* [Andres Colubri](https://github.com/codeanticode): Updates to gradle build script and examples