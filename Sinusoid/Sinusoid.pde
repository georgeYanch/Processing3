float time = 0;
float j = 0;
float x,y,xl=100;
float xspeed = 0.5;
float r = 100;
FloatList wave = new FloatList();
int index = 0;
void setup(){
  size(600,600);
}

void draw(){
  translate(width/2+r,height/2);

  background(0);
  noFill();
  ellipse(0,0,r*2,r*2);
  stroke(255);
  strokeWeight(2);
  
  x = r*cos(time);
  y = r*sin(time);
  
  wave.set(index,y);
  index++;
  line(0,0,x,y);
  fill(255);
  ellipse(x,y,10,10);
  
  translate(-250,0);
  line(x+150,y,0,wave.get(index-1));
  beginShape();
  noFill();
  for(float i = wave.size()-1; i > 0; i--){
   //if(i > width-200) continue;
   vertex(i,wave.get((int)i));
  }
  endShape();
  
  xl+=xspeed;
  time-=0.05;
}
