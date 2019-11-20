
Drop [] drops = new Drop[500];

void setup() {
  size(1000,600);
  for(int i = 0; i < drops.length; i++){
  drops[i] = new Drop();
  }
}
void draw() {
  background(mouseX * 0.2, 50, mouseY * 0.2);         //230,230,250
   for(int i = 0; i < drops.length; i++){
   drops[i].fall();
   drops[i].show();
  }
}
