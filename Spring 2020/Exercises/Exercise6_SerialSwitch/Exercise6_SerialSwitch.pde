  import processing.serial.*;

  float boxX;
  float boxY;
  int boxSize = 20;
  boolean LEDstate = false;
  Serial port;

  void setup() {
    size(200, 200);
    boxX = width / 2.0;
    boxY = height / 2.0;
    rectMode(RADIUS);

    printArray(Serial.list());

    port = new Serial(this, Serial.list()[4], 9600);
  }

void draw() {
    background(153);

    if(LEDstate == true){ fill(0);}
    else{ fill(255);}
    rect(boxX, boxY, boxSize, boxSize);
  }
  
  
void mouseReleased(){
  if (mouseX > boxX - boxSize && mouseX < boxX + boxSize &&
      mouseY > boxY - boxSize && mouseY < boxY + boxSize) {
    if(LEDstate == true){
      LEDstate = false;
      port.write('H');
    }else{
      LEDstate = true;
      port.write('L');
    }
  }
}
