void setup(){
  size(800,600);
}

void draw(){
  background(0);
  translate(width/2, height/2);
  for(float a = 0; a < 400; a += 0.18){
  float k = 0;
  k = k + int (mouseY/5);
  float r = 250 * cos(k*a);
  float x = r * cos(a);
  float y = r * sin(a);

  strokeWeight(2.9);
  stroke(random(255),random(255),random(255));
  point(x,y);
  }
 }
 
 void keyPressed(){
  if(keyCode == UP){
    
  }}
