//choreographic interventions
//final project
//by yuli cai, aaron montoya donald shorter 
//april-may 2016

//define the ip addresses of other computers used
int computers = 3;

//declare array to contain the ip addresses
String[] ips = new String[3];

//declare and define the ip addresses used
String ipYuliVisualsLeft = "192.168.1.50";
String ipAaronVisualsRight = "192.168.1.31";
String ipAaronAudio = "172.16.219.239";

//setup loop
void setup() {

  //canvas 300 px wide x 300 px high
  //3D renderer
  size(300, 300, P3D);

  //fill the ips arrays
  ips[0] = ipYuliVisualsLeft;
  ips[1] = ipAaronVisualsRight;
  ips[2] = ipAaronAudio;

  //function for kinect setup
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
  sendToComputers();
}

void sendToComputers() {
  //check if there 
  if (trailingJointPositions.size() > 0) {
    //send the data to the other computers
    for (int i = 0; i < ips.length; i++) {
      sendRawData(addresses[i]);
    }
  }
}