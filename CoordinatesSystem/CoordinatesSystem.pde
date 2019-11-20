

ArrayList<PVector> list = new ArrayList<PVector>();
ArrayList<String>data = new ArrayList<String>();

//scale of the whole moddeling
int step = 15;
int w = width/2;
int h = height/2;


void setup(){
  size(800,600);
    
  String[] str = loadStrings("TblFunc.txt");
  
  for(String s: str){
     String [] str1 = split(s, " ");
     for(String s1: str1){
        data.add(s1);
     }
  } 
    
  for(int i = 0; i < str.length-1; i++){
    float x = parseFloat(data.get(i))*step;
    float y = parseFloat(data.get(i+1))*step;
    list.add(new PVector(x, y));
  }
 
}

void draw(){
  
  background(0);
  
  translate(width/2, height/2);
  stroke(100);
  line(0, -height/2, 0, height/2);
  line(-width/2, 0, width/2, 0);
  
  for(int i = -width/2; i < width/2; i+=step){
    for(int j = - height; j < height; j+=step){
       noFill();
       stroke(51);
       strokeWeight(0.5);
       rect(i,j,step,step); 
    }
  }
  
  for(int i = -width/2; i < width/2; i+=step){
     text(i/step, i, 0);
  }
  for(int i = -height/2; i < height/2; i+=step){
     text(i/step, 0, i);
  }

  for(int i = -width/2; i < width/2; i+=25){
    fill(255);
    ellipse(i,0,4,4);
  }
  
  for(int i = -height/2; i < height/2; i+=25){
    fill(255);
    ellipse(0,i,4,4);
  }
  
  beginShape();
  for(PVector p: list){
    noFill();
    stroke(255);
    strokeWeight(4);
    point(p.x,p.y);
  }
  endShape();
  
}
