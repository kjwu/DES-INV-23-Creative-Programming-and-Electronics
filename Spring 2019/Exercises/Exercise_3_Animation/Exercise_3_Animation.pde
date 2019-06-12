/*
Animation Exercise
Feb 5 2019 Kuan-Ju Wu
*/

import gifAnimation.*;


float xPos = 50;
int xDirection = 1;
float yPos = 100;
float t = 0;
float deg = 0;
float boxSize = 100;

GifMaker gif;
int numberOfFrames =50;
int hue = 0;

void setup(){
  size(800,800);
  frameRate(10);
  gif = new GifMaker(this, "robotsDream_WuKuanju.gif");
  gif.setRepeat(0);
  colorMode(HSB, 100);
}

void draw(){
   if(hue<100)  hue++;
   else hue = 0;
   background(hue, 100, 100);

  //yPos = yPos+10;
  for(int i =0; i < 10; i++){
    movingBox(random(0,100));
  }
  gif.addFrame();
  
  if(frameCount>numberOfFrames){
    gif.finish();
    exit();
  }
  

  text(int(frameRate) + " fps", 30,height-30);
}

void movingBox(float initialValue){
  xPos = map(noise(t+initialValue),0,1,0,width);
  yPos = map(noise(t+100+initialValue),0,1,0,height);
  t = t + 0.05;
  deg+=10;
  boxSize = map(cos(radians(deg+initialValue)),-1,1,10,50);

  rectMode(CENTER);
  rect(xPos,yPos, boxSize,boxSize);  
}
