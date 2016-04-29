
//object for sending to wekinator
NetAddress p5toWekinator;

OscP5 chainWekinator;

//declare strings for sending messages
String oscWekinatorFlag = "/wek/inputs/";

void sendToWekinator() {


  String header = oscWekinatorFlag;

  OscMessage toWekinator = new OscMessage(header);
  toWekinator.add(leftHandPos().x);
  toWekinator.add(leftHandPos().y);
  toWekinator.add(leftHandPos().x);
  toWekinator.add(leftHandPos().y);
  toWekinator.add(leftHandPos().x);
  toWekinator.add(leftHandPos().y);
  chainWekinator.send(toWekinator, p5toWekinator);
}