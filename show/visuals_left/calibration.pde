
//manual calibration
PVector centerCorner = new PVector(-0.12,-1.39,4.3);
PVector centerFront = new PVector(-0.24,-0.03,2.77);
PVector leftCorner = new PVector(0.56,-0.40,4.34);
PVector front_Hand = new PVector(-0.15,-0.31,2.38);
PVector back_Hand = new PVector(-0.36,-0.22,3.18);

void defaultValues() {
  //intro part
  //center zone declaration
  //the position where dancer facing straight to the middle of kinect
  middleThreshold = toWorld(centerCorner).x;
  //middleThreshold = 240;
  // less than this depthThreshold, closer to the audience
  depthThreshold = toWorld(centerFront).z;
  //depthThreshold  = 400; 
  zoneEdge = toWorld(leftCorner).x;
  //zoneEdge = 280.0;


  //chain part
  //the z position of the left hand is connected to the size of the ellipse
  frontHand = toWorld(front_Hand).z;
  //frontHand =350.0;
  backHand = toWorld(back_Hand).z;
  //backHand  = 600.0;
}



/*
void calibration() {
  middleThreshold = toWorld(data1);
  depthThreshold = toWorld(data2);
  zoneEdge = toWorld(data3);
  frontHand = toWorld(data4);
  backHand = toWorld(data5);  
}
*/