class Portal{
  float posX,posY;
  float size;
  float age;
  float angle;
  float initialColor;
  float growSpeed;
  
  boolean state = false;
  boolean showStones = false;

  
  Portal(float x, float y, float s, float a, float c, float sd){
    posX = x;
    posY = y;
    size = s;
    age = 0;
    angle = a;
    initialColor = c;
    growSpeed = sd;
  }
  
  void init(float x, float y, float s, float a, float c, float sd){
        posX = x;
    posY = y;
    size = s;
    age = 0;
    angle = a;
    initialColor = c;
    growSpeed = sd;
  }
  
  void display(){

    pushMatrix();
      translate(posX,posY);
      //rotate(radians(angle));
      pushStyle();
        colorMode(HSB, 360, 100, 100);
        strokeWeight(2);
        //fill(age*10+initialColor,60,80,2);
        //noFill();
        stroke(age*15+initialColor,60,100); 
                fill(age*15+initialColor,60,100,5);

        circle(0,0,size);
        //rectMode(CENTER);
        //rect(0,0,size,size);
        
        if(showStones){
          noStroke();
          fill(age*4+initialColor,30,100);
          for(int i = 0; i < 360; i +=15){
            float shift = random(-5,5);
            ellipse(size*cos(radians(i+shift))/2,size*sin(radians(i+shift))/2, 5,5);
          }
        }
        
      popStyle();
    popMatrix();
  }
  
  void toggleStones(){
    showStones = !showStones;
  }
  
  void update(){
    age+=growSpeed;
    size+=age;
  }
}
