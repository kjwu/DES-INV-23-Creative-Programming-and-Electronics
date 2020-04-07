/*

*/
float gridSize = 50;
int cols;
int rows;
int tags[];

void setup(){
  size(800,800);
  frameRate(10);
  cols = int(width/gridSize);
  rows = int(height/gridSize);
  tags = new int[cols*rows];
  for(int i = 0 ; i < tags.length; i++){
    tags[i]=1;
  }
  
}

void draw(){
    background(0);

  for(int j = 0; j<rows; j++){
    for(int i = 0; i<cols; i++){
      pushMatrix();
      translate(i*gridSize,j*gridSize);
      

      if(tags[j*cols+i] == 1){
        if(random(1)>0.9){
          tags[j*cols+i] = 2;
          drawPattern2();
        }else{
          drawPattern1();
        }
      }else{
        drawPattern2();
      }
      popMatrix();
    }
  }
}

void drawPattern1(){
  noFill();
  stroke(255);
  strokeWeight(3);
  arc(0,0,gridSize,gridSize,0,HALF_PI,OPEN);
  arc(gridSize,gridSize,gridSize,gridSize,PI,PI+HALF_PI,OPEN);
}

void drawPattern2(){
  noFill();
  stroke(255);
  strokeWeight(3);
  arc(gridSize,0,gridSize,gridSize,HALF_PI,PI,OPEN);
  arc(0,gridSize,gridSize,gridSize,PI+HALF_PI,TWO_PI,OPEN);
}
