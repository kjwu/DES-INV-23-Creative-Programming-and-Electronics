/* Blinking LED 
* --------------------
* turns on and off a light emitting diode(LED)  connected to a digital 
* pin, in intervals of 2 seconds. 
*/ 

int ledPin = 12; // LED connected to digital pin 12 

void setup() { 
pinMode(ledPin, OUTPUT); // sets the digital pin as output 
} 

void loop() { 

digitalWrite(ledPin, HIGH); // sets the LED on 
delay(1000); // waits for a second 
digitalWrite(ledPin, LOW); // sets the LED off 
delay(1000); // waits for a second 

}
