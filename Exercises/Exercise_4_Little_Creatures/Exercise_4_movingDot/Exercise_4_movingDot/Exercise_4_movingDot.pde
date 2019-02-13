/*
Exercise 4 Vectors
Feb 12 2019
*/


PVector pos;
PVector velocity;
PVector acceleration;
PVector dir;

void setup(){
  size(800,800);
  pos = new PVector(random(width),random(height));
  velocity = new PVector();
  acceleration = new PVector();
  dir = new PVector();
}


void draw(){
  background(255);
  pos = pos.add(velocity);
  velocity = velocity.add(acceleration);
  
  PVector cursorPos = new PVector(mouseX,mouseY);
  dir = cursorPos.sub(pos);
  dir.normalize();
  acceleration = dir.mult(0.05);
  velocity.limit(2);
  
  fill(255,0,0);
  ellipse(pos.x,pos.y,10,10);
}
