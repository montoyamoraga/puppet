PVector centerCorner = new PVector(-0.08,-1.50,4.35);
PVector centerFront = new PVector(-0.16,-0.02,2.74);
PVector leftCorner = new PVector(0.05,-0.46,4.45);
PVector front_Hand = new PVector(-0.07,-0.55,2.40);
PVector back_Hand = new PVector(-0.21,-0.08,3.10);

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

void printCalibX() {
  
  for (int i = 0; i < xCalib.length; i++) {
    println(xCalib[i]);
  }
  
}

/*
centerCorner
 void calibration() {
 middleThreshold = toWorld(data1);
 depthThreshold = toWorld(data2);
 zoneEdge = toWorld(data3);
 frontHand = toWorld(data4);
 backHand = toWorld(data5);  
 }
 */