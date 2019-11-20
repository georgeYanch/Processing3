class Particle{
  
  PVector pos;
  PVector vel;
  PVector acc;
  float maxspeed = 0.99;
  
  Particle(){
    pos = new PVector((random(width-scl)), (random(height-scl)));
    vel = new PVector(0,0);
    acc = new PVector(0,0);
  }
  
  void update(){
    vel.add(acc);
    pos.add(vel);
    vel.limit(maxspeed);
    acc.mult(0);
  }
  
  void applyForce(PVector force){
    acc.add(force); 
  }
  
  void show(){
    strokeWeight(0.9);
    stroke(51);
    point(pos.x, pos.y);
  }
  
  void edges(){
    if(pos.x > width-scl)  pos.x = scl;
    if(pos.x < 0) pos.x = width-scl;
    if(pos.y > height-scl) pos.y = scl;
    if(pos.y < 0) pos.y = height-scl;
  }
  
  void follow(ArrayList<PVector> flow){
     int x = int(pos.x / scl);
     int y = int(pos.y / scl);
     int ind = x + y * cols;
     PVector force = flow.get((ind));
     applyForce(force);
  }
}
