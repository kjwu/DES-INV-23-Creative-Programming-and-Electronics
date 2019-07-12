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
