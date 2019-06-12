/*
DES-INV 23 Exercise 10 - opencv+servo
April 16, 2019, Kuan-Ju Wu
*/

//arduino stuff
import processing.serial.*;
import cc.arduino.*;
Arduino arduino;
int deg;
int target;
int dir;
int spd;

//opencv stuff
import gab.opencv.*;
import processing.video.*;
import java.awt.*;

Capture video;
OpenCV opencv;

 
 
void setup() {
  size(640, 480);
  
  // Prints out the available serial ports.
  println(Arduino.list());
  
  arduino = new Arduino(this, "/dev/tty.usbmodem14611", 57600);
  
  arduino.pinMode(7, Arduino.SERVO);
  deg = 0;
  target = 0;
  dir = 1;
  spd = 1;
  
  
  
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();
}

void draw(){
  pushMatrix();
  scale(2);
  opencv.loadImage(video);

  image(video, 0, 0 );

  noFill();
  stroke(0, 255, 0);
  strokeWeight(3);
  Rectangle[] faces = opencv.detect();
  println(faces.length);

  for (int i = 0; i < faces.length; i++) {
    println(faces[i].x + "," + faces[i].y);
    rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
  }
  popMatrix();
  
  if(faces.length>0){
    target = (int) map(faces[0].x,0,width,0,180);
  }
 // arduino.servoWrite(7, constrain(mouseX / 2, 0, 180));
 //if(deg < 0 || deg > 180){
 //  dir = dir * -1;
 //}
 
 //deg = deg + dir*spd;
 if(target!=deg){
   if(target>deg)   deg = deg +spd;
   else deg = deg - spd;
 }
 arduino.servoWrite(7, constrain(deg, 0, 180));
}


void captureEvent(Capture c) {
  c.read();
}
