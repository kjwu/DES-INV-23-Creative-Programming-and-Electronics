/**
* Exercise 5 Video Manipulation
* Feb 19 2019
* Kuan-Ju Wu
* To install this version (v2.0-beta1)
* of the video library:
* https://github.com/processing/processing-video/releases/download/r3-v2.0-beta1/video-2.0-beta1.zip
* 
*/

import processing.video.*;

Movie mov;
float playSpeed = 3;
float lastPlaySpeed = 3;
float maxPlaySpeed = 4;
float direction = 1;

void setup() {
  size(1280, 720);
  background(0);
  mov = new Movie(this, "videoName.mov");
  mov.loop();
  playSpeed = map(mouseX,0,width,0,maxPlaySpeed);
  mov.speed(direction*playSpeed);
  noStroke();
}

void movieEvent(Movie m) {
  m.read();  
}


void draw() {
  checkBackLoop();
  playSpeed = map(mouseX,0,width,0,maxPlaySpeed);
  if(lastPlaySpeed != playSpeed){
    mov.speed(direction*playSpeed);
    lastPlaySpeed = playSpeed;
  }

  image(mov, 0, 0, width, height);
  fill(255);
  rectMode(CORNER);
  rect(10,10,map(playSpeed,0,maxPlaySpeed,0,width),10);
  rect(10,30,width-20,2);
  fill(250,0,0);
  rectMode(CENTER);
  rect(map(mov.time(),0,mov.duration(),10,width-20),30,5,10);

  //for making movie from Processing's Movie Maker Tool
  //saveFrame("frame/####.tif");

}



void mousePressed(){
  direction*=-1;
  mov.speed(direction*playSpeed);
}

void checkBackLoop(){
  if(mov.time()<1 && direction<0){
    mov = new Movie(this, "videoName.mov");
    mov.loop();
    mov.jump(mov.duration());
    mov.speed(direction*playSpeed);
  }
}
