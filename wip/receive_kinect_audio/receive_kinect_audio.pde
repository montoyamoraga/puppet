//choreographic interventions
//final project
//by yuli cai, aaron montoya donald shorter 
//april 2016

void setup() {

  //receive
  //start oscP5, listening for incoming messages at port 54321
  oscP5 = new OscP5(this, 54321);

  /* myRemoteLocation is a NetAddress. a NetAddress  takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device, 
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */
  //send
  oscToMax = new NetAddress("localhost", 12345);
  oscToProcessing = new NetAddress("localhost", 22345);
}

void draw() {
}