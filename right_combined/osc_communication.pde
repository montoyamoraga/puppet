//import osc libraries for communication
import oscP5.*;
import netP5.*;

//declare object for communication with max
OscP5 kinectData;

void setupOSCMax() {
  //listen to incoming messages from max at port 1993 
  kinectData = new OscP5(this, 1993);
}

void oscEvent(OscMessage theOscMessage) {
  receivedOSC = true;
  receiveOSCMax(theOscMessage);
  receiveOSCWekinator(theOscMessage);
}

void receiveOSCMax(OscMessage theOscMessage) {

  if (theOscMessage.checkAddrPattern("/rawData")) {

    /* check if the typetag is the right one. */
    
   // println(theOscMessage);
    
    for (int i = 0; i < 10; i++) {
      xPos[i] = theOscMessage.get(i*3).floatValue();
      yPos[i] = theOscMessage.get(i*3+1).floatValue();
      zPos[i] = theOscMessage.get(i*3+2).floatValue();
    }
       skeletonsTracked = theOscMessage.get(30).intValue();
  }
}