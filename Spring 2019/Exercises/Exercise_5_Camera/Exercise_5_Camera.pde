/*
* Exercise 5 Camera 
* Feb 19 2019
* Kuan-Ju Wu
*/

// Step 1. Import the video library
import processing.video.*;

// Step 2. Declare a Capture object
Capture cam; 

PImage img;

void setup(){
  size(640, 480);

  // Step 3. Initialize Capture object via Constructor
  //The reference will show there are several ways
  //to call the Capture constructor. A typical way 
  //to call the constructor is with three arguments:
  //1."this" refers to the instance of a class in which the word this appears.
  //2.width of the video.
  //3.height of the video.
  cam = new Capture(this, 640,480);
  cam.start();
}

// An event for when a new frame is available
void captureEvent(Capture video) {
  // Step 4. Read the image from the camera.  
  video.read();
}


void draw(){
/**************Mode 1************/
  ////background(255);
  //tint(mouseX,mouseY,255);
  //pushMatrix();
  //translate(width/2, height/2);  
  //imageMode(CENTER);  
  //image(cam, 0, 0, mouseX, mouseY);
  //popMatrix();

/**************Mode 2************/

  loadPixels();
  cam.loadPixels();
  for(int x = 0 ; x < cam.width; x ++){
    for(int y = 0 ; y < cam.height ; y++){
      // Calculate the 1D location from a 2D grid
      int loc = x+ y*cam.width;
      
      // Get the red, green, blue values from a pixel      
      float r  = red(cam.pixels[loc]);
      float g  = green(cam.pixels[loc]);
      float b  = blue(cam.pixels[loc]);
      
      // Calculate an amount to change brightness based on proximity to the mouse      
      float d = dist(x, y, mouseX, mouseY);      
      float adjustbrightness = map(d, 0, 200, 4, 0);      
      r *= adjustbrightness;      
      g *= adjustbrightness;      
      b *= adjustbrightness;      
  
      // Constrain RGB to make sure they are within 0-255 color range      
      r = constrain(r, 0, 255);      
      g = constrain(g, 0, 255);      
      b = constrain(b, 0, 255);      
  
      // Make a new color and set pixel in the window      
      color c = color(r, g, b);      
      pixels[loc] = c;        
    }
  }
  updatePixels();
}
