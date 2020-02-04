
int enPin1 = 2;
int dirPinA1 = 22;
int dirPinB1 = 23;

int enPin2 = 3;
int dirPinA2 = 24;
int dirPinB2 = 25;

float spd1 = 100;
float spd2 = 100;

long lastTriggeredTime1 = 0;
long lastTriggeredTime2 = 0;


void setup() {
  // put your setup code here, to run once:
  pinMode(enPin1,OUTPUT);
  pinMode(dirPinA1,OUTPUT);
  pinMode(dirPinB1,OUTPUT);
  
  pinMode(enPin2,OUTPUT);
  pinMode(dirPinA2,OUTPUT);
  pinMode(dirPinB2,OUTPUT);

  Serial.begin(9600);

}

void loop() {
  //use lastTriggeredTime to keep track of time
  if(millis()-lastTriggeredTime1>1000){
    spd1*=-1;
    lastTriggeredTime1 = millis();
  }  

  if(millis()-lastTriggeredTime2>2000){
    spd2*=-1;
    llastTriggeredTime2 = millis();
  }  
  

  moveMotor1(spd1);
  moveMotor2(spd2);

}


//motor control functions 
void moveMotor1(float spd){
  if(spd>0){
    digitalWrite(dirPinA1,HIGH);
    digitalWrite(dirPinB1,LOW);
    analogWrite(enPin1, abs(spd));
  }else{
    digitalWrite(dirPinA1,LOW);
    digitalWrite(dirPinB1,HIGH);
    analogWrite(enPin1, abs(spd));
  }
}

void moveMotor2(float spd){
  if(spd>0){
    digitalWrite(dirPinA2,HIGH);
    digitalWrite(dirPinB2,LOW);
    analogWrite(enPin2, abs(spd));
  }else{
    digitalWrite(dirPinA2,LOW);
    digitalWrite(dirPinB2,HIGH);
    analogWrite(enPin2, abs(spd));
  }
}
