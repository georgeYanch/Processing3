void setup() {
 size(300,300);
 
}
void draw() {
 background(255);
 translate(width/2,height/2);
 
 strokeWeight(10);
 stroke(0);
 ellipse(0,0,200,200);
 for(int i = 0; i < 12; i++){
   ellipse(PI/2*70,0,5,5);
   rotate(TWO_PI/12);
 }
 
 strokeWeight(3);
 stroke(1,250,2);
 float radSec = 360 / 60 * second();
 pushMatrix();
 rotate(radians(radSec));
 line(0,0,0,-95);
 popMatrix();
 
 strokeWeight(5);
 stroke(250,1,2);
 float radMin = 360 / 60 * minute();
 pushMatrix();
 rotate(radians(radMin));
 line(0,0,0,-95);
 popMatrix();
 
 strokeWeight(7);
 stroke(100,100,200);
 float radHr = 360 / 12 * hour();
 pushMatrix();
 rotate(radians(radHr));
 line(0,0,0,-95);
 popMatrix();
}
