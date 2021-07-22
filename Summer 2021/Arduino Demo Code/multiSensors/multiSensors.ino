/* demostrates sending a value from arduino to p5.js using potentiometer
*/
#include "Arduino_SensorKit.h"

int potPin = A0;
int btnPin = 4;
int lightPin = A3;
int micPin = A2;


int potVal;
int btnVal;
int lightVal;
int micVal;
int temp;
int humidity;

int inByte = 0;


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  while(!Serial){
  }
  
  Environment.begin();
  
  pinMode(btnPin,INPUT);
  establishContact();
}

void loop() {
  // if we get a valid byte, read analog ins:
  if (Serial.available() > 0) {
    // get incoming byte:
    inByte = Serial.read();
    // read button data:
    btnVal = digitalRead(btnPin);
    // read pot analog input:
    potVal = analogRead(potPin);
    lightVal = analogRead(lightPin);
    micVal = analogRead(micPin);


    temp = floor(Environment.readTemperature());
    humidity = floor(Environment.readHumidity());
    
    // send sensor values:
    Serial.print(btnVal);
    Serial.print(",");
    Serial.print(potVal);
    Serial.print(",");
    Serial.print(lightVal);
    Serial.print(",");
    Serial.print(micVal);
    Serial.print(",");
    Serial.print(temp);
    Serial.print(",");
    Serial.println(humidity);

  }

}

void establishContact(){
  while(Serial.available() <= 0){
    Serial.println("0,0,0,0,0,0");
    delay(300);
  }
}
