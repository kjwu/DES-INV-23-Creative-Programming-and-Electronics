class Flower{
  PVector pos;
  PVector velocity;
  PVector acceleration;
  float initialR;
  float r;
  color c;
  float deg;
  float t;

  Flower(float _r){
    
    pos = new PVector(random(width), random(height));
    velocity = new PVector(random(-10,10), random(-10,10));
    acceleration = new PVector();
    r = _r;
    initialR= _r;
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
    if(r<initialR){
      r= (r+0.1);
    }else{
      r = 0.1;
    }
    pushMatrix();
    
    translate(pos.x,pos.y);
    rotate(radians(deg));
    stroke(255,100);
    noFill();
    //fill(c);
    for(float d = 0; d < 360; d+=45){
      rotate(radians(d));
      triangle(0,-r*2,-r,r*2,r,r*2);
    }
    fill(255,100  );

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
