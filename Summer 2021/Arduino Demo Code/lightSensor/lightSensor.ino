/*Demo of Arduino Sensor Kit Light 
* Sensor
* Kuan-Ju Wu 07/22/2021
*/

//const means this variable can not be changed 
const int lightSensorPin = A3;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);  
}

void loop() {
  // put your main code here, to run repeatedly:
  int brightness = analogRead(lightSensorPin);
  Serial.println(brightness);
  delay(10);
}
