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
Boton bot;
PImage img, mad, img2;
Resorte [] B= new Resorte[n];
PFont font, font1, font2;
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
  bot=new Boton();
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




void draw() {
  println(Circ);
  if (Circ==true) {
    salid=-posi1*50;
    if (mousePressed && (mouseButton == LEFT)) {
      salid=-posi1*50;
      ii=0;
    }

    sa=salid;

    int e= int(RLC.rlc.getY());
    world.step();
    RLC.move(ii, mas1/2, 1/ (2*ela1), sa, f1);
    graph.dibujo(e);

    String sr="Masa Resorte";
    // Draw the box
    bot.display(sr, 2);

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
        i=0;
      }
    }
    ii+=0.2;
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
    }
    sal=salida;

    int d= int(mass.masa.getY());
    world.step();
    image(img, 0, 0, width, height);
    img = loadImage("Fondo.jpg");
    mad = loadImage("Madera.jpg");
    image(mad, 10*width/15, 0, 4*width/15, height/12);
    if (mousePressed && (mouseButton == LEFT) == true&&overBox==false) {
      if (mouseY>height/12+height/8+40) {
        mass.masa.setPosition(width*4/5, mouseY);
      }
      if (mouseY<height/12+height/8+40) {
        mass.masa.setPosition(width*4/5, height/12+height/8+40);
      }
      i=0;
    } 
    if (mousePressed && (mouseButton == LEFT) == true&&overBox==true) {
      if (mouseY>height/12+height/8+40) {
        mass.masa.setPosition(width*4/5, 5*height/8);
      }
      if (mouseY<height/12+height/8+40) {
        mass.masa.setPosition(width*4/5, height/12+height/8+40);
      }
      overBox=false;
      i=0;
    } else {
      mass.move(i, masa1, elas1, -sal, fr1);
    }
    
    fill(126);

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
    graph.dibujo(d);


    // usr=new usuario();
    strokeWeight(4);
    String sr="Masa Resorte";
    // Draw the box
    bot.display(sr, 1);
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
        i=0;
      }
    }
    i+=0.2;
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
