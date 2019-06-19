class Mover{
  PVector location;
  PVector velocity;
  
  Mover(){
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-2,2),random(-2,2));
  }
  
  void update(){
    location.add(velocity);
  }
  
  void display(){
    ellipse(location.x,location.y,15,15);
  }
  
  void checkEdges(){
    //if(location.x>width){
    //   location.x = 0;
    //}else if (location.x<0){
    //  location.x = width;
    //}
    
    //if(location.y>height){
    //   location.y = 0;
    //}else if (location.y<0){
    //  location.y = height;
    //}    
   
    
    
    if(location.x > width||location.x<0){
      velocity.x*=-1;
    }
    if(location.y > height||location.y<0){
      velocity.y*=-1;
    }
  }

}
