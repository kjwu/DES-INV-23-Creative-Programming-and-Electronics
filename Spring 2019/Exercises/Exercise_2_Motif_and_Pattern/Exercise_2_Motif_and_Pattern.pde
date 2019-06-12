/*
 Exercis 2 Motif and Pattern
 Jan 29 2019 Kuan-Ju Wu
 
 ***This is multilines comment
 ***There are some single line comments below starting with "//"

*/

//Here we declare some variables:

float motifWidth = 100;
float motifHeight = 100;


void setup(){
  size(800,800);
  background(#1C1C18);

  // go row-by-row all the way down
  for(int y = 0 ; y<height; y+=motifHeight){
    // in each row, draw squares across the screen
    for(int x =0; x<width; x+=motifWidth){
      
      // go into "local" mode at the current x,y coordinate
      pushMatrix();
      translate(x,y);
      drawMotif(x/5+y/5);
      
      // pop back and continue the for loop
      popMatrix();
    }
  }
}

void drawMotif(float degree){
  
  //Switch the rectMode to CENTER instead of the default CORNER
  noStroke();
  fill(#f3642d);
  rectMode(CENTER);
  rect(motifWidth/2,motifHeight/2,motifWidth/2,motifHeight/2);

  //gradient of the circles
  for(int i =1; i<6; i++){
    fill(249,183,75,50);
    ellipse(motifWidth/2, motifHeight/2, motifWidth/3+i*10,motifHeight/3+i*10);
  }

  fill(#f9b74b);
  ellipse(motifWidth/2, motifHeight/2, motifWidth/3,motifHeight/3);
  
  //triangles at the corners
  fill(#fc3394);
  triangle(0,motifHeight/3, 0,0, motifWidth/3,0);
  triangle(2*motifWidth/3,0 ,motifWidth,0 , motifWidth, motifHeight/3 );
  triangle(motifWidth,2*motifHeight/3, motifWidth, motifHeight,2*motifWidth/3,motifHeight );
  triangle(0,2*motifHeight/3, 0,motifHeight, motifWidth/3, motifHeight);


  //draw the arrow and rotate them
  pushMatrix();
  translate(motifWidth/2,motifHeight/2);
  rotate(radians(degree));
  beginShape();
  fill(#1cc9b3);
  vertex(20,20);
  vertex(80,20);
  vertex(40,30);
  vertex(40,80);
  vertex(20,20);
  endShape();
  popMatrix();

}
