/*
  drawing inspired by sasj_nl
*/
int gridSize = 20;
color[] colors = {#BC3737,#FFC82E,#FFFFFF,#030200};
int cols;
int rows;

void setup(){
  size(800,800);
  cols = int(width/gridSize);
  rows = int(height/gridSize);

  for(int j = 0; j < rows; j++){
    for(int i = 0; i < cols; i++){
      pushMatrix();
      translate(i*gridSize, j*gridSize);
        drawRect();
        drawDimond();
        drawCircle();
      popMatrix();
    
    }
  }

}

void draw(){
}

void drawRect(){
  rectMode(CENTER);
  noStroke();
  fill(colors[floor(random(4))]);
  rect(gridSize/2,gridSize/2,gridSize,gridSize);
}

void drawDimond(){
  fill(colors[floor(random(4))]);
  beginShape();
  vertex(gridSize/2,0);
  vertex(gridSize,gridSize/2);
  vertex(gridSize/2,gridSize);
  vertex(0,gridSize/2);
  endShape(CLOSE);
}

void drawCircle(){
  fill(colors[floor(random(4))]);
  ellipse(gridSize/2,gridSize/2,gridSize/2,gridSize/2);
}
