import processing.video.*;

/*
* DES-INV 23 
* Color Tracker (simple)
*/

Capture cam;

color pickedColor;

void setup(){
  size(640,480);
  cam = new Capture(this, 640,480);
  cam.start();
  pickedColor = color(255,0,0);
}

void draw(){
  //if (cam.available() == true) {
  //  cam.read();
  //}
  
  image(cam,0,0);
  cam.loadPixels();

    
  float closestX = 0;
  float closestY = 0;
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
  
  
  fill(255, 204, 0,128);
  ellipse(closestX,closestY,20,20);
  
}

void mouseReleased(){
  pickedColor = get(mouseX,mouseY);
}


void captureEvent(Capture c){
  c.read();
}
