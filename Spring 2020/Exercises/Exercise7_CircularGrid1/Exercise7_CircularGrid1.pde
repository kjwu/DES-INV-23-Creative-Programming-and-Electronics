float r[] = {30, 60, 90 ,120, 150, 180, 210, 240, 270, 300};
int n[] = { 6, 12, 18, 24, 30, 36, 42, 48, 54, 60};

void setup(){
  size(800,800);
  translate(width/2,height/2);
  drawDot(5);
  for(int i = 0; i < n.length; i++){
    float rad = r[i];
    float dist = TWO_PI*rad/n[i];
    for(float d = 0; d < TWO_PI*rad; d += dist ){
      pushMatrix();
        float angle = map(d/(TWO_PI*rad),0,1,0,TWO_PI);
        translate(rad*cos(angle),rad*sin(angle));
        drawDot(5);
        popMatrix();
  
    }    
  }
}

void draw(){

}

void drawDot(float dotSize){
  circle(0,0,dotSize);
}
