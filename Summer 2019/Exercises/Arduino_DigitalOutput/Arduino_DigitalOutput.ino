/*
Demo of making blink without using delay
*/

int ledPin = 13;
long lastTriggeredTime  = 0;
int onTime = 1000;
int offTime = 1000;
boolean blinkOrNot;

void setup() {
  pinMode(ledPin, OUTPUT);
  lastTriggeredTime = millis();
  Serial.begin(9600);
}

void loop() {
  //check serial port input for new command.
  if(Serial.available()){
    char incomingData = Serial.read();
    if(incomingData == '1'){
      blinkOrNot = true;
      lastTriggeredTime = millis(); //don't forget to reset time;
    }
    if(incomingData == '0'){
      blinkOrNot = false;
    }
  }


  if(blinkOrNot == true){
    blinkLED();
  }else{
    turnOffLED();
  }
}

void blinkLED(){
   // blink the led using timer check
  if(millis()-lastTriggeredTime < onTime){
    digitalWrite(ledPin, HIGH);
  }else if(millis()-lastTriggeredTime < onTime+offTime){
    digitalWrite(ledPin, LOW);
  }else{
    lastTriggeredTime = millis();
  }
}

void turnOffLED(){
  digitalWrite(ledPin, LOW);
}
