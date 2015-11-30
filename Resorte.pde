public class Resorte {
  FBox res;
  float ypos;
  PImage img3=loadImage("Metal2.jpg");
  Resorte( float yposicion) {
    ypos=yposicion;
  }


  void anim(int i) {
    noStroke();
    fill(20);

    rectMode(CENTER);
    rect(width*4/5, (height/12)+2*(i)*(((mass.masa.getY())-height/8)-height/12)/(2*n)-(((mass.masa.getY())-height/8)-height/12)/(2*n), width/16, height/96);
    float ypox=(height/12)+2*(i)*(((mass.masa.getY())-height/8)-height/12)/(2*n)-(((mass.masa.getY())-height/8)-height/12)/(2*n);
    fill(30);
    if (i==1) {
      quad((width*4/5)-(width/32), ypox-height/192, (width*4/5)-(width/32), ypox+height/192, (width*4/5)+height/100, height/12, (width*4/5)-(height/100), height/12);
      quad((width*4/5)+(width/32), ypox-height/192, (width*4/5)+(width/32), ypox+height/192, (width*4/5)-(width/32), ypox+2*(((mass.masa.getY())-height/8)-height/12)/(2*n)+height/192, (width*4/5)-(width/32), ypox+2*(((mass.masa.getY())-height/8)-height/12)/(2*n)-height/192);
    } else {
      quad((width*4/5)+(width/32), ypox-height/192, (width*4/5)+(width/32), ypox+height/192, (width*4/5)-(width/32), ypox+2*(((mass.masa.getY())-height/8)-height/12)/(2*n)+height/192, (width*4/5)-(width/32), ypox+2*(((mass.masa.getY())-height/8)-height/12)/(2*n)-height/192);
    }
    rectMode(CORNER);
  }
}