/*
* DES-INV23
* 
* Noise Exercise
*
*/

float x;
float y;

float xOff = 0;
float yOff = 100;
void setup(){
  size(800,800);
  frameRate(60);
  x = width/2;
  y = height/2;
    randomSeed(0);

}

void draw(){
  background(0);
  xOff+= 0.02;
  yOff+= 0.02;
  
  
  x = map(noise(xOff), 0, 1, 0, width);
  y = map(noise(yOff), 0, 1, 0, height);
  
  ellipse(x, y, 20,20);
}
