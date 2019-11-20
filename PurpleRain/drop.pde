class Drop{
  float x = random(width);
  float y = random(-500,-50);
  float z = random(0,20);
  float yspeed = map(z, 0 ,20, 3, 8);
  float len = map(z, 0, 20, 10, 20);
  float th = map(z, 0, 20, 1, 3);
  
  void fall() {
    float grav = map(z, 0, 20, 0.01, 0.20);
    y = y + yspeed; 
    yspeed += grav;
    if(y > height){
      y =  random(-70,0);
      yspeed = map(z, 0 ,20, 3, 8);
    }
  } 
  void show() {
    float thick = map(z, 0, 20, 1, 2.5);
    strokeWeight(thick);
    stroke(random(255),random(255),random(226));
    line(x,y,x,y+len);
  }

  
}
