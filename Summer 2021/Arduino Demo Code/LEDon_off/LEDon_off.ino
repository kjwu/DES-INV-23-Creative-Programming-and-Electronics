/*This sketch demo how to turn on/off the on board LED of an
* Arduino Uno with serial input*/
int ledPin = 6;
int buzzPin = 5;
int buzzValtage = 501;
int buzzDir = 1;
int buzzStatus = 0;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(ledPin,OUTPUT);
  pinMode(buzzPin,OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:

  if(Serial.available()>0){
    int incoming = Serial.read();
    if(incoming == 1){
      digitalWrite(ledPin,HIGH);
      buzzStatus = 1;
    }else if(incoming == 0){
      digitalWrite(ledPin,LOW);
      buzzStatus = 0;
    }
  }
    
  if(buzzStatus == 1){
    if(buzzValtage > 2000 || buzzValtage < 200){
      buzzDir *=-1;
    }
    
    buzzValtage += buzzDir;
    tone(buzzPin, buzzValtage);
    
  }else{
    noTone(buzzPin);
  }
}
