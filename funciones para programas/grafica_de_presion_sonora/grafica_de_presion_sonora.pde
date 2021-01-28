float h = height;
float w = width;
float m = w/0.25 ;//coorenada relatiba del principio de la fefica para el punto
float c=(h/0.8); 
float mover =0.3; //mover en width//
float pot =0;
PImage punto ;
PImage grafic ;
void setup() {
  size(1200, 533);
  punto = loadImage("puntero.jpg");
  grafic = loadImage("grafica.jpg");
}
void draw() {

grafica();
}
void grafica(){
 
  image(grafic, w/0.25, h/2);
  if (m<w/0.126) {
    pot=mouseY*0.1;//variable de presion sonora que de momento finciona con el raton
    image(punto, m, c-pot);
    m =(m + mover) ;
  } else {
    println(w/m);//0.126 es el multipro de la coerdenada del final de la grafica.
    m=w/0.25;
  }
}
