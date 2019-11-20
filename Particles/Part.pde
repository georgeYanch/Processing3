class Part{
  
float x = mouseX;
float y = mouseY;
float vx = random(-4,4);
float vy = random(-7,-2);
float r = random(-10, 7);

  void show(){
    if(y < -height){
      y = mouseY;
      x = mouseX;
    }
    
    noStroke();
    strokeWeight(2);
    ellipse(x, y, 25 + r, 25 + r);
  }
  
  void update(){  
    x += vx;
    y += vy;
  } 
  
  void colorP(int arg){
    fill((arg),(arg),(arg));   
  }
}
