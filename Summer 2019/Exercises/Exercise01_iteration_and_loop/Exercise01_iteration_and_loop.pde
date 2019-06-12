/*
Kuan-Ju Wu 6/13/2019
*/
int gridSize = 20;
color[] colors = {#FFB803,#181A07,#02A7B4,#FFFFFF};

void setup(){
  // we'll almost always use the size() command first
  // it sets the size of our window in pixels
  // try changing and see what happens!
  size(800,800);
  
  // colors are (by default) set to red, green, blue (RGB)
  // with these values (0–255) we can create any color
  // the background() command fills the entire screen with
  // a color – try changing the RGB values below

  //background(0); // single values = grayscale!
 
 
 for(int y = 0; y < height; y+=gridSize){
  for(int x = 0; x < width; x+=gridSize){
    
    pushMatrix();
    translate(x+gridSize/2,y+gridSize/2);
    if(x ==0 && y ==0){
      println(x+gridSize/2,y+gridSize/2);
    }
    
    
    noStroke();
    
    color squareColor;
    if(y<height/3){
      squareColor = colors[floor(random(1.3))];
    }else if(y< 2*height/3){
      squareColor = colors[floor(random(2.3))];
    }else{
      squareColor = colors[floor(random(3))];
    }
    
    fill(squareColor);
    drawSquare(gridSize,gridSize);
    fill(colors[floor(random(3))]);
    drawDimond(gridSize,gridSize);
    fill(colors[floor(random(3))]);
    drawCircle(gridSize/3,gridSize/3);
    popMatrix();
  }
 }
 
 
}

void draw(){

}


void drawSquare(float sw, float sh ){
  // rectangles are drawn with four arguments: start X and Y
  // position, then width and height (in pixels)

  rectMode(CENTER);
  rect(0,0,sw,sh);
}

void drawCircle(float cw, float ch){
  // ellipses (including cirlces) also take four arguments,
  // but are drawn from the center X and Y

  ellipse(0,0,cw, ch);
}

void drawDimond(float dw, float dh){
  // a vertex is a point
  // string them together to draw complex shapes
  
  beginShape();
  vertex(0,-dh/2);
  vertex(-dw/2,0);
  vertex(0,dh/2);
  vertex(dw/2,0);
  endShape(CLOSE);
}
