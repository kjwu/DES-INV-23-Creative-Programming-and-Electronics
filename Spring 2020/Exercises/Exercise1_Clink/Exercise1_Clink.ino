/*
 * DES-INV 23 Exercise 1
 * Controlling Solenoid 
 * Kuan-Ju Wu 2020 Jan 28
*/

#define bpm 60 //Allegro:120bpm Moderato:90bpm Lento:60bpm
#define solenoidPin 2

void setup() {
  // put your setup code here, to run once:
 pinMode(solenoidPin, OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:


}


void halfNote(){
    digitalWrite(solenoidPin,HIGH);
    delay(50);
    digitalWrite(solenoidPin, LOW);
    delay(bpm/60*1000*2-50);
  }

void quarterNote(){
    digitalWrite(solenoidPin,HIGH);
    delay(50);
    digitalWrite(solenoidPin, LOW);
    delay(bpm/60*1000-50);
  }

void eighthNote(){
  digitalWrite(solenoidPin,HIGH);
  delay(50);
  digitalWrite(solenoidPin, LOW);
  delay(bpm/60*1000/2-50);
  }
