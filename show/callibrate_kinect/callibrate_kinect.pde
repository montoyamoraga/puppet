//choreographic interventions
//final project
//by yuli cai, aaron montoya donald shorter 
//april-may 2016

//define the ip addresses of other computers used
String ipYuliVisualsLeft = "172.16.253.83";
String ipAaronVisualsRight = "172.16.220.163";
String ipAaronAudio = "172.16.219.239";

//setup loop
void setup() {

  //canvas 300 px wide x 300 px high
  //3D renderer
  size(300, 300, P3D);

  //function for kinect setup
  //setupKinect();

  //setup OSC communication
  setupOSC();

  //green background
  background(0, 255, 0);
}

//draw loop
void draw() {

  //get data from Kinect
 //getKinectData();

  //check if there is data
  if (trailingJointPositions.size() > 0) {
    //send the data to the other computers
    sendRawData(toYuliVisualsLeft);
    sendRawData(toAaronVisualsRight);
    sendRawData(toAaronAudio);
  }
}