import peasy.*;
PeasyCam p;

int c = 10;
int v = 10;
int b = 10;
int cols,rows;
int scl = 25;
int w = 3000;   
int h = 1000;
float[][] land;
float fly = 0;


void setup(){
size(1200,700,P3D);
p = new PeasyCam(this, 400);
  keyPressed();

 cols = w / scl;
 rows = h / scl;
 
 land = new float[cols][rows];
}

void draw(){
  fly += 0.055;
  float yoff = fly;
  
 for(int y = 0; y < rows-1; y++){
   float xoff = 0;
    for(int x = 0; x < cols; x++){
      land[x][y] = map(noise(xoff, yoff),0,1,-100,100);
      xoff += 0.15;//(float) mouseX/5000;
    }
    yoff += 0.15;//(float) mouseY/500;
 }
 keyPressed1(); 
 noStroke();
 textSize(50);
 textMode(SHAPE);
 text((float) mouseX/150, -CENTER/2, -CENTER/2);
 text((float) mouseY/150, CENTER, CENTER);
 
 background(0);
 stroke(255);
 fill(c, v, b);
 lights();
 smooth();
 translate(width/2, height/2);
 rotateX(PI/3);
 
 translate(-w/2, -h/2);
 
 for(int y = 0; y < rows-1; y++){
  beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < cols; x++){
     vertex(x*scl, y*scl, land[x][y]); 
     vertex(x*scl, (y+1)*scl, land[x][y+1]); 
    }
    endShape();
 }
 }  
   
void keyPressed(){
 if(keyCode == UP) {
 c += 15;  
 }else if(keyCode == DOWN){
 v += 15; 
 }else if(keyCode == RIGHT){
 b += 15; 
 }else if(keyCode == LEFT){
  c =0;
  v = 0;
  b = 0;
 }
}
void keyPressed1(){
 if(keyCode == ENTER) noLoop(); 
}
