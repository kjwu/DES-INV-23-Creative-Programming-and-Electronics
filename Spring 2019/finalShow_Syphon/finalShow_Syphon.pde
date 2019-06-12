import codeanticode.syphon.*;
import processing.serial.*;
import cc.arduino.*;
Arduino arduino;


PGraphics canvas;
SyphonClient client;
int divide = 1;
long lastButtonTriggeredTime = 0;
int buttonState = 0;


public void setup() {
  //size(800, 800, P3D);
  //size(1440, 900, P3D);
  fullScreen(P3D,2);

  println(Arduino.list());
  arduino = new Arduino(this, "/dev/cu.usbmodem1461", 57600);
  arduino.pinMode(8, Arduino.INPUT_PULLUP);
  arduino.pinMode(11, Arduino.OUTPUT);
  arduino.pinMode(12, Arduino.OUTPUT);
  arduino.pinMode(13, Arduino.OUTPUT);

  
  println("Available Syphon servers:");
  println(SyphonClient.listServers());
    
  // Create syhpon client to receive frames 
  // from the first available running server: 
  client = new SyphonClient(this);

  // A Syphon server can be specified by the name of the application that it contains it,
  // its name, or both:
  
  // Only application name.
  //client = new SyphonClient(this, "SendFrames");
    
  // Both application and server names
  //client = new SyphonClient(this, "SendFrames", "Processing Syphon");
  
  // Only server name
  //client = new SyphonClient(this, "", "Processing Syphon");
    
  // An application can have several servers:
  //client = new SyphonClient(this, "Quartz Composer", "Raw Image");
  //client = new SyphonClient(this, "Quartz Composer", "Scene");
  
  background(0);
}

public void draw() {    
  
  buttonState = arduino.digitalRead(8);
  if(millis()-lastButtonTriggeredTime>100 && buttonState  == 1){
    divide = (divide+1)%3;
    println(divide);
    lastButtonTriggeredTime = millis();
  }
  
  if (client.newFrame()) {
      canvas = client.getGraphics(canvas);
 
     if(divide ==1){
        image(canvas, 0, 0, width, height);    
     }else if(divide == 2){
        image(canvas, 0, 0, width/2, height/2);    
        image(canvas, width/2, 0, width/2, height/2);    
        image(canvas, 0, height/2, width/2, height/2);    
        image(canvas, width/2, height/2, width/2, height/2);    
     }else if(divide == 3){
        image(canvas, 0, 0, width/3, height/3);    
        image(canvas, width/3, 0, width/3, height/3);    
        image(canvas, width/3*2, 0, width/3, height/3);    

        image(canvas, 0, height/3, width/3, height/3);    
        image(canvas, width/3, height/3, width/3, height/3);    
        image(canvas, width/3*2, height/3, width/3, height/3);    

        image(canvas, 0, height/3*2, width/3, height/3);    
        image(canvas, width/3, height/3*2, width/3, height/3);    
        image(canvas, width/3*2, height/3*2, width/3, height/3);    

     }
  }
}
void keyPressed() {
  if (key == ' ') {
    //client.stop();  
  } else if (key == 'd') {
    println(client.getServerName());
  }else if (key == 'a'){
    divide++;
    if(divide > 3) divide =1;
  }
  
  
}
