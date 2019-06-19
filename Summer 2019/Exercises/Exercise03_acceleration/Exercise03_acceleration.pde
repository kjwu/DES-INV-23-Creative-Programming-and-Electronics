/*
* exercise of acceleration
*/

Mover m;

void setup(){
  size(400,400);
  m = new Mover();
}

void draw(){
  background(100);
  m.update();
  m.display();
  m.checkEdges();
}
