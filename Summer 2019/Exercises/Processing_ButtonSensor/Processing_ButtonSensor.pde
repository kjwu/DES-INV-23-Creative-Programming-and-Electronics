/**
 * Simple Read
 * 
 * Read data from the serial port and change the color of a rectangle
 * when a switch connected to a Wiring or Arduino board is pressed and released.
 * This example works with the Wiring / Arduino program that follows below.
 */


import processing.serial.*;

Serial myPort;  // Create object from Serial class
int val;      // Data received from the serial port
float background_color = 0;   // Variable for changing the background color
boolean showSquare = false; 

void setup() 
{
  size(800, 800);
  // I know that the first port in the serial list on my mac
  // is always my  FTDI adaptor, so I open Serial.list()[0].
  // On Windows machines, this generally opens COM1.
  // Open whatever port is the one you're using.
  println(Serial.list());

  //String portName = Serial.list()[4];
  String portName = "/dev/cu.usbmodem14611";

  myPort = new Serial(this, portName, 9600);
  myPort.bufferUntil ( '\n' );   // Receiving the data from the Arduino IDE

}


void serialEvent  (Serial myPort) {

  String incomingData = myPort.readStringUntil ( '\n' ) ;
  if(incomingData.charAt(0)=='A'){
    background_color = float(incomingData.substring(1));
  }
  else if(incomingData.charAt(0) == 'B'){
    if(float(incomingData.substring(1)) == 0){
      showSquare = true;
    }else{
      showSquare = false;
    }
  }
  

} 



void draw()
{
  
  
  colorMode(HSB,255,100,100);
  background(background_color,100,100);
  ellipse(width/2,height/2,background_color,background_color);
  
  if(showSquare == true){
    pushStyle();
    fill(0);
    rectMode(CENTER);
    rect(width/2,height/2,100,100);
    popStyle();
  }
}



/*

int sensorPin=A1;
int buttonPin= 2;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(buttonPin,INPUT_PULLUP);
}

void loop() {
  // put your main code here, to run repeatedly:
  float sensorStatus = analogRead(sensorPin);
  int buttonState = digitalRead(buttonPin);
  Serial.print('A');
  Serial.println((int)map(sensorStatus,0,1023,0,255));
  Serial.print('B');
  Serial.println(buttonState);

  
}

*/
