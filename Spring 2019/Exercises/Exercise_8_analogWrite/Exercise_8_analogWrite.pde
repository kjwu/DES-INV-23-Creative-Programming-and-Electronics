import processing.serial.*;
import cc.arduino.*;
Arduino arduino;

int enAPin = 9;
int in1Pin = 8;
int in2Pin = 7;

int speed = 10;

int counter = 0;
int onTime = 100;
int offTime = 100;

void setup(){
  //println(Arduino.list());
  arduino = new Arduino(this, "/dev/cu.usbmodem14311", 57600);
  arduino.pinMode(enAPin, Arduino.OUTPUT);
  arduino.pinMode(in1Pin, Arduino.OUTPUT);
  arduino.pinMode(in2Pin, Arduino.OUTPUT);

  size(800,800);
}

void draw(){

  background(20);
  ellipse(mouseX,mouseY,10,10);
  //onTime = (int)map(mouseX, 0, width, 1, 100);
  //offTime = (int)map(mouseY, 0, width, 1, 100);
  speed = (int)map(mouseX,0,width,10,255);
  
  if(counter > onTime+offTime) counter = 0;
  else counter++;
  
  if(counter < onTime){
    // turn on motor A in one direction
    arduino.digitalWrite(in1Pin, Arduino.HIGH);
    arduino.digitalWrite(in2Pin, Arduino.LOW);
    arduino.analogWrite(enAPin,speed);
  }else{
    // turn on motor A in the opposite direction
    arduino.digitalWrite(in1Pin, Arduino.LOW);
    arduino.digitalWrite(in2Pin, Arduino.HIGH);
    arduino.analogWrite(enAPin,speed);
  }
}
