import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

int ledPin = 13;
int counter = 0;
int onTime = 20;
int offTime = 0;

void setup(){
  //println(Arduino.list());
  arduino = new Arduino(this, "/dev/cu.usbmodem14611", 57600);
  arduino.pinMode(ledPin, Arduino.OUTPUT);
  size(800,800);
}

void draw(){
  
  onTime = (int)map(mouseX, 0, width, 1, 100);
  offTime = (int)map(mouseY, 0, width, 1, 100);

  
  if(counter > onTime+offTime) counter = 0;
  else counter++;
  
  if(counter < onTime){
    arduino.digitalWrite(ledPin,Arduino.HIGH);
  }else{
    arduino.digitalWrite(ledPin,Arduino.LOW);
  }
}
