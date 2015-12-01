class function {

  float []discri(float a, float m, float k) {
    float discriminante=0;
    float [] salida= new float [4];
    discriminante=((a/m)*(a/m))-(4*(k/m));
    salida [0]=discriminante;
    salida [1]=a;
    salida [2]=m;
    salida [3]=k;
    return salida;
  }

  float [] lamdas1(float a, float m, float k) {
    float B=0, D=0;
    float [] salida= new float [2];
    float [] A= new float [4];
    A=discri(a, m, k);
    B=(-A[1]/A[2]);
    D=sqrt(A[0]);
    salida[0]=(B+D)/2;
    salida[1]=(B-D)/2;
    return salida;
  }

  float [] lamdas2(float a, float m, float k) {
    float B=0, D=0;
    float [] salida= new float [2];
    float [] A= new float [4];
    A=discri(a, m, k);
    B=(-A[1]/A[2]);
    D=sqrt(-A[0]);
    salida[0]=(B/2);
    salida[1]=(D/2);
    return salida;
  } 

  float pocision1(float a, float b, float c, float d) { //a es la posicion inicial b es lamnda 1 y c es lamnda 2 d es la entrada del tiempo
    float c1, c2, salida;
    c1=0; 
    c2=0; 
    salida=0;
    c2=a/(1-(c/b));
    c1=a-c2;
    salida = c1*exp(b*d)+c2*exp(c*d);
    return salida;
  }


  float pocision2(float a, float b, float d) { //a es la posicion inicial b es lamnda 1 = lamda 2 d es la entrada del tiempo
    float c1, c2, salida;
    c1=0; 
    c2=0; 
    salida=0;
    c1=a;
    c2=-b*c1;
    salida = c1*exp(b*d)+c2*(exp(b*d))*d;
    return salida;
  }


  float pocision3(float a, float b, float c, float d) {//a posicion inicial b= ALFA c=beta d= tiempo 
    float c1, c2, salida;
    c1=0; 
    c2=0; 
    salida=0;
    c1=a;
    c2=-b*c1;
    salida = exp(b*d)*((c1*cos(c*d))+(c2*sin(c*d)));
    return salida;
  }

  float calculate(float a, float b, float c, float pi, float x) { //a= amortiguamiento, b=masa, c=constante, pi=posicion inicial, x=tiempo
    //float []discri = new float[4];
    float discri=0;
    float salida=0;
    discri=discri(a, b, c)[0];
    if (discri >= 0) {
      lamdas1(a, b, c);
      salida=pocision1(pi, lamdas1(a, b, c)[0], lamdas1(a, b, c)[1], x);
    }
    if (discri == 0) {
      lamdas1(a, b, c);
      salida=pocision2(pi, lamdas1(a, b, c)[0], x);
    }
    if (discri <= 0) {
      lamdas2(a, b, c);
      salida=pocision3(pi, lamdas2(a, b, c)[0], lamdas2(a, b, c)[1], x);
    }
     return salida;
  }
}