//choreographic interventions
//final project
//by yuli cai, aaron montoya donald shorter 
//april 2016

//setup loop
void setup() {
  
  //canvas 1024 px wide x 768 px high
  //3D renderer
  size(10, 10, P3D);

  //function for setting up the kinect
  setupKinect();
  
  //setup OSC server for communication
  setupOSC();
  
  background(255, 0, 0);

}

//draw loop
void draw() {
  
  //function for updating kinect data
  updateKinectSkeletons();
  
  sendToMax();
  
  //print an array of raw data
  //the structure is an array of 11 arrays
  //each array has 3 number represents the xyz position
  println(trailingJointPositions);
}