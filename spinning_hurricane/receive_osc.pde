//import osc libraries for communication
import oscP5.*;
import netP5.*;

//declare objects for communication
OscP5 oscP5;

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
  //start oscP5, listening for incoming messages at port 1993
  oscP5 = new OscP5(this, 1994);
  // oscP5 = new OscP5(this, macbook_aaron, yuliIn, OscP5.TCP);
}

void oscEvent(OscMessage theOscMessage) {

  receivedOSC = true;
  
  if (theOscMessage.checkAddrPattern("/hand_left/x")) {
    xPos[0] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/hand_left/y")) {
    yPos[0] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/hand_left/z")) {
    zPos[0] = theOscMessage.get(0).floatValue();
  }
  
  else if (theOscMessage.checkAddrPattern("/hand_right/x")) {
    xPos[1] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/hand_right/y")) {
    yPos[1] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/hand_right/z")) {
    zPos[1] = theOscMessage.get(0).floatValue();
  }
  
    else if (theOscMessage.checkAddrPattern("/foot_left/x")) {
    xPos[2] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/foot_left/y")) {
    yPos[2] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/foot_left/z")) {
    zPos[2] = theOscMessage.get(0).floatValue();
  }
  
    else if (theOscMessage.checkAddrPattern("/foot_right/x")) {
    xPos[3] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/foot_right/y")) {
    yPos[3] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/foot_right/z")) {
    zPos[3] = theOscMessage.get(0).floatValue();
  }
  
    else if (theOscMessage.checkAddrPattern("/head/x")) {
    xPos[4] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/head/y")) {
    yPos[4] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/head/z")) {
    zPos[4] = theOscMessage.get(0).floatValue();
  }
  
    else if (theOscMessage.checkAddrPattern("/spine_mid/x")) {
    xPos[5] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/spine_mid/y")) {
    yPos[5] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/spine_mid/z")) {
    zPos[5] = theOscMessage.get(0).floatValue();
  }
  
    else if (theOscMessage.checkAddrPattern("/spine_base/x")) {
    xPos[6] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/spine_base/y")) {
    yPos[6] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/spine_base/z")) {
    zPos[6] = theOscMessage.get(0).floatValue();
  }
  
    else if (theOscMessage.checkAddrPattern("/knee_left/x")) {
    xPos[7] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/knee_left/y")) {
    yPos[7] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/knee_left/z")) {
    zPos[7] = theOscMessage.get(0).floatValue();
  }
  
    else if (theOscMessage.checkAddrPattern("/knee_right/x")) {
    xPos[8] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/knee_right/y")) {
    yPos[8] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/knee_right/z")) {
    zPos[8] = theOscMessage.get(0).floatValue();
  }
  
    else if (theOscMessage.checkAddrPattern("/shoulder_left/x")) {
    xPos[9] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/shoulder_left/y")) {
    yPos[9] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/shoulder_left/z")) {
    zPos[9] = theOscMessage.get(0).floatValue();
  }
  
    
    else if (theOscMessage.checkAddrPattern("/shoulder_right/x")) {
    xPos[10] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/shoulder_right/y")) {
    yPos[10] = theOscMessage.get(0).floatValue();
  } else if (theOscMessage.checkAddrPattern("/shoulder_right/z")) {
    zPos[10] = theOscMessage.get(0).floatValue();
  }

  /* print the address pattern and the typetag of the received OscMessage */
  //println("### received an osc message.");
  //print(" addrpattern: "+theOscMessage.addrPattern());
  //println(" typetag: "+theOscMessage.typetag());
  //println(theOscMessage.get(0));
}