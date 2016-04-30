
//object for sending to wekinator
NetAddress p5toWekinator;

//declare strings for sending messages
String oscWekinatorFlag = "/wek/inputs/";

void sendToWekinator() {

  //String header = oscWekinatorFlag;
  //OscMessage toWekinator = new OscMessage(header);

  OscMessage toWekinator = new OscMessage("/wek/inputs/");
  toWekinator.add(lDisHandTip());
  toWekinator.add(lDisHandThumb());
  toWekinator.add(lDisTipThumb());

  visualsWekinator.send(toWekinator, p5toWekinator);
}