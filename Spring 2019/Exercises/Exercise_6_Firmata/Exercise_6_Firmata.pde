/*
*  Exercise_6 Arduino Input Using Firmata
*  Feb 25 2019 Kuan-Ju Wu
*
*
*/

import codeanticode.syphon.*;
SyphonServer server;


import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

float circleSize = 50;
float palse;
float noiseFactor;
float randomSeed;
float degree;
float speed = 1;
float shift;
float hue = 200;
boolean isBig = false;
boolean showPortal = false;

Meteor[] meteors;
ArrayList<Firework> fireworks = new ArrayList<Firework>();

ArrayList<Beam> beams = new ArrayList<Beam>();


float pAngle = 0;
float initialSize = circleSize;
boolean randomCenter = false;
float portalX,portalY;


/*****Arduino Setting*****/
ArrayList<Portal> portals=new ArrayList<Portal>();
int switch1 = 5;
int switch2 = 6;
int switch3 = 7;
int switch4 = 8;
int switch5 = 9;
int switch6 = 10;

float currentFireworkAngle=0;

void setup(){
    // Create syhpon server to send frames out.
  //smooth(4);
  size(800,800,P3D);
  
  server = new SyphonServer(this, "Processing Syphon");

  //fullScreen();
  randomSeed = random(1000);
  meteors = new Meteor[120];
  for(int i = 0 ; i <120; i++){
    meteors[i] = new Meteor(width/2+circleSize*1.5*cos(radians(360*i/120)),height/2+circleSize*1.5*sin(radians(360*i/120)));
  }
    

  //println("fireworks size: "+fireworks.length);
  //println("firework 0 pos x: "+fireworks[0].location.x);

  ////////////Arduino Settings////////////
  // Prints out the available serial ports.
  println(Arduino.list());
  
  // Modify this line, by changing the "0" to the index of the serial
  // port corresponding to your Arduino board (as it appears in the list
  // printed by the line above).
  arduino = new Arduino(this, Arduino.list()[3], 57600);
  
  // Alternatively, use the name of the serial port corresponding to your
  // Arduino (in double-quotes), as in the following line.
  //arduino = new Arduino(this, "/dev/tty.usbmodem621", 57600);
  
  
  // Set the Arduino digital pins as inputs. skip pin 1,2 8-13
  arduino.pinMode(switch1,Arduino.INPUT);
  arduino.pinMode(switch2,Arduino.INPUT);
  arduino.pinMode(switch3,Arduino.INPUT);
  arduino.pinMode(switch4,Arduino.INPUT);
  arduino.pinMode(switch5,Arduino.INPUT);
  arduino.pinMode(switch6,Arduino.INPUT);




}

void draw(){
  background(10);

  //println("button state: "+ arduino.digitalRead(2));
 // if(arduino.digitalRead(switch1) == Arduino.HIGH){
  
 //     for(int i = 0 ; i < meteors.length; i++){
 //     float angle = random(360);
 //     float newX = 2*circleSize*cos(radians(angle));
 //     float newY = 2*circleSize*sin(radians(angle));
      
 //     meteors[i].setNewTarget(width/2+newX,height/2+newY);
 //   }
 // }

 //if(arduino.digitalRead(switch2)== Arduino.HIGH){
 //}
  
  
 //if(arduino.digitalRead(switch3)== Arduino.HIGH){
 //      for (Portal p : portals) {
 //     p.toggleStones();
 //   }
 //}

 //if(arduino.digitalRead(switch4)== Arduino.HIGH){
 //    showPortal = true;
 // }else{
 //   showPortal = false;
 // }
  
 //if(arduino.digitalRead(switch5)== Arduino.HIGH){
 //    randomCenter = true;
 // }else{
 //   randomCenter = false;
 // }

 //if(arduino.digitalRead(switch6)== Arduino.HIGH){
 //    isBig = true;
 // }else{
 //   isBig = false;
 // }
 // //println("pot1 state: "+ arduino.analogRead(0));
 // hue = map(arduino.analogRead(0),92,1013,30,100);
  
  
 // //println("pot2 state: "+ arduino.analogRead(1));
 // speed = map(arduino.analogRead(1),92,1023,0.1,5);
  

  noiseFactor+=0.02;
  shift = map(noise(noiseFactor+randomSeed),0,1,-15,15);

  if(degree>360) degree = 0;
  degree += speed*10;
  
  palse=map(sin(radians(degree)),-1,1,-circleSize*0.2,circleSize*0.2);
  
  
  if(isBig) circleSize = 200;
  else circleSize = 50;
  
  beat();
  

  
  // portal related
  initialSize = circleSize;
    pAngle = map(mouseX,0,width,0,360);
  if(frameCount%4 == 0){
    if(randomCenter){
      portalX = width/2+map(noise(noiseFactor),0,1,-20,20);
      portalY = height/2+map(noise(noiseFactor+100),0,1,-20,20);
    }else{
      portalX = width/2;
      portalY = height/2;
    }
    portals.add(new Portal(portalX,portalY,initialSize,pAngle,hue,speed/10));
  }
  
  if(random(1)>0.95){
    beams.add(new Beam());
  }


  if(frameCount%5 == 0){
    if(currentFireworkAngle>360)  currentFireworkAngle=0;
    else currentFireworkAngle+=5;
    
    fireworks.add(new Firework(circleSize*cos(radians(currentFireworkAngle)),circleSize*sin(radians(currentFireworkAngle))));
  }
  
  checkSize();
  
  if(showPortal){
    for (Portal p : portals) {
      p.update();
      p.display();
    }
  }
 
  
  for(int i = 0 ; i < meteors.length; i++){
    meteors[i].setColor(hue);
    meteors[i].easing = speed/100;
    
    meteors[i].update();
    meteors[i].display();
  }
  
  
  for (Firework f : fireworks) {
    f.update();
    pushMatrix();
    translate(width/2,height/2);
    f.display();
    popMatrix();
  }


  for (Beam b : beams) {
    b.update();
    b.display();
  }
  //server.sendScreen();

}


void keyPressed(){
  if(key == ' '){
    isBig = !isBig;
  }
  
  if(key == 's'){
    for (Portal p : portals) {
      p.toggleStones();
    }
  }

  if(key == 'b'){
    for(int i = 0; i < (int)random(1,5); i ++){
      beams.add(new Beam());
    }
  }

  if(key == 'p'){
    showPortal = !showPortal;
  }
  
  if(key == 'r'){
      randomCenter = !randomCenter;
  }
  
  if(key == 'h'){
      hue = (hue+10)%360;
  }

  if(key == 'n'){
    for(int i = 0 ; i < meteors.length; i++){
      float angle = random(360);
      float newX = 2*circleSize*cos(radians(angle));
      float newY = 2*circleSize*sin(radians(angle));
      
      meteors[i].setNewTarget(width/2+newX,height/2+newY);
    }
  }
  
      if(key == CODED){
        if(keyCode == UP){
          initialSize*=1.05;
        }else if(keyCode == DOWN){
          initialSize*=0.97;
        }else if(keyCode == RIGHT){
          speed*=1.05;
        }else if(keyCode == LEFT){
          speed*=0.95;
        }
      }

}

void beat(){
  noStroke();



  pushStyle();
  for(int i = 0; i < 5; i++){
    pushMatrix();
    translate(portalX,portalY);
    colorMode(HSB,360,100,100);
    fill(hue,90,100,50);
    ellipse(0,0,(circleSize+palse+shift)-i*7,(circleSize+palse+shift)-i*7);
    popMatrix();
  }
  popStyle();
}

void checkSize(){
  //println(portals.size());
  //println(fireworks.size());
    if(portals.size()>60){
      portals.remove(0);
    }
  
  
  for (int i = portals.size() - 1; i >= 0; i--) {
    Portal part = portals.get(i);
    if (part.size>width*1.5) {     
      portals.remove(i);
    }
  }
  
  for (int k = fireworks.size() - 1; k >= 0; k--) {
    Firework item = fireworks.get(k);
    if (item.location.mag()>width) {     
      fireworks.remove(k);
    }
  }
  
 for (int l = beams.size() - 1; l >= 0; l--) {
    Beam item = beams.get(l);
    if (item.location.mag()>2*width) {     
      beams.remove(l);
    }
  }

  
}
