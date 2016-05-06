
void defaultValues() {
  //intro part
  //center zone declaration
  //the position where dancer facing straight to the middle of kinect
  middleThreshold = 240;
  // less than this depthThreshold, closer to the audience
  depthThreshold  = 400; 
  zoneEdge = 280.0;
  
  
  //chain part
  //the z position of the left hand is connected to the size of the ellipse
  frontHand =350.0;
  backHand  = 600.0;

}

void printCalibX() {
  
  for (int i = 0; i < xCalib.length; i++) {
    println(xCalib[i]);
  }
  
  
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