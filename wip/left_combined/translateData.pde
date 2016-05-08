//raw data from max
//___________________________________________________________________________
PVector leftHand = new PVector();
PVector leftTip = new PVector();
PVector leftThumb = new PVector();
PVector rightHand = new PVector();
PVector rightTip = new PVector();
PVector rightThumb = new PVector();
PVector head = new PVector();
PVector spineBase = new PVector();
PVector kneeLeft = new PVector();
PVector kneeRight = new PVector();

PVector leftHand() {
  if (trailingJointPositions.size()>0) {
    leftHand = trailingJointPositions.get(4);
    return leftHand;
  } else {
    PVector zero = new PVector(0, 0, 0);
    return zero;
  }
}


PVector leftTip() {
  if (trailingJointPositions.size()>0) {
    leftTip = trailingJointPositions.get(6);
    return leftTip;
  } else {
    PVector zero = new PVector(0, 0, 0);
    return zero;
  }
}


PVector leftThumb() {
  if (trailingJointPositions.size()>0) {
    leftThumb = trailingJointPositions.get(8);
    return leftThumb;
  } else {
    PVector zero = new PVector(0, 0, 0);
    return zero;
  }
}

PVector rightHand() {
  if (trailingJointPositions.size()>0) {
    leftHand = trailingJointPositions.get(5);
    return leftHand;
  } else {
    PVector zero = new PVector(0, 0, 0);
    return zero;
  }
}


PVector rightTip() {
  if (trailingJointPositions.size()>0) {
    leftTip = trailingJointPositions.get(7);
    return leftTip;
  } else {
    PVector zero = new PVector(0, 0, 0);
    return zero;
  }
}


PVector rightThumb() {
  if (trailingJointPositions.size()>0) {
    leftThumb = trailingJointPositions.get(9);
    return leftThumb;
  } else {
    PVector zero = new PVector(0, 0, 0);
    return zero;
  }
}

PVector head() {
  if (trailingJointPositions.size()>0) {
    head = trailingJointPositions.get(0);
    return head;
  } else {
    PVector zero = new PVector(0, 0, 0);
    return zero;
  }
}

PVector spineBase() {
  if (trailingJointPositions.size()>0) {
    spineBase = trailingJointPositions.get(1);
    return spineBase;
  } else {
    PVector zero = new PVector(0, 0, 0);
    return zero;
  }
}

PVector kneeLeft() {
  if (trailingJointPositions.size()>0) {
    kneeLeft = trailingJointPositions.get(2);
    return kneeLeft;
  } else {
    PVector zero = new PVector(0, 0, 0);
    return zero;
  }
}

PVector kneeRight() {
  if (trailingJointPositions.size()>0) {
    kneeRight = trailingJointPositions.get(3);
    return kneeRight;
  } else {
    PVector zero = new PVector(0, 0, 0);
    return zero;
  }
}




//differences, distances, also what we send to wekinator to analyse
//___________________________________________________________________________
float lDisHandTip ;
float lDisHandThumb ;
float lDisTipThumb ;

//distance between left hand and left tip
float lDisHandTip() {
  lDisHandTip = PVector.dist( leftHand(), leftTip());
  return lDisHandTip;
}

//distance between left hand and left thumb
float lDisHandThumb() {
  lDisHandThumb = PVector.dist( leftHand(), leftThumb());
  return lDisHandThumb;
}

//distance between left tip and left thumb
float lDisTipThumb() {
  lDisTipThumb = PVector.dist( leftTip(), leftThumb());
  return lDisTipThumb;
}



//to the visual world cordinate 
//___________________________________________________________________________
//expecting an input of raw data from kinect, a PVector
PVector toWorld(PVector input) {
  PVector output = new PVector(input.x* kinectScaling, input.y*kinectScaling, input.z*kinectScaling);
  output.y = height-(height/2+output.y);
  output.x -=width/2;
  output.x *= -1;
  return output;
}