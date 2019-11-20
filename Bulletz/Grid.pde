int cell = 800/scale;

class Grid{
  int round = 0;
  boolean finished = false;
  ArrayList<Box> boxes = new ArrayList<Box>();
  
  void generate(){
    for(int i = (int)random(3); i < random(i, cell+1); i++){
      if(random(1) > 0.8) continue;
      boxes.add(new Box(i,0, round));
    }
  }
  
  void show(){
    for(Box b: boxes){
      b.show();
    }
  }
  
  void update(){
   if(finished){
     for(Box b: boxes){
       b.setRow(b.row);
     }
     generate();
     round++;
     finished = false;
   }
  }
 ArrayList<Box> getBoxes(){
   return boxes;
 }
}
