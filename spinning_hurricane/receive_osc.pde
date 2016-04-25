//import osc libraries for communication
import oscP5.*;
import netP5.*;

//declare objects for communication
OscP5 oscP5;

//declare strings for sending messages
String[] oscJoints = {
  "/hand_left", 
  "/hand_right", 
  "/foot_left", 
  "/foot_right", 
  "/head", 
  "/spine_mid", 
  "/spine_base", 
  "/knee_left", 
  "/knee_right", 
  "/shoulder_left", 
  "/shoulder_right"
};

//declare strings for sending messages
String[] oscPos = {
  "/x", 
  "/y", 
  "/z"
};

void setupOSC() {

  //receive
  //start oscP5, listening for incoming messages at port 1993
  //oscP5 = new OscP5(this, 1993);
  oscP5 = new OscP5(this, macbook_aaron, yuliIn, OscP5.TCP);
 
}

void receiveOSC() {
  //for (int i = 0; i < trailingJointPositions.size(); i++) {
  for (int i = 0; i < jointsNum; i++) {
    for (int j = 0; j < 3; j++) {
      String headers = oscJoints[i] + oscPos[j];
      OscMessage sendingMessage = new OscMessage(headers);
      if (j == 0) {
        sendingMessage.add(trailingJointPositions.get(i).x);
      } else if (j == 1) {
        sendingMessage.add(trailingJointPositions.get(i).y);
      } else if (j == 2) {
        sendingMessage.add(trailingJointPositions.get(i).z);
      }
     
    }
  }
}

void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  //print("### received an osc message.");
  //print(" addrpattern: "+theOscMessage.addrPattern());
  //println(" typetag: "+theOscMessage.typetag());
 println(theOscMessage.get(0).intValue(), theOscMessage.get(1).intValue());
}