int scl = 5;
int rows,cols;

float inc = 0.0069;

ArrayList<Particle>list = new ArrayList<Particle>();
ArrayList<PVector>flowfield = new ArrayList<PVector>();


void setup(){
  size(700,700);
  rows = floor(width/scl);
  cols = floor(height/scl);
  
  for(int i = 0; i < 1000; i++){
    list.add(new Particle()); 
  }
  
  for(int i = 0; i < (rows * cols); i++){
    flowfield.add(new PVector()); 
  }
  background(255);
}

void draw(){
  
  float yoff = 0;
  float zoff = 0;

  for(int y = 0; y < cols; y++){
    float xoff = 0;
    for(int x = 0; x < rows; x++){
      int index = (x + y * rows );
      
      float angle = (noise(xoff, yoff, zoff) * TWO_PI * 4);
      PVector v = PVector.fromAngle(angle);
      v.setMag(1);
      flowfield.set(index, v);
      
      xoff += inc;
      //pushMatrix();
      //strokeWeight(1);
      //translate(x * scl, y * scl);
      //rotate(v.heading());
      //line(0, 0, scl, 0);
      //popMatrix();
    }
    yoff += inc;
  }
  zoff += 0.9;
  
  for(Particle p: list){
    p.follow(flowfield);
    p.edges();
    p.update();
    p.show();    
  }
  
  //if(frameCount % 10 == 0) println(frameRate);
}
