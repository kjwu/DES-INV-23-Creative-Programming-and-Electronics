/*
drawing inspired by sasj_nl
*/

color[] colors = {#00D9EA,#EAAC00,#FAFAFA,#1C1C1C};
float gridSize = 20;


void setup(){
  size(800,800);
  frameRate(10);
}

void draw(){
    for(float y = gridSize; y<height; y+=gridSize){
    for(float x = gridSize; x<width; x+=gridSize){
      pushMatrix();
      translate(x,y);
      noStroke();
      
      color squareColor;
      if(y < height/3){
        squareColor = colors[floor(random(0,1.3))];
      }else if(y < 2*height/3){
        squareColor = colors[floor(random(0,2.3))];
      }else{
        squareColor = colors[floor(random(0,3.3))];
      }
      
      
      fill(squareColor); //random number 0 - 3.9999

      drawSquare(gridSize,gridSize);
      
      
      
      
      
      fill(colors[floor(random(4))]); //random number 0 - 3.9999
      drawDimond(gridSize,gridSize);
      fill(colors[floor(random(4))]); //random number 0 - 3.9999
      drawCircle(gridSize/2,gridSize/2);

      popMatrix();
      
    }
  }
}

void drawCircle(float cw, float ch){
  ellipse(0,0,cw,ch);
}

void drawSquare(float sw, float sh){
  rectMode(CENTER);
  rect(0,0,sw,sh);
}

void drawDimond(float dw, float dh){
  beginShape();
  vertex(0, -dh/2);
  vertex(-dw/2, 0);
  vertex(0, dh/2);
  vertex(dw/2, 0);
  endShape(CLOSE);
}
