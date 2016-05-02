//object for communicating with wekinator
OscP5 visualsPatchWekinator;

//object for sending to wekinator
NetAddress p5toWekinator;

//declare strings for sending messages
String oscWekinatorFlag = "/wek/inputs/";
//out put from Wekinator
float categoryWekinator;

void setupOSCWekinator() {
  p5toWekinator= new NetAddress("127.0.0.1", 6448);
  ////listen to incoming messages from wekinator at port 12000
  visualsPatchWekinator = new OscP5(this, 12000);
}

//function for sending data to wekinator
void sendToWekinator() {
  OscMessage toWekinator = new OscMessage("/wek/inputs/");

  toWekinator.add(lDisHandTip());
  toWekinator.add(lDisHandThumb());
  toWekinator.add(lDisTipThumb());
  visualsPatchWekinator.send(toWekinator, p5toWekinator);
}

//wekinator handling
void receiveOSCWekinator(OscMessage theOscMessage) {

  if (theOscMessage.checkAddrPattern("/wek/outputs")) {
    if (theOscMessage.checkTypetag("f")) {
      categoryWekinator = theOscMessage.get(0).floatValue();
      //println(categoryWekinator);
    }
  }
}