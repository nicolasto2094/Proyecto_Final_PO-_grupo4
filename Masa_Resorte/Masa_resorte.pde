int n=15;
import co.jimezam.util.Dialogo;
int boxSize = 75;
boolean overBox = false;
boolean Circ=false;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 
float masa1=0;
float mas1=0;
float elas1=0;
float ela1=0;
float fr1=0;
float f1=0;
String posi=null;
float posi1=0;
String mas=null;
String ma=null;
String elas=null;
String ela=null;
String fr=null;
String f=null;
float ii=0;
Grafica graph;
import fisica.*;
FWorld world;
Box mass;
Circuito RLC;
PImage img, mad, img2;
Resorte [] B= new Resorte[n];
PFont font, font1,font2;
float sal;
float sa;
float altura;
float altur;
void setup() {
  fullScreen();
  Fisica.init(this);
  font = loadFont("Dutch801BT-BoldItalic-64.vlw");
  font1 = loadFont("Arial-BoldItalicMT-48.vlw");
  font2 = loadFont("AgencyFB-Bold-64.vlw");
  textFont(font, 40);

  world = new FWorld();
  world.setGravity(0, 0);
  world.setEdges();
  world.remove(world.left);
  world.remove(world.right);
  world.remove(world.top);
  world.remove(world.bottom);

  if (frame != null) {
    surface.setResizable(true);
  }
  background(0);
  mas = Dialogo.preguntar("Masa", "Masa en kg=");//aca los parametros y las unidades para ingresar los datos

  masa1=Float.parseFloat(mas);//que la variable masa1 tipo float
  if (masa1<0) {
    masa1=0;
  }
  /////////////////////////////////
  fr = Dialogo.preguntar("Magnitud del Amortiguamiento", "Amortiguamiento en Ns/m=");//

  fr1=Float.parseFloat(fr);//que el coeficiente de friccion fr
  ////////////////////////////////
  elas = Dialogo.preguntar("Coeficiente de elasticidad del resorte", "Constante en N/m");// 

  elas1=Float.parseFloat(elas);//que el coeficiente de leasticidad
  if (elas1<0) {
    elas1 = 0;
  }

  noSmooth();
  img=loadImage("Fondo.jpg"); 
  img2=loadImage("Fondo2.jpg");

  for (int ss=1; ss<=n; ss++) { 
    float ypox=(height/4)+2*(i)*(((5*height/8)-height/8)-height/4)/(2*n);
    B[ss-1] = new Resorte( ypox );
  }
  mass=new Box(width*4/5, 5*height/8);
  RLC=new Circuito(2*width, 5*height/8);
  mass.display();
  RLC.display();
  graph=new Grafica(width);
  graph.base();
  altura=(height/8)*5;
  altur=(height/8)*5;
  overBox=false;
}
float i=0;

float salida=0;
float salid=0;

float inicia() {
  salid=-posi1*50;
  if (mousePressed && (mouseButton == LEFT)) {
    salid=-posi1*50;
    ii=0;
  }
  return salid;
}


void draw() {
  println(Circ);
  if (Circ==true) {
    sa=inicia();

    int e= int(RLC.rlc.getY());
    world.step();
    RLC.move(ii, mas1/2, 1/ (2*ela1), sa, f1);
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
    graph.dibujo(e);
    fill(60, 200, 145);
    stroke(0);
    textFont(font2,64);
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
    ii+=0.2;
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
    // Draw the box
    if (mouseX > (width-boxSize*2) && mouseX <(width) -10&& 
      mouseY > height- 2*boxSize-10 && mouseY < height-boxSize-10) {
      if (!locked) { 
        stroke(255); 
        fill(50);
      }
    } else {
      stroke(153);
      fill(120);
    }

    if (mousePressed==true&&mouseButton==LEFT) {
      if (mouseX > (width-boxSize*2) && mouseX <(width) -10&& 
        mouseY > height- 2*boxSize-10 && mouseY < height-boxSize-10) {

        mas = Dialogo.preguntar("Masa", "Masa en kg=");//aca los parametros y las unidades para ingresar los datos

        masa1=Float.parseFloat(mas);//que la variable masa1 tipo float
        if (masa1<0) {
          masa1=0;
        }
        /////////////////////////////////
        fr = Dialogo.preguntar("Magnitud del Amortiguamiento", "Amortiguamiento en Ns/m=");//

        fr1=Float.parseFloat(fr);//que el coeficiente de friccion fr
        ////////////////////////
        elas = Dialogo.preguntar("Coeficiente de elasticidad del resorte", "Constante en N/m");// 

        elas1=Float.parseFloat(elas);//que el coeficiente de leasticidad
        if (elas1<0) {
          elas1 = 0;
        }
        Circ=false;
        overBox=true;
      }
    } 
    rect((width-boxSize*2), height- 2*boxSize-10, boxSize*2-10, boxSize);
    textSize(25);
    textAlign(CENTER, CENTER);
    fill(255);
    text("Masa Resorte", (width-boxSize*2), height- 2*boxSize-10, boxSize*2-10, boxSize);
    textAlign(LEFT);
  }
  if (Circ==false) {
    if (mousePressed && (mouseButton == LEFT)&&overBox==false) {
      if (mouseY>height/12+height/8+40) {
        salida=-(mouseY-altura);
      }
      if (mouseY<height/12+height/8+40) {
        salida=-(height/12+height/8+40-altura);
      }
    }
    if (mousePressed && (mouseButton == LEFT)&&overBox==true) {
      salida=0;
      overBox=false;
    }
    sal=salida;

    int d= int(mass.masa.getY());
    world.step();

    if (mousePressed && (mouseButton == LEFT) == true) {
      if (mouseY>height/12+height/8+40) {
        mass.masa.setPosition(width*4/5, mouseY);
      }
      if (mouseY<height/12+height/8+40) {
        mass.masa.setPosition(width*4/5, height/12+height/8+40);
      }
      i=0;
    } else {
      mass.move(i, masa1, elas1, -sal, fr1);
    }
    image(img, 0, 0, width, height);
    fill(126);
    img = loadImage("Fondo.jpg");
    mad = loadImage("Madera.jpg");
    fill(255, 0, 0);
    stroke(255);
    for (int w=1; w<=n; w++) { 
      B[w-1].anim(w);
    }
    world.draw();

    fill(0, 255, 0);
    String msg = str(masa1)+" kg";
    fill(0);
    textSize(width/50); 
    if (textWidth(msg)<width/16) {
      text(msg, width*4/5-textWidth(msg)/2, mass.masa.getY()+width/64);
    }
    if (textWidth(msg)>width/16) {
      textSize(width/80);
      text(msg, width*4/5-textWidth(msg)/2, mass.masa.getY()+width/128);
    }
    textAlign(CENTER, CENTER);
    fill(162, 112, 78);
    stroke(0);
    textFont(font2,64);
    textSize(width/30);
    image(mad, 10*width/15, 0, 4*width/15, height/12);
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
    graph.dibujo(d);
    i+=0.2;
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
    // usr=new usuario();
    strokeWeight(4);
    if (mouseX > (width-boxSize*2) && mouseX <(width) -10&& 
      mouseY > height- boxSize-10 && mouseY < height-10) {
      if (!locked) { 
        stroke(255); 
        fill(50);
      }
    } else {
      stroke(153);
      fill(120);
    }

    if (mousePressed==true&&mouseButton==LEFT) {
      if (mouseX > (width-boxSize*2) && mouseX <(width) -10&& 
        mouseY > height- boxSize-10 && mouseY < height-10) {

        ma = Dialogo.preguntar("Inductancia", "Inductancia en H=");//aca los parametros y las unidades para ingresar los datos

        mas1=2*Float.parseFloat(ma);//que la variable masa1 tipo float
        if (mas1<0) {
          mas1=0;
        }

        /////////////////////////////////
        f = Dialogo.preguntar("Resistencia", "Resistencia en Ohms=");//

        f1=Float.parseFloat(f);//que el coeficiente de friccion fr
        if (f1<0) {
          f1 = 0;
        }
        ////////////////////////
        ela = Dialogo.preguntar("Capacitancia", "Capacitancia en F=");// 

        ela1=1/(2*Float.parseFloat(ela));//que el coeficiente de leasticidad
        if (ela1<0) {
          ela1 = 0;
        }
        ////////////////////////////
        ////////////////////////
        posi = Dialogo.preguntar("Voltaje", "Voltaje en V=");// 

        posi1=Float.parseFloat(posi);//que el coeficiente de leasticidad
        if (posi1<0) {
          posi1 = 0;
        }
        Circ=true;
        world.step();
      }
    } 
    // Draw the box
    rect((width-boxSize*2), height- boxSize-10, boxSize*2-10, boxSize);
    textSize(25);
    textAlign(CENTER, CENTER);
    fill(255);
    text("Circuito RLC", (width-boxSize*2), height- boxSize-10, boxSize*2-10, boxSize);
    textAlign(LEFT);
  }
}

void mousePressed() {
}

/////////////////////////////////////////////////////////////////////////////////////////7
void keyPressed() {
  if (key == 'n') {
    if (Circ==false) {
      mas = Dialogo.preguntar("Masa", "Masa en kg=");//aca los parametros y las unidades para ingresar los datos

      masa1=Float.parseFloat(mas);//que la variable masa1 tipo float
      if (masa1<0) {
        masa1=0;
      }

      /////////////////////////////////
      fr = Dialogo.preguntar("Magnitud del Amortiguamiento", "Amortiguamiento en Ns/m=");//

      fr1=Float.parseFloat(fr);//que el coeficiente de friccion fr
      ////////////////////////
      elas = Dialogo.preguntar("Coeficiente de elasticidad del resorte", "Constante en N/m");// 

      elas1=Float.parseFloat(elas);//que el coeficiente de leasticidad
      if (elas1<0) {
        elas1 = 0;
      }
    }
    if (Circ ==true) {
      ma = Dialogo.preguntar("Inductancia", "Inductancia en H=");//aca los parametros y las unidades para ingresar los datos

      mas1=2*Float.parseFloat(ma);//que la variable masa1 tipo float
      if (mas1<0) {
        mas1=0;
      }

      /////////////////////////////////
      f = Dialogo.preguntar("Resistencia", "Resistencia en Ohms=");//

      f1=Float.parseFloat(f);//que el coeficiente de friccion fr
      if (f1<0) {
        f1 = 0;
      }
      ////////////////////////
      ela = Dialogo.preguntar("Capacitancia", "Capacitancia en F=");// 

      ela1=1/(2*Float.parseFloat(ela));//que el coeficiente de leasticidad
      if (ela1<0) {
        ela1 = 0;
      }
      ////////////////////////////
      ////////////////////////
      posi = Dialogo.preguntar("Voltaje", "Voltaje en V=");// 

      posi1=Float.parseFloat(posi);//que el coeficiente de leasticidad
      if (posi1<0) {
      }
    }
  }
}