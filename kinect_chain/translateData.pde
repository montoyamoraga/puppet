//raw data from max
//___________________________________________________________________________
PVector leftHand = new PVector();
PVector leftTip = new PVector();
PVector leftThumb = new PVector();

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
PVector lHandToWorld = new PVector();
PVector lHandToWorld() {
  lHandToWorld =new PVector(leftHand().x*kinectScaling,leftHand().y*kinectScaling, leftHand().z*kinectScaling);
  lHandToWorld.y = - lHandToWorld.y;
  lHandToWorld.x *= -1;
  lHandToWorld.x += width/2;
  return lHandToWorld;
}