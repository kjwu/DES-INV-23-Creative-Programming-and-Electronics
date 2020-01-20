// Example1 code for Brian Schmalz's Easy Driver Example page
// http://www.schmalzhaus.com/EasyDriver/EasyDriverExamples.html

void setup() {                
  pinMode(2, OUTPUT);     
  pinMode(3, OUTPUT);
  digitalWrite(2, LOW);
  digitalWrite(3, LOW);
}

void loop() {
  digitalWrite(2, HIGH);
  delay(1);          
  digitalWrite(2, LOW); 
  delay(1);          
}
