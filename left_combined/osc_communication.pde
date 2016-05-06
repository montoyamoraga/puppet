//import osc libraries for communication
import oscP5.*;
import netP5.*;

boolean isRunning;
boolean isCalibrating;



//declare object for communication
OscP5 kinectData;

void setupOSCMax() {
  //listen to incoming messages at port 1993 
  kinectData = new OscP5(this, 1993);
}

void oscEvent(OscMessage theOscMessage) {
  receivedOSC = true;
  receiveOSCProcessing(theOscMessage);
  receiveOSCWekinator(theOscMessage);
}

void receiveOSCProcessing(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/rawData")) {
    /* check if the typetag is the right one. */

    isRunning = true;
    isCalibrating = false;

    // println(theOscMessage);

    for (int i = 0; i < 10; i++) {
      xPos[i] = theOscMessage.get(i*3).floatValue();
      yPos[i] = theOscMessage.get(i*3+1).floatValue();
      zPos[i] = theOscMessage.get(i*3+2).floatValue();
    }
    skeletonsTracked = theOscMessage.get(30).intValue();
    println("skeletonsTracked!= " + skeletonsTracked);
  } else if (theOscMessage.checkAddrPattern("/calibrationData")) {

    isRunning = false;
    isCalibrating = true;

    for (int i = 0; i < 5; i++) {
      xCalib[i] = theOscMessage.get(i*3).floatValue();
      yCalib[i] = theOscMessage.get(i*3+1).floatValue();
      zCalib[i] = theOscMessage.get(i*3+2).floatValue();
    }
  }
}