
PVector leftHand = new PVector();
PVector leftTip = new PVector();
PVector leftThumb = new PVector();

//differences
float lDisHandTip ;
float lDisHandThumb ;
float lDisTipThumb ;

//distance between left hand and left tip
float lDisHandTip(){
 lDisHandTip = PVector.dist( leftHandPos(),leftTip());
 return lDisHandTip;  
}

//distance between left hand and left thumb
float lDisHandThumb(){
 lDisHandThumb = PVector.dist( leftHandPos(),leftThumb());
 println("left hand = " + leftHandPos());
 println("left thumb = " + leftThumb());
 return lDisHandThumb;  
}

//distance between left tip and left thumb
float lDisTipThumb(){
 lDisTipThumb = PVector.dist( leftTip(),leftThumb());
 return lDisTipThumb;  
}



PVector leftHandPos() {
  if (trailingJointPositions.size()>0) {
    leftHand = trailingJointPositions.get(4);
    // leftHand.mult(kinectScaling);
    //leftHand.y = height/2 - leftHand.y;
    //leftHand.x *= -1;
    //leftHand.x +=width/2;
    return leftHand;
  } else {
    PVector zero = new PVector(0, 0, 0);
    return zero;
  }
}


PVector leftTip() {
  if (trailingJointPositions.size()>0) {
    leftTip = trailingJointPositions.get(6);
    // leftHand.mult(kinectScaling);
   // leftTip.y = height/2 - leftTip.y;
    //leftHand.x *= -1;
    //leftHand.x +=width/2;
    return leftTip;
  } else {
    PVector zero = new PVector(0, 0, 0);
    return zero;
  }
}


PVector leftThumb() {
  if (trailingJointPositions.size()>0) {
    leftThumb = trailingJointPositions.get(8);
    // leftHand.mult(kinectScaling);
    //leftThumb.y = height/2 - leftThumb.y;
    //leftHand.x *= -1;
    //leftHand.x +=width/2;
    return leftThumb;
  } else {
    PVector zero = new PVector(0, 0, 0);
    return zero;
  }
}