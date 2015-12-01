public class Boton {
String wd;
int df;
  void display(String wd,int df) {
    if (mouseX > (width-boxSize*2) && mouseX <(width) -10&& 
      mouseY > height- df*boxSize-10 && mouseY < height-(df-1)*boxSize-10) {
      if (!locked) { 
        stroke(255); 
        fill(50);
      }
    } else {
      stroke(153);
      fill(120);
    }
    rect((width-boxSize*2), height- df*boxSize-10, boxSize*2-10, boxSize);
    textSize(25);
    textAlign(CENTER, CENTER);
    fill(255);
    text( wd, (width-boxSize*2), height- df*boxSize-10, boxSize*2-10, boxSize);
    textAlign(LEFT);
  }
}