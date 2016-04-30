//import osc libraries for communication
import oscP5.*;
import netP5.*;

//declare object for communication with max
OscP5 kinectData;

void setupOSCMax() {
  //listen to incoming messages from max at port 1994 
  kinectData = new OscP5(this, 1994);
}

void oscEvent(OscMessage theOscMessage) {
  receivedOSC = true;
  receiveOSCMax(theOscMessage);
  receiveOSCWekinator(theOscMessage);
}

void receiveOSCMax(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/head/x")) {
    xPos[0] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/head/y")) {
    yPos[0] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/head/z")) {
    zPos[0] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/spine_base/x")) {
    xPos[1] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/spine_base/y")) {
    yPos[1] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/spine_base/z")) {
    zPos[1] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/knee_left/x")) {
    xPos[2] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/knee_left/y")) {
    yPos[2] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/knee_left/z")) {
    zPos[2] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/knee_right/x")) {
    xPos[3] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/knee_right/y")) {
    yPos[3] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/knee_right/z")) {
    zPos[3] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/hand_left/x")) {
    xPos[4] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/hand_left/y")) {
    yPos[4] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/hand_left/z")) {
    zPos[4] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/hand_right/x")) {
    xPos[5] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/hand_right/y")) {
    yPos[5] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/hand_right/z")) {
    zPos[5] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/hand_tip_left/x")) {
    xPos[6] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/hand_tip_left/y")) {
    yPos[6] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/hand_tip_left/z")) {
    zPos[6] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/hand_tip_right/x")) {
    xPos[7] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/hand_tip_right/y")) {
    yPos[7] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/hand_tip_right/z")) {
    zPos[7] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/thumb_left/x")) {
    xPos[8] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/thumb_left/y")) {
    yPos[8] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/thumb_left/z")) {
    zPos[8] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/thumb_right/x")) {
    xPos[9] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/thumb_right/y")) {
    yPos[9] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/thumb_right/z")) {
    zPos[9] = theOscMessage.get(0).floatValue();
  }
  
}