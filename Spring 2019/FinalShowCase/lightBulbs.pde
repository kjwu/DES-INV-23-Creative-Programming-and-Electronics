class LightBulbs {
  int amount;
  String ipBase;
  String ipBroadcast;
  int port;
  String[] ips;
  int[] brightnesses;
  int LightMode;

  boolean doStair = false;
  boolean doChase = false;
  boolean doEQ = false;
  boolean doFFT = false;
  boolean showOnScreen = false;

  int deg = 0;


  LightBulbs(String _ipBase, int _port, int _amount) {
    amount = _amount;
    ipBase = _ipBase;
    port = _port;
  }

  void init() {
    ipBroadcast = ipBase+"255";
    ips = new String[amount];
    brightnesses = new int[amount];

    for (int i = 0; i < amount; i++) {
      ips[i]=ipBase+str(i+10+1);
      brightnesses[i]=0;
    }
  }

  void update() {
    if (doStair) {
      updateStair(30);
    } else if (doChase) {
      updateChase();
    } else if (doEQ) {
      updateEQ();
    } else if (doFFT) {
      updateFFT();
    }
    if(frameCount%10 ==0){
      broadCast();
    }
  }


  void allOn() {
     showOnScreen = false;
      LightMode = 0;
    reset();
    //for (int i = 0; i < amount; i++) {
    //  brightnesses[i]=100;
    //}
  }

  void allOff() {
    showOnScreen = false;
    LightMode = 1;
    reset();

     
    //for (int i = 0; i < amount; i++) {
    //  brightnesses[i]=0;
    //}
  }
  
   void chase() {
    showOnScreen = false;
    LightMode = 2;
    reset();

   }

   void sinWave() {
    showOnScreen = false;
    LightMode = 3;
    reset();

   }


  void startStair() {
    for (int i = 0; i < amount; i++) {
      if (i%2 == 0) { // even number
        brightnesses[i] = 0;
      } else {
        brightnesses[i] = 100;
      }
      //print(brightnesses[i] + " ");
    }
    reset();
    doStair = true;
    //println();
  }

  void updateStair(int speed) {
        showOnScreen = false;

    for (int i = 0; i < amount; i++) {
      if (frameCount%speed == 0) { // even number
        brightnesses[i] = 100 - brightnesses[i];
      }
      //print(brightnesses[i] + " ");
    }
    //println();
  }

  void startChase() {
    reset();
    doChase = true;
  }

  void startEQ() {
    reset();
    doEQ = true;
  }

  void startFFT() {
    reset();
    doFFT = true;
  }

  void updateFFT() {
    showOnScreen = true;
    reset();    
    doFFT = true;    
    for (int i = 0; i <amount; i++) { 
      brightnesses[i] =  0;
    }

    int lowBand = (int)(sum[60]*30000);
    int midBand = (int)(sum[30]*30000);
    int highBand = (int)(sum[10]*15000);

    //println(lowBand);
    brightnesses[(int)amount/2] = lowBand;
    brightnesses[(int)amount/2+1] = midBand;
    brightnesses[(int)amount/2-1] = midBand;

    brightnesses[(int)amount/2+2] = highBand;
    brightnesses[(int)amount/2-2] = highBand;

}


  void updateChase() {
        showOnScreen = false;

    reset();    
    doChase = true;    

    for (int i = 0; i <amount; i++) { 
      brightnesses[i] = (int)map(abs(sin(radians(deg-i*20))), 0, 1, 100, 0);
    }

    deg = (deg+2)%360;

  }


  void reset() {
    doEQ = false;
    doFFT = false;
    doStair = false;
    doChase = false;
  }


  void updateEQ() {
        showOnScreen = true;

    int middle = floor(amount/2);
    int range = (int)map(volumn, 0, 0.07, 0, amount/2);
    range = constrain(range, 0, amount/2);

    for (int i = 0; i < amount; i++) {
      brightnesses[i]=0;
    }

    for (int i = 0; i < range; i ++) {
      brightnesses[middle+i] = 100;
      brightnesses[middle-i] = 100;
    }
  }

  void display() {
    if(showOnScreen){
    for (int i = 0; i < amount; i++) {
      
      pushMatrix();
      fill(map(brightnesses[i], 0, 100, 0, 255));
      translate(width/(amount+1)*(i+1), height/2);
      ellipse(0, 0, brightnesses[i]/4, brightnesses[i]/4);
      popMatrix();
    }
    }
  }

  void broadCast() {
    for (int i = 0; i < amount; i++) {
      byte touchByte[] = {byte(i+1), byte(LightMode)};
      udp.send(touchByte, ips[i], port);
      //udp.send(touchByte, ipBroadcast, port);

  }
  //  byte touchByte[] = {byte(5), byte(LightMode)};
  //    udp.send(touchByte, ipBroadcast, port);
    
  }
}
