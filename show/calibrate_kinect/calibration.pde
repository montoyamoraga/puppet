int numberCalibration;
float[] calibrationValues = new float[7];
boolean continueCalibration;

void setupCalibration() {
  numberCalibration = 0;
  continueCalibration = false;
}

void calibrationRoutine() {
  if (numberCalibration == 0) {
    println("donald go to cornerCenter position");
  } else if (numberCalibration == 1) {
    println("donald go to cornerLeft position");
  } else if (numberCalibration == 2) {
    println("donald go to frontCenter position");
  } else if (numberCalibration == 3) {
    println("donald go to mainHandFront");
  } else if (numberCalibration == 4) {
    println("donald go to mainHandBack");
  } else if (numberCalibration == 5) {
    println("thanks donald!");
    isCalibrating = false;
    numberCalibration = 0;
  }
}

void keyPressed() {
  if (isCalibrating && keyCode == 32) {
    continueCalibration = true;
    numberCalibration = numberCalibration + 1;
  }
}

void fillCalibration() {
  
  trailingJointPositions.add(trailingJoint.getPosition().copy());
  KinectPV2.JointType_WristLeft;
}