public class Box extends function {

  FBox masa;
  float xpos, ypos;

  PImage ima= loadImage("Metal.jpg");

  Box(float xposicion, float yposicion) {
    xpos=xposicion;
    ypos=yposicion;
  }

  void display() {
    masa = new FBox(width/8, height/4);
    masa.setNoStroke();
    masa.attachImage(ima);

    masa.setNoFill();
    masa.setPosition(xpos, 5*height/8);
    masa.setRestitution(1);
    masa.setRotatable(false);
    world.add(masa);
  }
  float move(float a, float b, float c, float pi, float x) {
    float h=calculate(x, b, c, pi, a);

      masa.setPosition(xpos, h+5*height/8);



    return h;
  }
}