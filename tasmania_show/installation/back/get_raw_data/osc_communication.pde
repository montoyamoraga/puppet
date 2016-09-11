//import osc libraries for communication
import oscP5.*;
import netP5.*;

//declare objects for communication
OscP5 handlerOSC;

//declare array to contain the ip addresses
NetAddress[] addresses = new NetAddress[2];

//declare sending and receiving port numbers
int sendingPort;
int receivingPort;

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

//function for setting up OSC communicatoin
void setupOSC() {

  //define sending and receiving port numbers
  sendingPort = 1993;
  receivingPort = 5555;

  //receive
  //start oscP5 hander object
  //listening for incoming messages at port 5555
  handlerOSC = new OscP5(this, receivingPort);

  //define net addresses for other computers

  for (int i = 0; i < addresses.length; i++) {
    addresses[i] = new NetAddress(ips[i], sendingPort);
  }
}

//function for sendin the rawData from the computer 
void sendRawData(NetAddress computer) {

  String header = "/rawData";

  OscMessage rawData = new OscMessage(header);

  for (int i = 0; i < jointsNum; i++) {

    rawData.add(trailingJointPositions.get(i).x);
    rawData.add(trailingJointPositions.get(i).y);
    rawData.add(trailingJointPositions.get(i).z);
  }
  //append the number of skeletons tracked
  rawData.add(skeletonsTracked);
  //send the raw data to the desired computer
  //through the set port
  handlerOSC.send(rawData, computer);
}