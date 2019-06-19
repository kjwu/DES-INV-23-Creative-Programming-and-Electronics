/*
* exercise of acceleration
*/

Mover[] movers = new Mover[20];

void setup(){
  size(800,800);
  for(int i = 0 ; i < movers.length; i++){
    movers[i] = new Mover();
  }
}

void draw(){
  
  PVector mouse = new PVector(mouseX, mouseY);

  background(100);
  for(int i = 0 ; i < movers.length; i++){
    
    PVector aforce = movers[i].attract(mouse);
    movers[i].applyForce(aforce);
    
    for(int j = 0 ; j < movers.length; j++){
      if(i!=j){
        PVector rForce = movers[i].repel(movers[j].location);
        movers[i].applyForce(rForce);
      }
    }
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
}
