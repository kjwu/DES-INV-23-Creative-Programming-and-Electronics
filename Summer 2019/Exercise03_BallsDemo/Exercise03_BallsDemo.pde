

Ball[] balls = new Ball[20];

void setup(){
  size(500,500);
  for(int i= 0 ; i < balls.length ; i++){
    balls[i] = new Ball();
  }
}

void draw(){
  background(100);
  
  for(int i= 0 ; i < balls.length ; i++){

    balls[i].update();
    balls[i].display();
  }

}
