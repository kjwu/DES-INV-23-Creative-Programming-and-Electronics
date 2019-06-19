class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration; 
  float topSpeed = 4;
  
  
  Mover(){
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    //acceleration = new PVector(-0.001,0.1); //constant acceleration
    acceleration = new PVector();
  }
  
  void update(){
    //acceleration = PVector.random2D(); // random accelertion
    //acceleration.mult(random(2));
    
    PVector mouse = new PVector(mouseX,mouseY);
    PVector dir = PVector.sub(mouse,location); // compute direction
    dir.normalize(); //normalize
    dir.mult(-0.1); //scale
    acceleration = dir; //assign
      
    velocity.add(acceleration);
    velocity.limit(topSpeed);
    location.add(velocity);

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
