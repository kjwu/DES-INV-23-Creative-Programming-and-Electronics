  import processing.serial.*;
  Serial port;
  int lastPositionX;

  void setup() {
    size(256, 150);

    println("Available serial ports:");
    printArray(Serial.list());

    port = new Serial(this, Serial.list()[4], 9600);
  }

  void draw() {
    // draw a gradient from black to white
    for (int i = 0; i < 256; i++) {
      stroke(i);
      line(i, 0, i, 150);
    }

    // write the current X-position of the mouse to the serial port as
    // a single byte
    if(mouseX != lastPositionX){
      port.write(byte(mouseX));
      lastPositionX = mouseX;  
    }
  }
