/*
*  Exercise_6 Arduino Input Using Firmata
*  Feb 25 2019 Kuan-Ju Wu
*
*
*/

import codeanticode.syphon.*;
SyphonServer server;


//network stuff
import hypermedia.net.*;
UDP udp;  // define the UDP object
LightBulbs lights;

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
boolean showFFT = false;

Meteor[] meteors;
ArrayList<Firework> fireworks = new ArrayList<Firework>();

ArrayList<Beam> beams = new ArrayList<Beam>();
boolean showBeam = false;
boolean showFirework = false;


float pAngle = 0;
float initialSize = circleSize;
boolean randomCenter = false;
float portalX,portalY;

import processing.sound.*;

AudioIn input;
Amplitude amp;

FFT fft;

int bands = 128;
float smoothingFactor = 0.2;

// Create a vector to store the smoothed spectrum data in
public float[] sum = new float[bands];
public float volumn = 0;

// Variables for drawing the spectrum:
// Declare a scaling factor for adjusting the height of the rectangles
int scale = 20;
// Declare a drawing variable for calculating the width of the 
float barWidth;


float farrisWheelInc, farrisWheelx,farrisWheely;

Flower[] flowers = new Flower[20];
boolean showFlower = false;



ArrayList<Portal> portals=new ArrayList<Portal>();
float currentFireworkAngle=0;

import processing.video.*;
import java.awt.*;
import gab.opencv.*;
Capture video;

OpenCV opencv;
PImage canny,maskImg;
boolean showFace = false;

void setup(){
    // Create syhpon server to send frames out.
  //smooth(4);
  //size(1440,900,P3D);
  fullScreen(P3D);
      noCursor();
  
  
   video = new Capture(this, 160, 120);
  opencv = new OpenCV(this, 160, 120);
    //opencv.loadCascade(OpenCV.CASCADE_EYE);  
    //opencv.loadCascade(OpenCV.CASCADE_MOUTH );  

    //opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

    //opencv.startBackgroundSubtraction(5, 3, 0.5);
  maskImg = loadImage("mask.jpg");

  video.start();
  server = new SyphonServer(this, "Processing Syphon");

  //fullScreen();
  randomSeed = random(1000);
  meteors = new Meteor[120];
  for(int i = 0 ; i <120; i++){
    meteors[i] = new Meteor(width/2+circleSize*1.5*cos(radians(360*i/120)),height/2+circleSize*1.5*sin(radians(360*i/120)));
  }
    
  for(int i = 0 ; i < flowers.length; i++){
    flowers[i] = new Flower(random(15));
  }

  //println("fireworks size: "+fireworks.length);
  //println("firework 0 pos x: "+fireworks[0].location.x);


  input = new AudioIn(this, 0);

  // start the Audio Input    
  input.start();

  // create a new Amplitude analyzer
  amp = new Amplitude(this);

  // Patch the input to an volume analyzer
  amp.input(input);
  fft = new FFT(this, bands);
  fft.input(input);

  lights = new LightBulbs("192.168.1.", 9000, 5);
  lights.init();

  udp = new UDP( this, 9000 );  // create a new datagram connection on port 6000
  //udp.log( true );         // <-- printout the connection activity
  udp.listen( true );           // and wait for incoming message
}
  
void draw(){
    background(0);



  
  volumn = amp.analyze();
  fft.analyze();
  for (int i = 0; i < bands; i++) {
  // Smooth the FFT spectrum data by smoothing factor
    sum[i] += (fft.spectrum[i] - sum[i]) * smoothingFactor;
  }

  lights.update();
  lights.display();
  


  
  hue = (hue+0.1)%360;

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
  //shift = map(noise(noiseFactor+randomSeed),0,1,-15,15);
  shift = 0;

  if(degree>360) degree = 0;
  degree += speed*10;
  
  //palse=map(sin(radians(degree)),-1,1,-circleSize*0.2,circleSize*0.2);
  palse=0;

  
  if(isBig) circleSize = width/4+volumn*4*width;
  else circleSize = width/16+volumn*4*width/4;
  
  
  if(showFace){
  opencv.loadImage(video);
  //opencv.updateBackground();
    //opencv.dilate();
  //opencv.erode();
  opencv.findCannyEdges(50,60);
  canny = opencv.getSnapshot();
  pushMatrix();
  imageMode(CENTER);
  translate(width/2,height/2, -1);
  scale(-circleSize*0.008,circleSize*0.008);
  
  canny.mask(maskImg);
  image(canny, 0, 0);
  popMatrix();
  }
  
  
  
  beat();
  


  
  // portal related
  initialSize = circleSize;
    pAngle = map(mouseX,0,width,0,360);
  if(frameCount%10   == 0){
    if(randomCenter){
      portalX = width/2+map(noise(noiseFactor),0,1,-20,20);
      portalY = height/2+map(noise(noiseFactor+100),0,1,-20,20);
    }else{
      portalX = width/2;
      portalY = height/2;
    }
    portals.add(new Portal(portalX,portalY,initialSize,pAngle,hue,speed/10));
  }
  
  if(showBeam){
    if(random(1)>0.95){
      beams.add(new Beam());
    }
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
  
  if(showFirework){

    for (Firework f : fireworks) {
      f.update();
      pushMatrix();
      translate(width/2,height/2);
      f.display();
      popMatrix();
    }
  }


  for (Beam b : beams) {
    b.update();
    b.display();
  }

  if(showFFT)fftBars(circleSize);
  server.sendScreen();
  
  
  if(showFlower){
    for(int i = 0 ; i < flowers.length; i++){
      
      for(int j = 0; j < flowers.length; j++){
        if(j!=i){
          PVector f = new PVector();
          f = PVector.sub(flowers[j].pos, flowers[i].pos);
          f.normalize();
          flowers[i].applyForce(f.mult(-0.01));
        }  
      }
      
      
      PVector mousePos = new PVector(mouseX,mouseY);
      PVector force = PVector.sub(mousePos,flowers[i].pos);
      force.normalize();
      flowers[i].applyForce(force.mult(0.3));
      
  
      flowers[i].update();
      flowers[i].display();
      
    }
  }

}


void keyPressed(){
    if(key == '1'){
    showBeam = !showBeam;

  }

  if(key == '2'){
    showFirework = !showFirework;

  }
 
  if(key == '4'){
    showFlower = !showFlower;
  }
  
  if(key == '5'){
    for (Portal p : portals) {
      p.toggleStones();
    }
  }

  if(key == '6'){
      showFace=!showFace;
  }

  if(key == '7'){
      showFFT=!showFFT;
  }




  if(key == '3'){
    for(int i = 0 ; i < meteors.length; i++){
      float angle = random(360);
      float newX = 2*circleSize*cos(radians(angle));
      float newY = 2*circleSize*sin(radians(angle));
      
      meteors[i].setNewTarget(width/2+newX,height/2+newY);
    }
  }
  
 
  
  
  if(key == ' '){
    isBig = !isBig;
  }
  
   if(key == 'p'){
    showPortal = !showPortal;
  }


  if(key == 'b'){
  for(int i = 0; i < (int)random(1,15); i ++){
      beams.add(new Beam());
    }
  }



  if(key == 'r'){
      randomCenter = !randomCenter;
  }
  

  if(key == 'h'){
      hue = (hue+10)%360;
  }



  if(key == 'a'){
      lights.allOn();      
  }
  
  if(key == 'z'){
    lights.allOff();
  }
  
  if(key == 'c'){
    //lights.startStair();
    lights.chase();
  }
  
  if(key == 's'){
    //lights.startStair();
    lights.sinWave();
  }
  
  //if(key == 'c'){
  //  lights.startChase();
  //}
  
  //if(key == 'f'){
  //  lights.startFFT();
  //}
  //if(key == 'q'){
  //  lights.startEQ();
  //}
  
  
 
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
    colorMode(HSB,100);
    fill(hue,70,100,50);
    ellipse(0,0,(circleSize+palse+shift)-i*7,(circleSize+palse+shift)-i*7);

    popMatrix();
  }
  popStyle();
}

void checkSize(){
  //println(portals.size());
  //println(fireworks.size());
    if(portals.size()>30){
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


void fftBars(float size){
  
    fft.analyze();
    barWidth = 360/float(bands);
    pushStyle();
    noStroke();
    fill(255);
    for (int i = 0; i < bands; i++) {
      pushMatrix();
      translate(width/2,height/2);
      float deg = float(i)/bands*PI;
      
      rotate(deg+radians(frameCount%360));
        // Smooth the FFT spectrum data by smoothing factor
      sum[i] += (fft.spectrum[i] - sum[i]) * smoothingFactor;
      rect(0, size, barWidth, sum[i]*size*scale);    
      popMatrix();
     
      pushMatrix();
      translate(width/2,height/2);

      rotate(-deg+radians(frameCount%360));
      rect(0, size, barWidth, sum[i]*size*scale);    
      popMatrix();

    }
    pushStyle();
    
}

void farrisWheel(float size){
  if(farrisWheelInc>18) farrisWheelInc = 0;
  farrisWheelInc+=0.1;
  translate(width/2,height/2);
  pushStyle();
  noFill();
  stroke(255);
  beginShape();
  for(float deg = 0; deg<360; deg++){
    farrisWheelx = sin(radians(farrisWheelInc*deg))/3+cos(radians(deg))+cos(radians((farrisWheelInc-10)*deg))/2;
    farrisWheely = sin(radians(deg))+sin(radians((farrisWheelInc-10)*deg))/2+ cos(radians(farrisWheelInc*deg))/3;
    vertex(farrisWheelx*size,farrisWheely*size);
  }
  endShape();
  popStyle();
}

void captureEvent(Capture c) {
  c.read();
}
