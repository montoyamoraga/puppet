 //raw data from windows machine

//pvectors for storing raw data from kinect
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

PVector avgLeftHand = new PVector(0,0,0);

//vector at origin (0,0,0)
PVector origin = new PVector(0, 0, 0);

//scaling for full screen
float scaling = 400.0;
//scaling for 600px x 400px
//float scaling = 200.0;

PVector head() {
  if (trailingJointPositions.size()>0) {
    head = trailingJointPositions.get(0);
    return head;
  } else {
    return origin;
  }
}

PVector spineBase() {
  if (trailingJointPositions.size()>0) {
    spineBase = trailingJointPositions.get(1);
    return spineBase;
  } else {
    return origin;
  }
}

PVector kneeLeft() {
  if (trailingJointPositions.size()>0) {
    kneeLeft = trailingJointPositions.get(2);
    return kneeLeft;
  } else {
    return origin;
  }
}

PVector kneeRight() {
  if (trailingJointPositions.size()>0) {
    kneeRight = trailingJointPositions.get(3);
    return kneeRight;
  } else {
    return origin;
  }
}


PVector leftHand() {
  if (trailingJointPositions.size()>0) {
    leftHand = trailingJointPositions.get(4);
    return leftHand;
  } else {
    return origin;
  }
}

PVector rightHand() {
  if (trailingJointPositions.size()>0) {
    rightHand = trailingJointPositions.get(5);
    return rightHand;
  } else {
    return origin;
  }
}


PVector leftTip() {
  if (trailingJointPositions.size()>0) {
    leftTip = trailingJointPositions.get(6);
    return leftTip;
  } else {
    return origin;
  }
}



PVector rightTip() {
  if (trailingJointPositions.size()>0) {
    leftTip = trailingJointPositions.get(7);
    return leftTip;
  } else {
    return origin;
  }
}

PVector leftThumb() {
  if (trailingJointPositions.size()>0) {
    leftThumb = trailingJointPositions.get(8);
    return leftThumb;
  } else {
    return origin;
  }
}


PVector rightThumb() {
  if (trailingJointPositions.size()>0) {
    leftThumb = trailingJointPositions.get(9);
    return leftThumb;
  } else {
    return origin;
  }
}


PVector avgLeftHand() {
  PVector leftHandCopy = leftHand().copy();
  avgLeftHand.add(leftHandCopy.mult(0.10));
  avgLeftHand = avgLeftHand.mult(0.90);

  return avgLeftHand;
}


//to the visual world cordinate 
//expecting an input of raw data from kinect, a PVector
PVector toWorld(PVector input) { 
  PVector output = input.copy();
  output.mult(scaling);
  //PVector output = new PVector(input.x* scaling, input.y*scaling, input.z*scaling);
  output.y = height-(height/2+output.y);
  output.x +=width/2;
  //output.x *= -1;
  return output;
}