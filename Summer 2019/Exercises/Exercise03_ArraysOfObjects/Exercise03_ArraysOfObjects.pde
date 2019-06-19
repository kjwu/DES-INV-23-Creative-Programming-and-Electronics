/*
* exercise of acceleration
*/

Mover[] movers = new Mover[20];

void setup(){
  size(400,400);
  for(int i = 0 ; i < movers.length; i++){
    movers[i] = new Mover();
  }
}

void draw(){
  background(100);
  for(int i = 0 ; i < movers.length; i++){

    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}
