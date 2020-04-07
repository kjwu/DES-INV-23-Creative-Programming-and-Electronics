/*

*/
float gridSize = 50;

void setup(){
  size(800,800);
  background(0);

  for(float y = 0; y<height; y+=gridSize){
    for(float x = 0; x<width; x+=gridSize){
      pushMatrix();
      translate(x,y);
      float randomNum = random(1);
      if(randomNum>0.5){
        drawPattern1();
      }else{
        drawPattern2();
      }
      popMatrix();
    }
  }
}

void draw(){

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
