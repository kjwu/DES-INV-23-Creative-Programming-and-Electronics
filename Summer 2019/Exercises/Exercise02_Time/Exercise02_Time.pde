/*
* Time Exercise
* DES-INV 23 June 17 Kuan-Ju WU
*/

long millis;
int sec;
int min;
int hour;
int day;
int month;
int year;


void setup(){
  fullScreen();
}

void draw(){
  background(10);
  millis = millis();
  sec = second();
  min = minute();
  hour = hour();
  day = day();
  month = month();
  year = year();

  
  fill(100,200,10);
  rect(0,0, map(sec,0,60,0,width), height);
  //rect(500,80, 100*cos(radians(millis)), 50);
  
  fill(10,100,10);

  arc(width/2, height/2, 500, 500, -PI/2, -PI/2+(map(millis()%1000, 0,1000,0,2*PI)), PIE);

  
  
  pushMatrix();
  translate(width - 100, height - 100);
  renderText();
  popMatrix();
 
}

void renderText(){

  
  println(millis+ ","+sec+ ","+min+ ","+hour+ ","+day+ ","+month+ ","+year );
  textSize(10);
  text(year, 0, 10);
  text(month, 0, 20);
  text(day, 0, 30);
  text(hour, 0, 40);
  text(min, 0, 50);
  text(sec, 0, 60);
  text(millis, 0, 70);
  
}
