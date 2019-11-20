
class Bullet{
  PVector pos;
  PVector dir;
  
  float speedX = 8;
  float speedY = 8;
  
  boolean shot = false;
  
  Bullet(float x, float y){
    pos = new PVector(x,y);
  }
  
  void show(){
    fill(255);
    stroke(255);
    strokeWeight(1);
    ellipse(pos.x, pos.y, 10,10); 
  }
  
  void update(){
    pos.x += dir.x * speedX;
    pos.y += dir.y * speedY;
  }
  
  void direct(){
    dir = new PVector(mouseX - pos.x, mouseY - pos.y).normalize();
    shot = true;
  }
  
  void collide(Box b){
      walls();
      float dist = (sqrt(2)*scale)/2;

    //print(dist + ": dist  " + pos.x + ":pos.x " + pos.y + ":pos.y " + b.x + ":b.x " + b.y + ":b.y " + scale + ":scale ");

      if((abs(pos.x - b.x) >=0 && abs(pos.x - b.x) < scale/2) || 
         (abs(pos.x - b.x) >= scale/2 && abs(pos.x - b.x) < scale)){
        if(pos.y < b.y + scale + 2 || pos.y > b.y - scale - 2){ 
          speedY *=-1;
        }
      //}else if(pos.y > b.y - dist){
      //  speedY *=-1;
      //}else if(pos.x < b.x - dist){
      //  speedX *=-1;
      //}else if(pos.x > b.x + dist){
      //  speedX *=-1;
      }
  }
  
    void walls(){
      if(pos.y < 5){
        speedY *= -1; 
      }else if(pos.y > height - 5){
        speedY *= -1; 
        shot = false;
      }else if(pos.x < 5){
        speedX *= -1; 
      }else if(pos.x > width - 5){
        speedX *= -1;
      }
    
    //print(speedX + "  " + speedY + " || ");
   
  }
  
}
