//import osc libraries for communication
import oscP5.*;
import netP5.*;

//booleans to set the current state
boolean isRunning;
boolean isCalibrating;

//declare object for communication
OscP5 kinectData;

//receving port
int receivePort;

//boolean to check if there has
//been an incoming OSC message
boolean receivedOSC;

//float arrays to store
//all of the joints pvectors
float[] xPos = new float[10];
float[] yPos = new float[10];
float[] zPos = new float[10];

//float arrays to store
//the calibration data
float[] xCalib = new float[5];
float[] yCalib = new float[5];
float[] zCalib = new float[5];

//array of vectors for joints
ArrayList<PVector> trailingJointPositions = new ArrayList<PVector>();
ArrayList<PVector> calibJointPositions = new ArrayList<PVector>();

//number of skeletons tracked
int skeletonsTracked;

//setup osc initial values
void setupOSC() {
  //set the receive port
  receivePort = 1993;

  //listen to incoming messages at port 1993 
  kinectData = new OscP5(this, receivePort);
}

void oscEvent(OscMessage theOscMessage) {
  receivedOSC = true;
  receiveOSCProcessing(theOscMessage);
}

void receiveOSCProcessing(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/rawData")) {

    //update state
    isRunning = true;
    isCalibrating = false;

    //store the raw data values
    for (int i = 0; i < 10; i++) {
      xPos[i] = theOscMessage.get(i*3).floatValue();
      yPos[i] = theOscMessage.get(i*3+1).floatValue();
      zPos[i] = theOscMessage.get(i*3+2).floatValue();
    }
    skeletonsTracked = theOscMessage.get(30).intValue();
    println("skeletonsTracked!= " + skeletonsTracked);
  } else if (theOscMessage.checkAddrPattern("/calibrationData")) {

    //update state
    isRunning = false;
    isCalibrating = true;

    //store the calibration data values
    for (int i = 0; i < 5; i++) {
      xCalib[i] = theOscMessage.get(i*3).floatValue();
      yCalib[i] = theOscMessage.get(i*3+1).floatValue();
      zCalib[i] = theOscMessage.get(i*3+2).floatValue();
    }
  }
}

void updateValues() {
  if (receivedOSC) {
    //delete old values
    while (trailingJointPositions.size() > 0) {
      trailingJointPositions.remove(0);
    }

    while (calibJointPositions.size() > 0) {
      calibJointPositions.remove(0);
    }

    //retrieve from OSC
    if (isRunning == true) {
      for (int i = 0; i < 10; i++) {
        PVector aux = new PVector(xPos[i], yPos[i], zPos[i]);
        trailingJointPositions.add(aux);
      }
    } else if (isCalibrating == true) {
      for (int i = 0; i < 5; i++) {
        PVector aux = new PVector(xCalib[i], yCalib[i], zCalib[i]);
        calibJointPositions.add(aux);
      }
    }
  }
}