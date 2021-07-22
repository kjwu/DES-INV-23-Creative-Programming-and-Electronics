import processing.video.*;

/*
* DES-INV 23 
* Color Tracker (simple)
*/

Capture cam;

color pickedColor;
int cols;
int rows;
float[][] current;// = new float[cols][rows];
float[][] previous;// = new float[cols][rows];

float dampening = 0.99;
boolean colorSelected = false;
float closestX = 0;
float closestY = 0;

void setup(){
  size(640,480);
  cam = new Capture(this, 640,480);
  cam.start();
  pickedColor = color(255,0,0);
    cols = width;
  rows = height;
  current = new float[cols][rows];
  previous = new float[cols][rows];
}

void draw(){
  //if (cam.available() == true) {
  //  cam.read();
  //}
  
  
  cam.loadPixels();

    
  closestX = 0;
  closestY = 0;
  float worldRecord = 500;

  for(int y = 0 ; y < cam.height; y++){
    for(int x =0; x < cam.width; x++){
      
      int loc = y*cam.width+x;
      color currentColor = cam.pixels[loc];
      
      float r1 = red(currentColor);
      float g1 = green(currentColor);
      float b1 = blue(currentColor);
      float r2 = red(pickedColor);
      float g2 = green(pickedColor);
      float b2 = blue(pickedColor);
      
      float colorDistance = dist(r1,g1,b1,r2,g2,b2);
      if(colorDistance<worldRecord){
        worldRecord = colorDistance;
        closestX = x;
        closestY = y;

      }
    }
  }
  
  

  
  if(colorSelected == false){
    image(cam,0,0);
  }else{
  
  background(0);
  previous[closestX][closestY] = 500;

    
    loadPixels();
    for (int i = 1; i < cols-1; i++) {
      for (int j = 1; j < rows-1; j++) {
        current[i][j] = (
          previous[i-1][j] + 
          previous[i+1][j] +
          previous[i][j-1] + 
          previous[i][j+1]) / 2 -
          current[i][j];
        current[i][j] = current[i][j] * dampening;
        int index = i + j * cols;
        pixels[index] = color(current[i][j],20);
      }
    }
    updatePixels();
  
    float[][] temp = previous;
    previous = current;
    current = temp;
  }
  
  //show tracking point
  fill(255, 204, 0,128);
  ellipse(closestX,closestY,20,20);
}

void mouseReleased(){
  pickedColor = get(mouseX,mouseY);
  colorSelected = true;
}


void captureEvent(Capture c){
  c.read();
}
