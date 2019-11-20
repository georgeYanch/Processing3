void keyPressed(){
 if(keyCode == UP){
   loop();
 }
}

void mousePressed(){
  loop();
}

void mouseReleased(){
  noLoop();
}

void setup(){
  size(600,600);
}

void draw(){
  keyPressed();
    
  background(255);
  translate(width/2,height/2);
 // translate(mouseX, mouseY);
 for(float i = 0; i < 20; i+=0.1){
  strokeWeight(2);
  noStroke();
  stroke(random(255),random(255), random(255));
  ellipse(i,0,50,50);
  rotate(0.1);
  
}

for(float i = 0; i < 20; i+=0.1){
  strokeWeight(2);
  noStroke();
  stroke(random(255),random(255), random(255));
  ellipse(i+60,60,50,50);
  rotate(0.1);
}
  for(float i = 0; i < 20; i+=0.1){
  strokeWeight(2);
  noStroke();
  stroke(random(255),random(255), random(255));
  ellipse(i+130,130,50,50);
  rotate(0.1);
}
mouseReleased();
}
