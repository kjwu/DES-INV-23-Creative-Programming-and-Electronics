/*
  drawing inspired by sasj_nl
*/
int gridSize = 20;
int cols;
int rows;
float hue;
int  hueDir = 1;

void setup(){
  size(800,800);
  colorMode(HSB, 100);
  frameRate(10);
  cols = int(width/gridSize);
  rows = int(height/gridSize);
  hue = 20;
}

void draw(){
  if(hue>=60 || hue <=0){
    hueDir *= -1;
  }
    
  hue = hue+hueDir;
  
  println(hue);
  
  for(int j = 0; j < rows; j++){
    for(int i = 0; i < cols; i++){
      pushMatrix();
      translate(i*gridSize, j*gridSize);
        float backgrounHue = (map(i+j,0,rows+cols,0,20)+hue)%100;
        fill(random(backgrounHue-20,backgrounHue+20),100,50);
        drawRect();
        fill(random(backgrounHue-30,backgrounHue+10),random(100),random(100));
        drawDimond();
        fill(random(backgrounHue-10,backgrounHue+30),random(100),random(100));
        drawCircle();
      popMatrix();
    
    }
  }
}

void drawRect(){
  rectMode(CENTER);
  noStroke();
  rect(gridSize/2,gridSize/2,gridSize,gridSize);
}

void drawDimond(){
    noStroke();

  beginShape();
  vertex(gridSize/2,0);
  vertex(gridSize,gridSize/2);
  vertex(gridSize/2,gridSize);
  vertex(0,gridSize/2);
  endShape(CLOSE);
}

void drawCircle(){
  noStroke();

  ellipse(gridSize/2,gridSize/2,gridSize/2,gridSize/2);
}
