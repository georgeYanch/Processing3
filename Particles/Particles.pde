Part [] p  = new Part[700];

void setup() {
  size(800,500);
  for(int i = 0; i < p.length; i++){
  p[i] = new Part();
  }
}

void draw() {
  
  background(0);
  pushMatrix();
  stroke(255);
  text(frameRate,25,400);
  popMatrix();
  
  for(int i = 0; i < p.length; i++){
  p[i].colorP(i);  
  p[i].update();
  p[i].show();
  }
  
}
