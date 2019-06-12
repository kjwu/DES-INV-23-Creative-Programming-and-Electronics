class Firework{
  PVector location;  
  PVector velocity;
  //PVector speed;
  float speed;
  
  Firework(float _x, float _y){
    location = new PVector(_x,_y);
    init();
  }  
  
  void init(){
    speed = 5;
  }
  
  void update(){
    //speed = map(location.mag(),0,width/2,10,0.01); 
    speed = map(location.mag(),0,width/2,0.01,10);

    PVector increment = new PVector(location.x,location.y);
    increment.normalize();
    increment.mult(speed);
    location.add(increment);
    //location.mult(0.02);
  }
  
  
  void display(){
    pushStyle();
    colorMode(RGB);
    fill(255,255,255);

    //fill(100,255,200);

    pushMatrix();
    translate(location.x,location.y);
    rotate(location.heading()+PI/2);
    

    //ellipse(0,0, 100/speed,speed*2);
    
    ellipse(0,0, speed,speed*4);
    
    //strokeWeight(2);
    //stroke(255);
    
    //line(0,0,location.x,location.y);

    popMatrix();
    popStyle();
  }
}
