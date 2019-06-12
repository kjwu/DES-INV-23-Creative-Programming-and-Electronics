class Mover{
  PVector pos;
  PVector velocity;
  PVector acceleration;
  float r;
  color c;
  float deg;
  float t;

  Mover(float _r){
    
    pos = new PVector(random(width), random(height));
    velocity = new PVector(random(-10,10), random(-10,10));
    acceleration = new PVector();
    r = _r;
    colorMode(HSB);
    c = color(random(200,300),255,255);
    deg = random(360);
    t = 0.05+random(10);
  }
  
  void update(){
    checkEdge();
    pos.add(velocity);
    velocity.add(acceleration);
    velocity.limit(5);
    
    //PVector mousePos = new PVector(mouseX, mouseY);
    //PVector dir = PVector.sub(mousePos, pos);
    //dir.normalize();
    //dir.mult(0.2);
    //acceleration = dir;
    acceleration.mult(0);
    if(deg>360){deg=0;}
    t++;
    deg+=noise(t)*20;
  }
  
  void applyForce(PVector force){
    acceleration.add(force);
  }
  
  void display(){
    pushMatrix();
    
    translate(pos.x,pos.y);
    rotate(radians(deg));
    noStroke();
    fill(c);
    for(float dd = 0; dd < 360; dd+=45);{
      rotate(radians(dd));
      triangle(0,-r*2,-r,r*2,r,r*2);
    }
    fill(255);

    ellipse(0,0,r,r);

    popMatrix();
  }
  
  void checkEdge(){
    if(pos.x>width){
      pos.x = 0;
    }else if(pos.x<0){
      pos.x = width;
    }
    
    if(pos.y>height){
      pos.y = 0;
    }else if(pos.y<0){
      pos.y = height;
    }
  }
  
}
