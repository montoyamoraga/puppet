//choreographic interventions
//final project
//by yuli cai, aaron montoya donald shorter 
//april 2016

String macbook_receive = "172.16.221.149";

//setup loop
void setup() {

  //canvas 1024 px wide x 768 px high
  //3D renderer
  size(200, 200, P3D);

  //function for setting up the kinect
  setupKinect();

  //setup OSC server for communication
  setupOSC();

  //green background
  background(0, 255, 0);
}

//draw loop
void draw() {

  //function for updating kinect data
  updateKinectSkeletons();

  //check if the array is being generated
  //it is only generated when there is a skeleton being tracked
  if (trailingJointPositions.size() > 0) {
    //send the data to an external Max patch
    sendToMax();
  }
  
}