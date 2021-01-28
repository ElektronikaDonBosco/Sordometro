/*
el programa es relativo a la intensidad de luz y no a la pantalla
 si se cambia la pantalla se descoodinan los ratios y pueden no 
 verse los verdes.
 */
float red= 255;
float green=0;
float blue=0;
float peligro=mouseY; /*que funcione con el raton es un apaño, tendra que sustituirse
 cuando podamos determinar los DB
 */
void setup() {
  size(800, 600); //fullScreen(); para pantalla completa
}
void draw() {
  fondosemaforo();
}
void fondosemaforo() {//void de colores
  colorMode(RGB);
  background(red, green, blue);
  peligro=mouseY;
  green=peligro*0.7;//tonos de verde
  blue=0;//sin azul
  red=(255/(peligro*0.0025));//tonos de rojo
}
