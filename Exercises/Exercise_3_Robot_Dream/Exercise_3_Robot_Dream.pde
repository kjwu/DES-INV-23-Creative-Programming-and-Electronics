/*
DES-INV 23
Animation Demo
Feb 5 2019 Kuan-Ju Wu
*/

//animated gif library downloaded from https://github.com/akiljohnson1/GifAnimation
import gifAnimation.*;

float deg=0;
float noiseFactor = 0.0;
float yOff = 0;
float thickness = 10;
float stripeRotation = 0;
int selectedTriangle = 0;

int numFrames = 100;       // how many frames to save?
int frameDelay = 1;       // delay b/w frames of the animation (in millis)

int videoCreationMode = 3; //mode 0: Processing's Movie Maker Tool 
                           //mode 1: animated gif library
GifMaker gif;             // create the gif animation "object"


void setup(){
  //size(800,800);
  fullScreen();
  // slow down the framerate, otherwise our
  // animation will have a ton of frames!
  frameRate(20);
  
  if(videoCreationMode == 1){
    // create the animation – the second argument
    // is the filename for our animation
    gif = new GifMaker(this, "robodream.gif");
    gif.setRepeat(0);    // make it loop
  }
}

void draw(){
  background(255);

  noiseFactor = noiseFactor + 0.1;
  thickness = noise(noiseFactor) * 10;
  
  if(deg<360)deg+=10;
  else deg = 0;

  if(yOff<50)yOff+=3;
  else yOff = 0;

  circleBomb();
  stipsMarch();
  gridParts();
  
  //display the frame rate so we can keep track of the play speed.
  text(int(frameRate) + " fps", 30,height-30);

  if(videoCreationMode == 1){
    // each frame, add a delay (in milliseconds)
    // and add the frame to the animation
    //gif.setDelay(frameDelay);
    gif.addFrame();
    
    // if we've reached a certain number of
    // frames, save and quit
    if (frameCount > numFrames) {
      gif.finish();
      exit();
    }
  }else if(videoCreationMode == 0){
    
    // save out individual frames
    // filenames should include leading zeroes so
    // they appear in the right order
    save("frames/" + nf(frameCount, 3) + ".tif");
    
    if (frameCount > numFrames) {
      exit();
    }
  }
}

void gridParts(){
  if(selectedTriangle<100) selectedTriangle++;
  else selectedTriangle=0;
  for(int j=0 ; j<11; j++){
    for(int i = 0 ; i < 11; i++){
      if(j*10+i == selectedTriangle){
        fill(0);
        triangle(i*width/10-55, j*height/10, i*width/10+55, j*height/10, i*width/10, j*height/10-60);

      }else{
        noFill();
        triangle(i*width/10-5, j*height/10, i*width/10+5, j*height/10, i*width/10, j*height/10-10);
      }
    }
  }
}

void stipsMarch(){
  if(stripeRotation<360)stripeRotation+=0.1;
  else stripeRotation = 0;
  pushMatrix();
  translate(width/2,height/2);
  rotate(radians(stripeRotation));
  for(int i = -height ; i < height+50; i += 50){
    stroke(0);
    strokeWeight(thickness);
    line(-width,i-yOff,2*width,i-yOff);
  }
  popMatrix();
}

void circleBomb(){
  noStroke();
  noFill();
  stroke(0);
  for(int i = 0 ; i < 2*width ; i +=50){
    ellipse(width/2, height/2, i+20*cos(radians(deg)),i+20*cos(radians(deg)));
  }
}
