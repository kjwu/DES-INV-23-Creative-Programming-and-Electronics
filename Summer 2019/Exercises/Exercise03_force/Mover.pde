class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration; 
  float topSpeed = 4;
  
  Mover(){
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    //acceleration = new PVector(-0.001,0.1); //constant acceleration
    acceleration = new PVector(0,0);
  }
  
  PVector attract(PVector attractor){
    PVector force = PVector.sub(attractor, location);
    float distance = force.mag();
    //println(distance);
    distance = constrain(distance, 5,25);
    force.normalize();
    force.mult(0.15);
    //forace
    return force;
  }
  
  
 PVector repel(PVector predator){
    PVector force = PVector.sub(location,predator);
    float distance = force.mag();
    //println(distance);
    force.normalize();
    force.mult(2);
    force.div(distance);
    //forace
    return force;
  }
  
  void applyForce(PVector force){
    acceleration.add(force);
  }
  void update(){
    //acceleration = PVector.random2D(); // random accelertion
    //acceleration.mult(random(2));
    
      
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);
    
    acceleration.mult(0);

  }
  
  void display(){
    ellipse(location.x,location.y,15,15);
  }
  
  void checkEdges(){
    if(location.x>width){
       location.x = 0;
    }else if (location.x<0){
      location.x = width;
    }
    
    if(location.y>height){
       location.y = 0;
    }else if (location.y<0){
      location.y = height;
    }    
   
    
    
    //if(location.x > width||location.x<0){
    //  velocity.x*=-1;
    //}
    //if(location.y > height||location.y<0){
    //  velocity.y*=-1;
    //}
  }

}
