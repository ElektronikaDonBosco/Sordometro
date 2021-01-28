float pot=mouseY;
PFont tex;
float H;
int hora1;
int min1;
int hora2;
int min2;
float red1=0;
float green1=255;
float red2 =255;
float green2 =0;
float minutosreales;
float TiempoR;
float uno=0.7937;
float seg=2;
int mi =minute()+(hour()*360);
float cuant;
void setup() {
  fullScreen();
  //size(1280, 800);
  colorMode(RGB, 100);
  printArray(PFont.list());
  tex= createFont("Cambria-Bold-48.vlw", 48);
  textFont(tex);
}
void draw() {
  pot=mouseY;
  fondo_estatico();
  curvasimple();
  exposicionrestante();
  acumulador();
  mostraracumulador();
  colores();
}
void exposicionrestante() {
  int db=round(pot);
  textSize(100);
  fill(red1, green1, 0);
  text("DB=  "+db, 180, 255);
  if (H<=1) {
    fill(red1, green1, 0);
    textSize(50);
    minutosreales=H*60;
    min1=round(minutosreales);
    text(min1+"min", 970, 235);
    hora1=0;
    text(hora1+"H", 880, 235);
  }
  if ((H>1)&&(H<48)) {
    hora1=round(H-0.5);
    fill(red1, green1, 0);
    textSize(50);
    text(hora1+"H", 880, 235);
    minutosreales=(H*60)-(hora1*60);
    min1=round(minutosreales);
    text(min1+"min", 970, 235);
  }
  if (H>48) {
    fill(red1, green1, 0);
    textSize(50);
    text("SIN RIESGO", 845, 235);
  }
}
void fondo_estatico() {
  background(0, 0, 0);
  //rectangolo arriba1
  strokeWeight(5);
  fill(0, 0, 30);
  stroke(80, 80, 100);
  rect(130, 100, 650, 230, 17);
  //rectangolo arriba2
  strokeWeight(5);
  fill(0, 0, 30);
  stroke(80, 80, 100);
  rect(830, 100, 320, 230, 17);
  //rectangulo abajo
  strokeWeight(5);
  fill(0, 0, 30);
  stroke(80, 80, 100);
  rect(130, 430, 1015, 230, 17);
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
void curvasimple() {//curca de combersion de DBSPL anTIEMPO
  float uno=0.7937;
  uno=pow(0.7937, pot);
  H=(2705659839.93267* uno);
}
void acumulador() {
  float porciento=1/86400;
  mi =second()+(minute()*60)+(hour()*3600);
  if (mi>cuant ) {
    porciento = porciento+(1/86400);
    cuant=mi;
    uno=pow(0.7937, pot);
    seg =(2705659839.93267* uno)*3600;
    TiempoR=seg-(porciento*seg);
  }
  if ((mi<2)&&(mi>86398)) {
    porciento=(1/86400);
  }
}
void mostraracumulador() {
  fill(red2, green2, 0);
  textSize(130);
  if (TiempoR<=0) {
    hora2=0;
    text(0+"H", 390, 590);
    min2=0;
    text(0+"min", 620, 590);
  }
  if ((TiempoR>0)&&(TiempoR<356400)) {
    hora2=round((TiempoR/3600)+0.5);
    text(hora2+"H", 390, 590);
    min2=round(TiempoR/60);
    text((-1*(min2-(hora2*60)))+"min", 620, 590);
  }

  if (TiempoR>356400) {
    hora2=99;
    text(99+"H", 390, 590);
    min2=59;
    text(59+"min", 620, 590);
  }
}
void colores() {
  red1=255-(H*15);
  green1=(H*15);
  red2=255-((TiempoR/3600)*15);
  green2=((TiempoR/3600)*15);
}
