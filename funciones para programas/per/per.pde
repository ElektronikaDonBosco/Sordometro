float h = height;
float w = width;
float P1=h/16;
float pot=mouseY;
int horas = 1;
int minutos=30;
int horas2 = 1;
int minutos2=30;
float red1 =0;
float red2 =255;
float green1 =255;
float green2 =0;
PFont tex;
float redondeo;
int db;
float f;
void setup() {
  fullScreen();
  //size(1280, 800);
  colorMode(RGB, 100);
  printArray(PFont.list());
  tex= createFont("Cambria-Bold-48.vlw", 48);
  textFont(tex);
  rect(1200, 800, 0, 0);
}
void draw() {
  background(0, 0, 0);
  pot=mouseY/0.3;
  db=round(pot);
 
  //rectangolo arriba1
  strokeWeight(5);
  fill(0, 0, 30);
  stroke(80, 80, 100);
  rect(130, 100, 650, 230, 17);
  //rectangolo arriba2
  strokeWeight(5);
  fill(0, 0, 30);
  stroke(80, 80, 100);
  rect(830, 100,320, 230, 17);
  //rectangulo abajo
  strokeWeight(5);
  fill(0, 0, 30);
  stroke(80, 80, 100);
  rect(130, 430, 1015, 230, 17);
  //numeros
  textSize(100);
  fill(red1, green1, 0);
  text("DB=  "+db, 180, 255);
  textSize(50);
  text(horas2+"H", 880, 235);
  text(minutos2+"min", 970, 235);
  fill(red2, green2, 0);
  textSize(130);
  text(horas+"H", 390, 590);
  text(minutos+"min", 620, 590);
  //Descripciones
  textSize(30);
  fill(80, 80, 100);
  text("SONÓMETRO", 365, 380);
   textSize(18);
  text("TIEMPO DE EXPOSICION", 895, 370);
  text("DIARIA MAXIMA", 925, 400);
  textSize(30);
  text("DOSIMETRO SONORO:", 180, 710);
  textSize(18);
  text("TIEMPO DE EXPOSICION RESTANTE PARA LA PERDIDA DE AUDICION", 520, 708);
}
void calculoson(){
  
}
