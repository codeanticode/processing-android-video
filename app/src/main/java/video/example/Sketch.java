package video.example;

import processing.core.*;
import processing.video.android.*;

public class Sketch extends PApplet {
  protected Movie movie;

  public void settings() {
    fullScreen(P2D);
  }

  public void setup() {
    orientation(LANDSCAPE);
    movie = new Movie(this, "transit.mp4");
    movie.loop();
    movie.play();
  }

  public void draw() {
    float w = height  * (float)(movie.width) / movie.height;
    image(movie, (width - w) /2, 0, w, height);
  }

  public void movieEvent(Movie m) {
    m.read();
  }
}