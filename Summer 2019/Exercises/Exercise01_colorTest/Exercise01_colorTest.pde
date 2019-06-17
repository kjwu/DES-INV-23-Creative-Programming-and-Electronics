void setup(){
  size(400,400);
  
  //for(int y = 20 ; y < height; y +=10){
    for(int x  = 20 ; x < width; x +=10){
      pushStyle();
      pushMatrix();
      translate(x,height/2);
      noStroke(); 
      colorMode(HSB,360,100,100);
      fill(x,100,100);
      rectMode(CENTER);
      rect(0,0,10,10);

      colorMode(RGB);
      fill(x,100,100);
      rect(0,30,10,10);

      

      popMatrix();
      popStyle();
      
    }
  //}
}

void draw(){
}
