float h = height;
float w = width;
float m = w/0.25 ;//coorenada relatiba del principio de la fefica para el punto
float c=(h/0.8); 
float mover =0.3; //mover en width//
float pot =0;
PImage punto ;
PImage grafic ;
PImage push1 ;
PImage push2 ;
int tiempo = millis();
float t=0;
float interval=1;
void setup() {
  size(1200, 533);
  punto = loadImage("puntero.jpg");
  grafic = loadImage("grafica.jpg");
  push1 = loadImage("push.gif");
  push2 = loadImage("pushpulsado.gif");
}
void draw() {

  grafica();
  presion_sonora();
  boton();
}
void grafica() {

  if (m== w/0.25) {
    image(grafic, w/0.25, h/2);
  }
  if ( m < w/0.126 ) {

    pot=mouseY*0.1;//variable de presion sonora que de momento finciona con el raton
    int tiempo = millis();
    if (tiempo > t+interval) //ajuste de separacion entre imagenes (por tema optimizacion)
    {
      image(punto, m, c-pot);
      t=tiempo;
      println(tiempo);
    }
    m =(m + mover) ;
  }
  if (m>w/0.126) {
    //println(w/m);//0.126 es el multipro de la coerdenada del final de la grafica.
    m=w/0.25;
  }
}
void presion_sonora() {
  image(grafic, w/0.25, h/0.45);
  textSize(32);
  fill(200, 10, 0);
  text("DB=  "+pot, w/0.25, h/0.4);
}
void boton() {
  if (mousePressed) {
    push2.resize(0, 250);
    image(push2, w/4, h/2);
  } else {
    push1.resize(0, 250);
    image(push1, w/4, h/2);
  }
}
