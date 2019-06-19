/*
* Bouncing ball with no vectors
*/

float x = 100;
float y = 100;
float xspeed = 1;
float yspeed = 3;

void setup(){
  size(400,400);
}

void draw(){
  background(100);
  if(x>width||x<0){
    xspeed = xspeed*-1;
  }

  if(y>height||y<0){
    yspeed = yspeed*-1;
  }

  x = x + xspeed;
  y = y + yspeed;
  
  ellipse(x,y,50,50);
}
