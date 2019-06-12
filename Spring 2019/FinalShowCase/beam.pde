class Beam{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float angle;
  int shape;
  float beamLength; 
  float beamWidth; 
  color cc;
  Beam(){
    init();
  }
  
  void init(){
    location = new PVector(width/2,height/2);
    angle = random(2*PI);
    velocity = new PVector(cos(angle),sin(angle));
    acceleration = new PVector();
    beamLength = random(1.5,10);
    beamWidth = random(0.1,1);
    cc = color(random(255),random(255),random(255));
  }
  
  void update(){
   acceleration = PVector.sub(location,new PVector(width/2,height/2));
   acceleration.normalize();
   acceleration.mult(3);
   
   location.add(velocity);
   velocity.add(acceleration);
   velocity.limit(20);
   acceleration.mult(0);
  }
  
  void display(){
    
    pushStyle();
    fill(cc);
    pushMatrix();
    translate(location.x, location.y);
    rotate(angle-PI/2);
    float dist = dist(location.x,location.y,width/2,height/2);
    scale(map(dist,0,width/2,1,15));
    beginShape();
    vertex(-beamWidth,-beamLength);
    vertex(-beamWidth*1.5,beamLength);
    vertex(beamWidth*1.5,beamLength);
    vertex(beamWidth,-beamLength);
    //curveVertex(-50,50);
    endShape(CLOSE);
    popMatrix();
    popStyle();
  }
}
