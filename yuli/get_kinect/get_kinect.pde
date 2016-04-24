void setup() {

  size(1024, 768, P3D);
  //fullScreen(P3D);

  setupKinect();
}



void draw() {
  background(0);
  updateKinectSkeletons();
  
  
  //print an array of raw data
  //the structure is an array of 11 arrays
  //each array has 3 number represents the xyz position
  println(trailingJointPositions);
}  