import processing.io.*;//importa biblioteca de prcessing en el programa
ADS1115 adc;//crea variable abc de la familia de la biblioteca

//muestras para hacer la media de un segundo
float muestra1=0;
float muestra2=0;
float muestra3=0;
float muestra4=0;
float muestra5=0;
float muestra6=0;
float muestra7=0;
float muestra8=0;
float muestra9=0;
float muestra10=0;
float muestra11=0;
float muestra12=0;
float muestra13=0;
float muestra14=0;
float muestra15=0;
float muestra16=0;
float muestra17=0;
float muestra18=0;
float muestra19=0;
float muestra20=0;
float muestra21=0;
float muestra22=0;
float muestra23=0;
float muestra24=0;
float muestra25=0;
float muestra26=0;
float muestra27=0;
float muestra28=0;
float muestra29=0;
float muestra30=0;
float media1=0;
float media2=0;
float media3=0;
float media4=0;
float media5=0;
float media6=0;
float media7=0;
float media8=0;
float media9=0;
float media10=0;
//variable actualizable de señal de entrada
float measured=0;
//variables para calculo de DB (pot)
float suma=0;
float V1=0;
float V2=7;
float pot=0;
//variables de interfaz
PFont tex;
float H;
int hora1=0;
int min1=0;
int hora2=0;
int min2=0;
float red1=0;
float green1=255;
float red2 =255;
float green2 =0;
float minutosreales;
float TiempoR;
float uno=0.7937;
float seg=2;
float mi =second()+(minute()*60)+(hour()*3600);
float porciento=1;
float cuant=0;
int P=10;
void setup() {
  fullScreen();//pantalla completa
  //size(1280, 800);
  colorMode(RGB, 100);//funcion de color en rgb para facilitar los calculos
  printArray(PFont.list());//añadir lista de fuentes
  tex= createFont("Cambria-Bold-48.vlw", 48);//escoger fuente
  textFont(tex);// utilizar fuente escogida en siguientes textos



  adc = new ADS1115("i2c-1", 0x48);

  // this sets the measuring range to +/- 4.096 Volts
  // other ranges supported by this chip:
  // INTERNAL_6V144, INTERNAL_2V048, INTERNAL_1V024,
  // INTERNAL_0V512, INTERNAL_0V256
  adc.analogReference(ADS1X15.INTERNAL_6V144);

  // Important: do not attempt to measure voltages higher than
  // the supply voltage (VCC) + 0.3V, meaning that 3.6V is the
  // absolut maximum voltage on the Raspberry Pi. This is
  // irrespective of the analogReference() setting above.
}

void draw() {
  //recoge medidas para utilizar mas adelante
  mediavolatil();
  //superpone las partes estaticas del fondo para crear la estetica deseada
  fondo_estatico();
//combersor de DBSPL (DBA) en tiempo
  curvasimple();
  //combertidor del tiempo directo restante y mostrarlo apropiadamente
  exposicionrestante();
  //acumulador sonoro para exposicion sertante en jornada
  acumulador();
  //combertidor del tiempo acumulado restante y mostrarlo apropiadamente
  mostraracumulador();
  //muestra la peligrosidad en tonos de color de verde a rojo tiñiendo los numeros
  colores();
}
void mediavolatil() {
  /*
  actualiza la variable measured y de ser negativa le cambia de signo para
   ir cargando el valor resultante en la lista de variables de muestra.
   */
  measured = adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra1=measured;
  delay(P);
  if (measured < 0) {

    measured = -measured;
  }
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra2=measured;
  delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra3=measured;
  delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
    //calcula la media de las variables cargadas para hacer una progresion
  suma=muestra1+muestra2+muestra3+muestra4+muestra5+muestra6+muestra7+muestra8+muestra9+muestra10+muestra11+muestra12+muestra13+muestra14+muestra15+muestra16+muestra17+muestra18+muestra19+muestra20+muestra21+muestra22+muestra23+muestra24+muestra25+muestra26+muestra27+muestra28+muestra29+muestra30;
  media1=round(suma/30);
  muestra4=measured;
  delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra5=measured;
  delay(P);
  measured=adc.analogRead(0);

  if (measured < 0) {

    measured = -measured;
  }

  muestra6=measured;
  delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
    //calcula la media de las variables cargadas para hacer una progresion
  suma=muestra1+muestra2+muestra3+muestra4+muestra5+muestra6+muestra7+muestra8+muestra9+muestra10+muestra11+muestra12+muestra13+muestra14+muestra15+muestra16+muestra17+muestra18+muestra19+muestra20+muestra21+muestra22+muestra23+muestra24+muestra25+muestra26+muestra27+muestra28+muestra29+muestra30;
  media2=round(suma/30);
  muestra7=measured;
    delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra8=measured;
    delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra9=measured;
    delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
    //calcula la media de las variables cargadas para hacer una progresion
  suma=muestra1+muestra2+muestra3+muestra4+muestra5+muestra6+muestra7+muestra8+muestra9+muestra10+muestra11+muestra12+muestra13+muestra14+muestra15+muestra16+muestra17+muestra18+muestra19+muestra20+muestra21+muestra22+muestra23+muestra24+muestra25+muestra26+muestra27+muestra28+muestra29+muestra30;
  media3=round(suma/30);
  muestra10=measured;
    delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra11=measured;
    delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra12=measured;
    delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
    //calcula la media de las variables cargadas para hacer una progresion
  suma=muestra1+muestra2+muestra3+muestra4+muestra5+muestra6+muestra7+muestra8+muestra9+muestra10+muestra11+muestra12+muestra13+muestra14+muestra15+muestra16+muestra17+muestra18+muestra19+muestra20+muestra21+muestra22+muestra23+muestra24+muestra25+muestra26+muestra27+muestra28+muestra29+muestra30;
  media4=round(suma/30);
  muestra13=measured;
    delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra14=measured;
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra15=measured;
    delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  //calcula la media de las variables cargadas para hacer una progresion
  suma=muestra1+muestra2+muestra3+muestra4+muestra5+muestra6+muestra7+muestra8+muestra9+muestra10+muestra11+muestra12+muestra13+muestra14+muestra15+muestra16+muestra17+muestra18+muestra19+muestra20+muestra21+muestra22+muestra23+muestra24+muestra25+muestra26+muestra27+muestra28+muestra29+muestra30;
  media5=round(suma/30);
  muestra16=measured;
    delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra17=measured;
    delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra18=measured;
    delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
    //calcula la media de las variables cargadas para hacer una progresion
  suma=muestra1+muestra2+muestra3+muestra4+muestra5+muestra6+muestra7+muestra8+muestra9+muestra10+muestra11+muestra12+muestra13+muestra14+muestra15+muestra16+muestra17+muestra18+muestra19+muestra20+muestra21+muestra22+muestra23+muestra24+muestra25+muestra26+muestra27+muestra28+muestra29+muestra30;
  media6=round(suma/30);
  muestra19=measured;
    delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra20=measured;
    delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra21=measured;
    delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
    //calcula la media de las variables cargadas para hacer una progresion
  suma=muestra1+muestra2+muestra3+muestra4+muestra5+muestra6+muestra7+muestra8+muestra9+muestra10+muestra11+muestra12+muestra13+muestra14+muestra15+muestra16+muestra17+muestra18+muestra19+muestra20+muestra21+muestra22+muestra23+muestra24+muestra25+muestra26+muestra27+muestra28+muestra29+muestra30;
  media7=round(suma/30);
  muestra22=measured;
    delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra23=measured;
    delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra24=measured;
    delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
    //calcula la media de las variables cargadas para hacer una progresion
  suma=muestra1+muestra2+muestra3+muestra4+muestra5+muestra6+muestra7+muestra8+muestra9+muestra10+muestra11+muestra12+muestra13+muestra14+muestra15+muestra16+muestra17+muestra18+muestra19+muestra20+muestra21+muestra22+muestra23+muestra24+muestra25+muestra26+muestra27+muestra28+muestra29+muestra30;
  media7=round(suma/30);
  muestra25=measured;
    delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra26=measured;
    delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra27=measured;
    delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
    //calcula la media de las variables cargadas para hacer una progresion
  suma=muestra1+muestra2+muestra3+muestra4+muestra5+muestra6+muestra7+muestra8+muestra9+muestra10+muestra11+muestra12+muestra13+muestra14+muestra15+muestra16+muestra17+muestra18+muestra19+muestra20+muestra21+muestra22+muestra23+muestra24+muestra25+muestra26+muestra27+muestra28+muestra29+muestra30;
  media8=round(suma/30);
  muestra28=measured;
    delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra29=measured;
    delay(P);
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra30=measured;
    delay(P);

  //saca la media de las muestras 
  suma=muestra1+muestra2+muestra3+muestra4+muestra5+muestra6+muestra7+muestra8+muestra9+muestra10+muestra11+muestra12+muestra13+muestra14+muestra15+muestra16+muestra17+muestra18+muestra19+muestra20+muestra21+muestra22+muestra23+muestra24+muestra25+muestra26+muestra27+muestra28+muestra29+muestra30;
  media9=round(suma/30);
  //calculo con las referencias calculadas y las la medidad del ruido
  V1=(media1+media2+media3+media4+media5+media6+media7+media8+media9)/9;
  pot= 20*(log(V1/V2));
  println(pot);
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
void acumulador() {//acumula el tiempo de exposicion restante
  float cuanto=0;

  mi =second()+(minute()*60)+(hour()*3600);
  if (mi>cuanto) {
    porciento = porciento+1;
    cuanto=mi;

    TiempoR=(H*3600)-(porciento/60);
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
    hora2=round((TiempoR/3600)-0.5);
    text(hora2+"H", 390, 590);
    min2=round(TiempoR/60);
    text((min2-(hora2*60))+"min", 620, 590);
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
