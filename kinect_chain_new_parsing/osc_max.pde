//import osc libraries for communication
import oscP5.*;
import netP5.*;

//declare object for communication with max
OscP5 kinectData;

void setupOSCMax() {
  //listen to incoming messages from max at port 1994 
  kinectData = new OscP5(this, 1994);
}

void oscEvent(OscMessage theOscMessage) {
  receivedOSC = true;
  receiveOSCMax(theOscMessage);
  receiveOSCWekinator(theOscMessage);
}

void receiveOSCMax(OscMessage theOscMessage) {

  if (theOscMessage.checkAddrPattern("/headers")==true) {
    /* check if the typetag is the right one. */
    if (theOscMessage.checkTypetag("f")) {
      for (int i = 0; i < 10; i++) {
        xPos[i] = theOscMessage.get(i*3).floatValue();
        yPos[i] = theOscMessage.get(i*3+1).floatValue();
        zPos[i] = theOscMessage.get(i*3+2).floatValue();
      }
      
      /* parse theOscMessage and extract the values from the osc message arguments. */
      int firstValue = theOscMessage.get(0).intValue();  
      float secondValue = theOscMessage.get(1).floatValue();
      String thirdValue = theOscMessage.get(2).stringValue();
      print("### received an osc message /test with typetag ifs.");
      println(" values: "+firstValue+", "+secondValue+", "+thirdValue);
      return;
    }
  }
}