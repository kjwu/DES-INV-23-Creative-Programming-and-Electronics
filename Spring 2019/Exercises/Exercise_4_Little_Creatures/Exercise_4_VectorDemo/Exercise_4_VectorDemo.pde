Mover[] movers = new Mover[20];
void setup(){
  size(600,600);
  for(int i = 0 ; i < movers.length; i++){
    movers[i] = new Mover(random(15));
  }
}

void draw(){
  background(20);
  for(int i = 0 ; i < movers.length; i++){
    
    for(int j = 0; j < movers.length; j++){
      if(j!=i){
        PVector f = new PVector();
        f = PVector.sub(movers[j].pos, movers[i].pos);
        f.normalize();
        movers[i].applyForce(f.mult(-0.01));
      }  
    }
    
    
    PVector mousePos = new PVector(mouseX,mouseY);
    PVector force = PVector.sub(mousePos,movers[i].pos);
    force.normalize();
    movers[i].applyForce(force.mult(0.3));
    

    movers[i].update();
    movers[i].display();
    
  }
}
