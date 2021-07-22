/* demostrates sending a value from arduino to p5.js using button
*/
int btnPin = 4;
int btnStatus;

void setup() {
  // put your setup code here, to run once:
  pinMode(btnPin,INPUT);
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  btnStatus = digitalRead(btnPin);
  Serial.println(btnStatus);

  //wait a bit for between readings
  delay(10);
}
