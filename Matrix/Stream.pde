class Stream{
 
 int katakana = 96;
 float x = floor(random(round(width/textSize))) * textSize;
 float y = random(-800,-15);
 float speed = random(6,12);
 char c = (char)(0x30A0 + round(random(96)));
 ArrayList<Character> str = new ArrayList<Character>(); 

 void generateStr(){
   str.clear();
   for(int i = 0; i < round(random(5,15)); i++){
     str.add((char)(0x30A0 + round(random(katakana))));
   }
 }
 
 void refreshStr(){
   for(int i = 0; i < str.size(); i++){
     if(str.get(i) != ' ')
     str.set(i, (char)(0x30A0 + round(random(katakana))));
   }
 }
 
 void show(){
  fill(200,255,170);
  text(c, x, y); 
  fill(0,255,0);
  showStr();
 }
 
 void showStr(){
   for(int i = 0; i < str.size(); i++){
     if(str.get(i) != ' ')
     text(str.get(i), x, (y-(textSize*i)-textSize));
   }
 }
 
 void update(){
  if(y - textSize * str.size() > height) {
    y = random(-50,-5);
    generateStr();
    speed = random(2,8);
  }
  
  if(frameCount < 2) generateStr();
  y += speed;
  
  if(frameCount % 5 == 0) {
    c = (char)(0x30A0 + round(random(katakana)));
    refreshStr();
  }
 }
  
  
  
}
