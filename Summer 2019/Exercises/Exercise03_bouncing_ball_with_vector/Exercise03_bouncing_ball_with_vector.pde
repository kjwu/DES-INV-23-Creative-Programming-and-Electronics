/*
* Bouncing ball with  vectors
*/

PVector location;
PVector velocity;

void setup(){
  size(400,400);
  location = new PVector(100,100);
  velocity = new PVector(2.5,5);
}

void draw(){
  background(100);
  if(location.x>width||location.x<0){
    velocity.x*=-1;
  }

  if(location.y>height||location.y<0){
    velocity.y*=-1;
  }

  location.add(velocity);
  
  ellipse(location.x,location.y,50,50);
}
