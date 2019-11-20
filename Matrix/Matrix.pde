ArrayList<Stream>list = new ArrayList<Stream>();
PFont myFont;
float textSize = 30;
float cell = textSize;

void setup(){
  //size(1200,600);
  fullScreen();
  
  for(int i = 0; i < 100; i++){
   list.add(new Stream()); 
  }
  
  myFont = createFont("MS UI Gothic",textSize);
  textAlign(CENTER,TOP);
  textFont(myFont);
}

void draw(){
  background(0);
  
  for(int i = 0; i < list.size(); i++){
    textSize = map(list.get(i).speed, 2, 8, 15, 30);
    list.get(i).show();
    list.get(i).update();
  }
    
}
