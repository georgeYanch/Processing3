
class Box{
  int col;
  int row;
  int hits;
  
  float x;
  float y;
  
  Box(int col, int row, int hits){
    this.col = col;
    this.row = row;
    this.hits = hits;
    
    x = col*scale - scale/2;
    y = row*scale + scale/2;
  }
  
  void show(){
    //rectMode(LEFT);
    noFill();
    stroke(255);
    strokeWeight(3);
    rectMode(CENTER);
    rect(x, y, scale-5,scale-5,5);
  }
  
  void setCol(int col){
    this.col = col;
    x = col*scale - scale/2;
  }
   void setRow(int row){
    this.row = row;
    y = row*scale + scale/2;
    
  }
}
