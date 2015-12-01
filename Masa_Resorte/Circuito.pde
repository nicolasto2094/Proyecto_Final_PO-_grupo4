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
    image(img2, 0, 0, width, height);
    fill(126);
    img = loadImage("Fondo.jpg");
    mad = loadImage("Madera.jpg");
    fill(255, 0, 0);
    stroke(0, 200, 200);
    strokeWeight(5);
    fill(0, 255, 0);
    fill(0);
    /////////////////////////////77777
    textAlign(CENTER, CENTER);
    stroke(123, 233, 200);
    textSize(width/50); 
    line(11*width/16, 4*height/12, 11*width/16+3*width/32, 4*height/12);
    stroke(200, 20, 20);
    line(11*width/16+3*width/32, 4*height/12, 11*width/16+3*width/32+width/64, 4*height/12-width/64);
    line(11*width/16+3*width/32+width/64, 4*height/12-width/64, 11*width/16+3*width/32+width/64, 4*height/12+width/64);
    line(11*width/16+3*width/32+width/64, 4*height/12+width/64, 11*width/16+3*width/32+width/32+width/64, 4*height/12-width/64);
    line(11*width/16+4*width/32+width/64, 4*height/12-width/64, 11*width/16+4*width/32+width/64, 4*height/12+width/64);
    line(11*width/16+4*width/32+width/64, 4*height/12+width/64, 11*width/16+5*width/32, 4*height/12);
    fill(255);
    rect(11*width/16+3*width/32, 4*height/12-width/16, textWidth(f1+" ")+10, width/50+8);
    fill(0);
    text(f1+" ", 11*width/16+3*width/32, 4*height/12-width/16, textWidth(f1+" "), width/50+8);
    stroke(0, 200, 200);
    line(11*width/16+5*width/32, 4*height/12, 15*width/16, 4*height/12);
    line(15*width/16, 4*height/12, 15*width/16, 5*height/12);
    stroke(0, 0, 150);
    fill(255);
    rect(15*width/16-height/8, 5*height/12, textWidth((mas1/2+" "))+10, width/50+8);
    fill(0);
    text(mas1/2+" ", 15*width/16-height/8, 5*height/12, textWidth(mas1/2+" "), width/50+8);
    noFill();
    arc(15*width/16, 5*height/12+height/24, height/12, height/12, -HALF_PI, HALF_PI);
    arc(15*width/16, 5*height/12+2*height/24, height/12, height/12, -HALF_PI, HALF_PI);
    arc(15*width/16, 5*height/12+3*height/24+4, height/12, height/12-4, -HALF_PI, HALF_PI);
    arc(15*width/16, 5*height/12+3*height/48, height/24, height/24, HALF_PI, PI+HALF_PI);
    arc(15*width/16, 5*height/12+5*height/48+3, height/24, height/24-6, HALF_PI, PI+HALF_PI);

    stroke(0, 200, 200);

    line(15*width/16, 7*height/12, 15*width/16, 8*height/12);
    line(15*width/16, 8*height/12, 15*width/16-3*width/32, 8*height/12);
    stroke(20, 200, 20);
    fill(255);
    rect(15*width/16-5*width/32, 7*height/12-width/25, textWidth(1/(2*ela1)+" ")+10, width/50+8);
    fill(0);
    text(1/(2*ela1)+" ", 15*width/16-5*width/32, 7*height/12-width/25, textWidth(1/(2*ela1)+" "), width/50+8);
    line(15*width/16-3*width/32, 7*height/12, 15*width/16-3*width/32, 9*height/12);
    line(15*width/16-5*width/32, 7*height/12, 15*width/16-5*width/32, 9*height/12);
    stroke(0, 200, 200);
    line(15*width/16-5*width/32, 8*height/12, 15*width/16-width/4, 8*height/12);
    line(15*width/16-width/4, 8*height/12, 11*width/16, 4*height/12);
    fill(60, 200, 145);
    stroke(0);
    textFont(font2, 64);
    textSize(width/30);
    if (mass.discri(f1, 2*mas1, 1/(2*ela1))[0]==0) {
      text("Críticamente Amortiguado", 10*width/15+20, 50, 4*width/15, height/12);
    }
    if (mass.discri(f1, 2*mas1, 1/(2*ela1))[0]>0) {
      text("Sobreamortiguado", 10*width/15+20, 50, 4*width/15, height/12);
    }
    if (mass.discri(f1, 2*mas1, 1/(2*ela1))[0]<0) {
      text("Subamortiguado", 10*width/15+20, 50, 4*width/15, height/12);
    }
    textAlign(LEFT);
    textFont(font1, 40);
    textSize(27);
    fill(255);
    text("Inductancia:", 1*width/15-width/60, 40, boxSize*3, boxSize*5);
    text("Capacitancia:", 7*width/15-width/60, 40, boxSize*3, boxSize*15);
    text("Resistencia:", 4*width/15-width/60, 40, boxSize*4, boxSize*3);
    fill(0);
    stroke(123, 233, 200);
    rect(1*width/15-6, 40+3*width/50-6, textWidth(mas1/2+" H")+10, width/50+8);
    rect(7*width/15-6, 40+3*width/50-6, textWidth(1/(2*ela1)+" F")+10, width/50+8);
    rect(4*width/15-6, 40+3*width/50-6, textWidth(f1+" Ohms")+10, width/50+8);
    fill(255);
    text(mas1/2+" H", 1*width/15, 40+3*width/50, boxSize*3, boxSize*5);
    text(1/(2*ela1)+" F", 7*width/15, 40+3*width/50, boxSize*3, boxSize*15);
    text(f1+" Ohms", 4*width/15, 40+3*width/50, boxSize*3, boxSize*3);
    strokeWeight(4);
    return h;
  }
}
