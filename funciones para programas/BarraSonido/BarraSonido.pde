
float n = 90;
color red = color(255,0,0);
color green = color(0,255,0);
color yellow = color(255,255,0);
int squareX = 250;
int squareY = 350;

void setup(){
  size(800,800);
  colorMode(HSB,255,100,100);


}


void draw(){
  background(100);
  stroke (0);
  strokeWeight(0);
  fill(200);
  rect(squareX, squareY ,300,100);
  
  
 
 
  
  if (mouseX <= 550){
  for (float x = squareX; x < mouseX; x++) {
    strokeWeight(1);
    float a = x - 250;
    n = map(a, 0, 300, 90, 0);
    
    stroke(n, 100, 100);
    line(x, squareY, x, 450);
    
    println(n);
  }    
  
}
}
