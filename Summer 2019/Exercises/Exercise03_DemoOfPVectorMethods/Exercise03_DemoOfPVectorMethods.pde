PVector pointA;
PVector pointB;

void setup(){
  size(500,500);
  pointA = new PVector(width/2,height/2);
  pointB = new PVector();
}

void draw(){
  background(100);
  PVector mouse = new PVector(mouseX,mouseY);
  PVector diff = PVector.sub(mouse, pointA);
  diff.normalize();
  diff.mult(150);
  diff.mag();
  
  pointB = PVector.add(diff,pointA);
  
  fill(0,0,100);
  ellipse(pointA.x,pointA.y,50,50);
  ellipse(pointB.x,pointB.y,50,50);
  
  fill(255,0,0);
  ellipse(mouseX,mouseY,50,50);

  line(pointA.x,pointA.y, pointB.x, pointB.y);
}
