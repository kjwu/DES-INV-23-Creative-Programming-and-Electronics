/*
* Exercise 5 Camera 
* Feb 19 2019
* Kuan-Ju Wu
*/

// Step 1. Import the video library
import processing.video.*;

// Step 2. Declare a Capture object
Capture cam; 

//size of each cell in the grid, ratio of window size to video size
int videoScale = 8;
//number of rows and columns in the system
int rows,cols;

//loc for a random point 
float x,y;

void setup(){
  size(640, 480);
  rows = height/videoScale;
  cols = width/videoScale;
  
  // Step 3. Initialize Capture object via Constructor
  //The reference will show there are several ways
  //to call the Capture constructor. A typical way 
  //to call the constructor is with three arguments:
  //1."this" refers to the instance of a class in which the word this appears.
  //2.width of the video.
  //3.height of the video.
  cam = new Capture(this, cols,rows);
  cam.start();
  
  x = width/2;
  y = height/2;
}

// An event for when a new frame is available
void captureEvent(Capture video) {
  // Step 4. Read the image from the camera.  
  video.read();
}


void draw(){


 background(0);

 cam.loadPixels();
  // Begin loop for columns  
  for(int i = 0 ; i < cols; i ++){
    // Begin loop for rows    
    for(int j = 0; j < rows; j++){
      int x = i*videoScale;
      int y = j*videoScale;
      
      // Reverse the column to mirro the image.
      int loc = (cam.width - i -1) + j * cam.width;       
      
      color c = cam.pixels[loc];
      
      float sz = brightness(c)/255*videoScale;
      
      rectMode(CENTER);      

      fill(255);      
      noStroke();
      ellipse(x+videoScale/2,y+videoScale/2,sz,sz);
    }
 }

}
