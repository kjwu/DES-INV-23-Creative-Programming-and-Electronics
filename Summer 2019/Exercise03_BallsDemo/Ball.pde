class Ball{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float radius;
  float rotateSpeed;
  float degree;
  color c;
  
  
  Ball(){
    c = color(random(250),random(250),random(250));
    degree = random(360);
    radius = 10;
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-2,2), random(-2,2));
  }
  
  void update(){
    
    //acceleration = new PVector(random(-0.1,0.1),random(-0.1,0.1));
    PVector mouse = new PVector(mouseX, mouseY);
    PVector force = PVector.sub(mouse, location);
    force.normalize();
    force.mult(0.2);
    
    acceleration = force;
    
    
    checkEdges();

    velocity.add(acceleration);
    velocity.limit(10);
    location.add(velocity);
    
    spin();
  }
  
  
  void display(){
    fill(c);
    pushMatrix();
    translate(location.x,location.y);
    rotate(radians(degree));
    rect(0,0, radius*3, radius*2);
    popMatrix();
  }
  
  
  void spin(){
    rotateSpeed = (random(-10,10));
    degree = (degree+rotateSpeed)%360;
  }
  
  
  void checkEdges(){
    
    if(location.x>width){
      location.x = 0;
    }else if(location.x < 0){
      location.x = width;
    }

    if(location.y>height){
      location.y = 0;
    }else if(location.y < 0){
      location.y = height;
    }

    
    //if(location.x>width|| location.x < 0){
    //  velocity.x = - velocity.x;
    //}
    
    //if(location.y>height|| location.y < 0){
    //  velocity.y = - velocity.y;
    //}
    
  }
}
