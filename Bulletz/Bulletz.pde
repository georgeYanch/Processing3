int scale = 100;

Grid grid;
Player player;

void setup(){
  size(800,800);
  grid = new Grid();
  grid.generate();
  
  player = new Player(8);
  
}

void draw(){
  background(0);
  grid.show();
  grid.update();
  player.showBullets();
  
for(Bullet b: player.bullets){
    for(Box box: grid.getBoxes()){
      b.collide(box);
    }
  }
}

void mousePressed(){
  grid.finished = true;
  player.shoot();
}
