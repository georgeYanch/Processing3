// Size of cells
int cellSize = 6;
int generation = 0;
int alives = 0;

float probabilityOfAliveAtStart = 25;

int interval = 100;
int lastRecordedTime = 0;

color alive = color(255, 200, 0);
color dead = color(0);

int[][] cells; 
int[][] cellsBuffer; 

// Pause
boolean pause = false;

void setup() {
  fullScreen();

  cells = new int[width/cellSize][height/cellSize];
  cellsBuffer = new int[width/cellSize][height/cellSize];

  // Background
  stroke(0);

  smooth();

  // Initialization
  for (int x=0; x<width/cellSize; x++) {
    for (int y=0; y<height/cellSize; y++) {
      float state = random (100);
      if (state > probabilityOfAliveAtStart) { 
        state = 0;
      }
      else {
        state = 1;
      }
      cells[x][y] = int(state); 
    }
  }
  background(0); 
}


void draw() {

  for (int x=0; x<width/cellSize; x++) {
    for (int y=0; y<height/cellSize; y++) {
      if (cells[x][y]==1) {
        fill(alive); 
      }
      else {
        fill(dead); 
      }
      rect (x*cellSize, y*cellSize, cellSize, cellSize);
    }
  }
  if (millis()-lastRecordedTime>interval) {
    if (!pause) {
      for(int i = 0; i < 2;i++)
      iteration();
      pushMatrix();
       textSize(30);
         fill(255);
  for (int x=0; x<width/cellSize; x++) {
      for (int y=0; y<height/cellSize; y++) {
        if(cells[x][y] == 1) alives++;
      }
    }
  text("Живые: " + (int)alives/5, 40,660);
  text("Поколение: " + generation, 40,690);
  text("Кадры/сек: " +  (long)frameRate, 40,720);

  popMatrix();
  
  alives = 0;
      lastRecordedTime = millis();
    }
  }

  if (pause && mousePressed) {
    int xCellOver = int(map(mouseX, 0, width, 0, width/cellSize));
    xCellOver = constrain(xCellOver, 0, width/cellSize-1);
    int yCellOver = int(map(mouseY, 0, height, 0, height/cellSize));
    yCellOver = constrain(yCellOver, 0, height/cellSize-1);

    if (cellsBuffer[xCellOver][yCellOver]==1) { 
      cells[xCellOver][yCellOver]=0; 
      fill(dead); 
    }
    else { 
      cells[xCellOver][yCellOver]=1; 
      fill(alive); 
    }
  } 
  else if (pause && !mousePressed) { 
    for (int x=0; x<width/cellSize; x++) {
      for (int y=0; y<height/cellSize; y++) {
        cellsBuffer[x][y] = cells[x][y];
      }
    }
  }
}



void iteration() { 
  for (int x=0; x<width/cellSize; x++) {
    for (int y=0; y<height/cellSize; y++) {
      cellsBuffer[x][y] = cells[x][y];
    }
  }
  for (int x=0; x<width/cellSize; x++) {
    for (int y=0; y<height/cellSize; y++) {
     int neighbours = 0; 
      for (int xx=x-1; xx<=x+1;xx++) {
        for (int yy=y-1; yy<=y+1;yy++) {  
          if (((xx>=0)&&(xx<width/cellSize))&&((yy>=0)&&(yy<height/cellSize))) { 
            if (!((xx==x)&&(yy==y))) { 
              if (cellsBuffer[xx][yy]==1){
                neighbours ++; 
              }
            } 
          } 
        } 
      } 
      
      if (cellsBuffer[x][y]==1) { 
        if (neighbours < 2 || neighbours > 3) {
          cells[x][y] = 0; 
        }
      } 
      else {    
        if (neighbours == 3 ) {
          cells[x][y] = 1; 
        }
      } 
    } 
  } 
  generation++;
} 

void keyPressed() {
  if (key=='r' || key == 'R') {
    generation = 0;
    for (int x=0; x<width/cellSize; x++) {
      for (int y=0; y<height/cellSize; y++) {
        float state = random (100);
        if (state > probabilityOfAliveAtStart) {
          state = 0;
        }
        else {
          state = 1;
        }
        cells[x][y] = int(state); 
      }
    }
  }
  if (key==' ') { 
    pause = !pause;
  }
  if (key=='c' || key == 'C') { 
    for (int x=0; x<width/cellSize; x++) {
      for (int y=0; y<height/cellSize; y++) {
        cells[x][y] = 0; 
      }
    }
  }
}
