
float measured=5;
float vref=0.2;
float vactual=1;
int mi =minute()+(hour()*60);
int horario;
float db=40;
int dbaprox;
float reserva=1440;
float factor=1;
float uno =0.7937;
void setup() {
  size(1200, 800);
  print(mi);
  horario=mi;
}
void draw() {
  curba();
  
  vactual=measured;
  db=20*log(vactual/vref);
  mi =minute()+(hour()*60);
  if (mi>horario) {
    horario=mi;
    reserva=reserva-factor;
  }

  if (mi==0) {
    vref = measured;
  }
}
void curba() {
  
  float uno=0.7937;
  float minutos=2;
  dbaprox=round(db);
uno=pow(0.7937,dbaprox);

minutos =(2705659839.93267* uno)*60;
println(minutos+"  y  "+dbaprox);

}
