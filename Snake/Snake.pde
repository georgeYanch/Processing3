int size = 25;
int foodX,foodY;
int len = 2 ;
snake s = new snake();

void setup(){
  size(600,600); 
}

void draw(){
  for(int x = 0; x < width; x+=size){
    for(int y = 0; y < height; y+=size){
      strokeWeight(2);
      stroke(0);
      fill(255);
      rect(x,y,size,size);
    }
  }
  frameRate(7);
  //for(int i = len ; i > 1; i++){
  s.update();
  s.show();
  
}
void locate(){
 foodX = (int)(random(width/25))*25;
 foodY = (int)(random(height/25))*25;
 fill(100,50,255);
 rect(foodX,foodY,size,size);
}
class snake{
  int x = 0,y = 0;
  int xspeed = 25;
  int yspeed = 0;
  
  void update(){
    keyPressed();
    if(x > width) x = 0;
    if(x < -size) x = width;
    if(y > height) y = 0;
    if(y < -size) y = height;
    
    if(eat()) {
      locate();
      len++;
    }
    
    x += xspeed;
    y += yspeed;
  }
  void show(){
   pushMatrix();
   stroke(255);
   fill(0);
   rect(x,y,size,size); 
   popMatrix();
  }
  void keyPressed(){
    switch(keyCode){
     case(UP): xspeed = 0;
               yspeed = -25;
               break;
     case(DOWN): xspeed = 0;
                 yspeed = 25;
                 break;
     case(LEFT): xspeed = -25;
                 yspeed = 0;
                 break;
     case(RIGHT): xspeed = 25;
                  yspeed = 0;
                  break; 
    }//switch
  }//keyPressed
  
boolean eat(){
 return (x == foodX && y == foodY);
}

}//class
