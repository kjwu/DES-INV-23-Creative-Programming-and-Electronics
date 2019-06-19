/*
*motion 101
*exercise of pvector
*/

Mover m;

void setup(){
  
  size(400,400);
  m = new Mover();
}

void draw(){
  background(100);
  m.update();
  m.checkEdges();
  m.display();
}
