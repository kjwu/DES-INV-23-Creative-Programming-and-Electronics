/* demostrates sending a value from arduino to p5.js using potentiometer
*/
int potVal;
int potPin = A0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  potVal = analogRead(potPin);
  Serial.println(potVal);

  //wait a bit for between readings
  delay(10);
}
