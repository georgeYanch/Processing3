import peasy.*;

float x = 1;
 float y = 0;
  float z = 0;
   float a = 10;
   float b = 28;
  float c = 8.0/3.0;
 float dt = 0.01;
int i = 0, j = 0, k = 0;

PVector p;
PeasyCam cam;
ArrayList<PVector> arr = new ArrayList<PVector>();

void setup(){
  size(600,600,P3D);
  cam = new PeasyCam(this,100);
  colorMode(HSB);
}

void draw(){

  background(0);
  float dx = (a*(y - x))*dt;
  float dy = (x*(b - z) - y)*dt;
  float dz = (x*y - c*z)*dt;
  x += dx;
  y += dy;
  z += dz;
  arr.add(new PVector(x,y,z));
  
  noFill();
  translate(0, 0, -80);
  scale(2);
  
  float hue = 0;
  
  beginShape();
   for(PVector p : arr){
      vertex(p.x,p.y,p.z);
      stroke(hue, 255, 255);
      hue += 0.1;
      if(hue > 255) hue = 0;
   }
  endShape();
 }
