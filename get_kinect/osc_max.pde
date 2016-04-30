//import osc libraries for communication
import oscP5.*;
import netP5.*;

//declare objects for communication
OscP5 oscP5;
NetAddress oscToMax;
NetAddress oscToProcessing;

//declare strings for sending messages
String[] oscJoints = {
  "/head",
  "/spine_base",
  "/knee_left", 
  "/knee_right", 
  "/hand_left", 
  "/hand_right",
  "/hand_tip_left", 
  "/hand_tip_right",
  "/thumb_left",
  "/thumb_right"
};

//declare strings for sending messages
String[] oscPos = {
  "/x", 
  "/y", 
  "/z"
};

void setupOSC() {

  //receive
  //start oscP5, listening for incoming messages at port 5555
  oscP5 = new OscP5(this, 5555);

  /* myRemoteLocation is a NetAddress. a NetAddress  takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */
  //send
  oscToMax = new NetAddress(macbook_aaron, 1989);
}

void sendToMax() {
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
      oscP5.send(sendingMessage, oscToMax);
    }
  }
}