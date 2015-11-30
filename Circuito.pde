public class Circuito extends function {

  FBox rlc;
  float xpos, ypos;

  PImage ima= loadImage("Metal.jpg");

  Circuito(float xposicion, float yposicion) {
    xpos=xposicion;
    ypos=yposicion;
  }

  void display() {
    rlc = new FBox(width/8, height/4);
    rlc.setNoStroke();
    rlc.setFill(0);
    rlc.setPosition(2*width, 5*height/8);
    rlc.setRestitution(1);
    rlc.setRotatable(false);
    
  }
  float move(float a, float b, float c, float pi, float x) {
    float h=calculate(x, b, c, pi, a);

    rlc.setPosition(xpos, h+5*height/8);
    return h;
  }
}