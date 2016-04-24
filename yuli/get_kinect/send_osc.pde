//import osc libraries for communication
import oscP5.*;
import netP5.*;

//declare objects for communication
OscP5 oscP5;
NetAddress oscToMax;
NetAddress oscToProcessing;

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
  oscToMax = new NetAddress("localhost", 6666);
}

void sendToMax() {

  String message = "whatever";

  OscMessage myMessage = new OscMessage(message);
  myMessage.add(50);
  oscP5.send(myMessage, oscToMax);
}