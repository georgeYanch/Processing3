void setup(){
  size(600,600);
}

void draw(){
  background(0);
  translate(width/2, height/2);
  for(float a = 0; a < 100; a += 0.1){
    
  float k = 13;
  float r = 200*cos(k*a);
  float x = r * cos(a);
  float y = r * sin(a);
  
  stroke(random(255), random(255), random(255));
  strokeWeight(0.5);
  ellipse(x,y,10,10);
  
  if(a % 10 == 0)
  rotate(PI/2); 

  }
}
