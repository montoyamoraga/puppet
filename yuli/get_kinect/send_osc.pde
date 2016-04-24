//import osc libraries for communication
import oscP5.*;
import netP5.*;

//declare objects for communication
OscP5 oscP5;
NetAddress oscToMax;
NetAddress oscToProcessing;

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
  oscToMax = new NetAddress("localhost", 1989);
}

void sendToMax() {

  //for (int i = 0; i < trailingJointPositions.size(); i++) {
  for (int i = 0; i < 11; i++) {
    for (int j = 0; j < 3; j++) {
      String headers = oscJoints[i] + oscPos[j];
      OscMessage sendingMessage = new OscMessage(headers);
      //OscMessage myMessage = new OscMessage(oscJoints[i]);
      sendingMessage.add(random(50));
      oscP5.send(sendingMessage, oscToMax);
    }
  }
}