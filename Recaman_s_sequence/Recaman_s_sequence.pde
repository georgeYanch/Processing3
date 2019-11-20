import peasy.*;

boolean[] numbers = new boolean[1000000];
int[] sequence = new int[1000000];
int index = 0;
int count = 1;
int i = 1;
float diameter = 0;

void step(){
  int next = index - count;
  if(next < 0 || numbers[next]){
   next = index + count; 
  }
  numbers[next] = true;
  diameter = next - index;
  stroke(random(100,255), random(20,255), random(0, 255), 100);
  strokeWeight(2);
  noFill();
  int x = (next + index)/2;
  ellipse(x, height/2, diameter/2, diameter/2);
  
  index = next;
  count++;
  i++;
  print(next, ' ');
}

void setup(){
  PeasyCam p = new PeasyCam(this, 400);
  size(1200,600);
  background(0);
  numbers[index] = true;
  
}
void keyPressed(){
 noLoop(); 
}
void draw(){
  step();
}
