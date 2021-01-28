import processing.io.*;
 ADS1115 adc;

// see setup.png in the sketch folder for wiring details
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
float measured=0;
float suma=0;
int pot=0;
void setup() {
  //printArray(I2C.list());

  
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

  mediavolatil();

  background(255);
  fill(measured * 255);
  ellipse(width/2, height/2, width * 0.75, width * 0.75);
}
void mediavolatil(){
    measured = adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra1=measured;
  if (measured < 0) {

    measured = -measured;
  }
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra2=measured;
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra3=measured;
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra4=measured;
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra5=measured;
  measured=adc.analogRead(0);
  
    if (measured < 0) {

    measured = -measured;
  }
  muestra6=measured;
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra7=measured;
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra8=measured;
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra9=measured;
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra10=measured;
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra11=measured;
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra12=measured;
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra13=measured;
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
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra16=measured;
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra17=measured;
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra18=measured;
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra19=measured;
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra21=measured;
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra22=measured;
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra23=measured;
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra24=measured;
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra25=measured;
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra26=measured;
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra27=measured;
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra28=measured;
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra29=measured;
  measured=adc.analogRead(0);
  if (measured < 0) {

    measured = -measured;
  }
  muestra30=measured;


  suma=muestra1+muestra2+muestra3+muestra4+muestra5+muestra6+muestra7+muestra8+muestra9+muestra10+muestra11+muestra12+muestra13+muestra14+muestra15+muestra16+muestra17+muestra18+muestra19+muestra21+muestra22+muestra23+muestra24+muestra25+muestra26+muestra27+muestra28+muestra29+muestra30;
  pot=round(suma/30);
  println(pot);
}
