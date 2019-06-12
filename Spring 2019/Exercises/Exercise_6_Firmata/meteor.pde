class Meteor{
  
  PVector loc;
  PVector target;
  float easing = 0.09;
  float transparency;
  ArrayList<PVector> history;
  float size = 2;
  float hue;


  Meteor(float _x, float _y){
    loc = new PVector(_x,_y);
    init();
  }
  
  void init(){
    target = new PVector(loc.x,loc.y);
    history = new ArrayList<PVector>();
    history.add(new PVector(loc.x,loc.y));
  }
  void update(){
        
    PVector offset = PVector.sub(target,loc);
    //print("old loc: "+loc);
    //if(history.size()>0) print(history.get(history.size()-1));
    history.add(new PVector(loc.x,loc.y));
    //can't use add(loc) because loc is a reference, not real value

    loc.add(offset.mult(easing));
    //closer to the end, more transparent it is
    transparency = map(offset.mag(),0,5,0,255);

    if(history.size()>20){
      // remove the oldest one
      history.remove(0);
    }
  }
  
  void display(){
    pushStyle();
    //println("################");
    //println(history);
    colorMode(HSB,360,100,100);
    strokeWeight(size);
    for(int i = 1; i<history.size(); i++){
       stroke(hue,100,100,transparency/(history.size()-i+1));
       line(history.get(i-1).x,history.get(i-1).y,history.get(i).x,history.get(i).y);
    }
    popStyle();
  }
  
  void setNewTarget(float _x,float _y){
    target.set(_x,_y);
  }
  
  void setColor(float c){
    hue = c;
  }
}
