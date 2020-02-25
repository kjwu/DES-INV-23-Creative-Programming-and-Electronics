/*
  Random Blink
*/
#define controlPin 13
float randNumber;
long lastTriggeredTime;
int setTime;
boolean lightState;

// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin LED_BUILTIN as an output.
  pinMode(controlPin, OUTPUT);
  randomSeed(analogRead(0));
  lastTriggeredTime = 0;
  setTime = 1000;
  lightState = LOW;
}

// the loop function runs over and over again forever
void loop() {
  randNumber = random(100);
  if(millis()-lastTriggeredTime<setTime){
    digitalWrite(controlPin,lightState);
  }else{
    if(randNumber < 30){
      lightState = HIGH;
      setTime = 2000;
    }else{
      lightState = LOW;
      setTime = 1000;
    }
    
    lastTriggeredTime = millis();
  }
}
