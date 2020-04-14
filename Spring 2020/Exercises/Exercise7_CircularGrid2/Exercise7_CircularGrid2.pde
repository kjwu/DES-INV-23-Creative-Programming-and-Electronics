

int arraySize = 18;
float r[] = new float[arraySize];
int n[] = new int[arraySize];

float dotSizeDelta = 0;

void setup(){
  size(800,800);
  
  for(int i = 0 ; i < arraySize; i++){
    r[i] = (i+1)*30;
    n[i] = (i+1)*6;
  }
}

void draw(){
  background(0);
  translate(width/2,height/2);
  
  dotSizeDelta = (dotSizeDelta+4)%360;
  for(int i = n.length-1; i >= 0 ; i--){
    float rad = r[i];
    float dist = TWO_PI*rad/n[i];
    for(float d = 0; d < TWO_PI*rad; d += dist ){
      pushMatrix();
        float angle = map(d/(TWO_PI*rad),0,1,0,TWO_PI);
        translate(rad*cos(angle),rad*sin(angle));
        float otherDotSize = map(cos(radians(dotSizeDelta-rad)),-1,1,5,20);
        pushMatrix();
        rotate(radians(frameCount));
        drawDot(otherDotSize);
        popMatrix();
        popMatrix();
  
    }    
  }
  
  float centerDotSize = map(cos(radians(dotSizeDelta)),-1,1,5,20);
  drawDot(centerDotSize);

}

void drawDot(float dotSize){
  noFill();
  stroke(255);
  circle(0,0,dotSize);
  rectMode(CENTER);
  rect(0,0,dotSize*1.5,dotSize*1.5);
}
