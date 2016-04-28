
//object for sending to wekinator
NetAddress p5toWekinator;

//declare strings for sending messages
String oscWekinatorFlag = "/wek/inputs/";

void sendToWekinator() {


      String header = oscWekinatorFlag;
      
      OscMessage toWekinator = new OscMessage(header);
      toWekinator.add(lHandSpeed);
      
      visualsWekinator.send(toWekinator, p5toWekinator);
    }
  }