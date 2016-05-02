//choreographic interventions
//final project
//by yuli cai, aaron montoya donald shorter 
//april-may 2016






String macbook_aaron = "172.16.223.211";
String macbook_yuli = "172.16.255.221";

//setup loop
void setup() {

  //canvas 200 px wide x 200 px high
  //3D renderer
  size(200, 200, P3D);

  //function for setting up the kinect
  setupKinect();

  //setup OSC communication
  setupOSC();

  //green background
  background(0, 255, 0);
}

//draw loop
void draw() {

  //get data from Kinect
  getKinectData();

  //check if there is data
  if (trailingJointPositions.size() > 0) {
    //send the data to an external Max patch
    //on another computer
    sendToAaron();
    sendToYuli();
  }
  
}