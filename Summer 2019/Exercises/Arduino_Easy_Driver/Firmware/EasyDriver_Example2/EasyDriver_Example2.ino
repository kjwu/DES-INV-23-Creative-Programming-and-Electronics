// Example2 code for Brian Schmalz's Easy Driver Example page
// http://www.schmalzhaus.com/EasyDriver/EasyDriverExamples.html

int Distance = 0;  // Record the number of steps we've taken

void setup() {                
  pinMode(3, OUTPUT);     
  pinMode(2, OUTPUT);
  digitalWrite(3, LOW);
  digitalWrite(2, LOW);
}

void loop() {
  digitalWrite(2, HIGH);
  delayMicroseconds(100);          
  digitalWrite(2, LOW); 
  delayMicroseconds(100);
  Distance = Distance + 1;   // record this step
  
  // Check to see if we are at the end of our move
  if (Distance == 3600)
  {
    // We are! Reverse direction (invert DIR signal)
    if (digitalRead(3) == LOW)
    {
      digitalWrite(3, HIGH);
    }
    else
    {
      digitalWrite(3, LOW);
    }
    // Reset our distance back to zero since we're
    // starting a new move
    Distance = 0;
    // Now pause for half a second
    delay(500);
  }
}
