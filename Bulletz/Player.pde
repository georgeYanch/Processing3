
class Player{
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  int round; 
  boolean alive = true;
  
  Player(int round){
    this.round = round;
  }
  
  void shoot(){
    float bulletX = (int)random(width);
    for(int i = 0; i < 3; i++){
      bullets.add(new Bullet(bulletX, 775));
    }
    for(Bullet b: bullets){
      b.direct();
    }
  }
  
  void showBullets(){
    for(Bullet b: bullets){
      if(b.shot){
        b.show();
        b.update();
      }
    }
  }
}
