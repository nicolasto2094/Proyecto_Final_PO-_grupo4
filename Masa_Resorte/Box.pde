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
    textAlign(CENTER, CENTER);
    fill(162, 112, 78);
    stroke(0);
    textFont(font2, 64);
    textSize(width/30);

    if (mass.discri(fr1, masa1, elas1)[0]==0) {
      text("Críticamente Amortiguado", 10*width/15, 0, 4*width/15, height/12);
    }
    if (mass.discri(fr1, masa1, elas1)[0]>0) {
      text("Sobreamortiguado", 10*width/15, 0, 4*width/15, height/12);
    }
    if (mass.discri(fr1, masa1, elas1)[0]<0) {
      text("Subamortiguado", 10*width/15, 0, 4*width/15, height/12);
    }
    textAlign(LEFT);

    textFont(font1, 40);
    textSize(27);
    fill(255);
    text("Masa:", 1*width/15, 40, boxSize*3, boxSize*5);
    text("Coeficiente:", 7*width/15-width/60, 40, boxSize*3, boxSize*15);
    text("Amortiguamiento:", 4*width/15-width/30-width/60, 40, boxSize*4, boxSize*3);
    fill(0);
    stroke(123, 233, 200);
    rect(1*width/15-6, 40+3*width/50-6, textWidth(masa1+" kg")+10, width/50+8);
    rect(7*width/15-6, 40+3*width/50-6, textWidth(elas1+" N/m")+10, width/50+8);
    rect(4*width/15-6, 40+3*width/50-6, textWidth(fr1+" Ns/m")+10, width/50+8);
    fill(255);
    text(masa1+" kg", 1*width/15, 40+3*width/50, boxSize*3, boxSize*5);
    text(elas1+" N/m", 7*width/15, 40+3*width/50, boxSize*3, boxSize*15);
    text(fr1+" Ns/m", 4*width/15, 40+3*width/50, boxSize*3, boxSize*3);

    return h;
  }
}
