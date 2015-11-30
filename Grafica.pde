public class Grafica {
  int[] yvals;
  float b;
  Grafica(float q) {
    b=q;
  }
  void base() {
    int h=int(b);
    yvals = new int[5*h/8];
  }
  int a;

  void dibujo(int a) {
    strokeWeight(2);
    stroke(0);
    fill(0, 0, 0);
    rect(0, height/4, 5*width/8, height*6/8);
    stroke(0, 20, 0);
    int h=int(5*b/8);
    for (int j=height/4; j<height; j=j+3*height/48) {
      line(0, j, 5*width/8, j);
    }
    for (int j=0; j<width*5/8; j=j+(width*5/8)/60) {
      line(j+(width*5/8)/120, height/4, j+(width*5/8)/120,height);
    }
    stroke(0, 0, 20);

    line(5*width/16, height/4+3, 5*width/16, height-3);
    for (int i = 1; i <h; i++) { 
      yvals[i-1] = yvals[i];
    }  
    if (a<height/4) {
      yvals[h-1]=height/4;
    }
    if (a>height) {
      yvals[h-1]=height;
    }
    if (a<height&&a>height/4) {
      yvals[h-1] = a;
    }

    fill(255);
    noStroke();

    for (int i=0; i<h-1; i++) {
      strokeWeight(3);
      stroke(225);
      if (yvals[i]==0) {
        yvals[i]=5*height/8;
      }
      line(i, yvals[i], (i+1), yvals[i+1]);
    }
    strokeWeight(3);
    stroke(0, 0, 20);
    line(0, 5*height/8, 5*width/8-3, 5*height/8);
    strokeWeight(0);
  }
}