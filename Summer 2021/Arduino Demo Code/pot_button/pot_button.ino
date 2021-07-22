/* demostrates sending a value from arduino to p5.js using potentiometer
*/
int potPin = A0;
int btnPin = 4;
int potVal;
int btnVal;
int inByte = 0;


void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  while(!Serial){
  }
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

    
    // send sensor values:
    Serial.print(btnVal);
    Serial.print(",");
    Serial.println(potVal);
  }

}

void establishContact(){
  while(Serial.available() <= 0){
    Serial.println("0,0,0");
    delay(300);
  }
}
