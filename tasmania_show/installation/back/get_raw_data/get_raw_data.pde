//puppet
//by yuli cai, aaron montoya donald shorter 
//second version
//for salamanca moves festival
//september  2016

//define the ip addresses of other computers used
int computers = 2;

//declare array to contain the ip addresses
String[] ips = new String[2];

//declare and define the ip addresses used
String ipWindows = "172.17.76.141";;
String ipMacbook = "172.17.78.225";

//setup loop
void setup() {

  //canvas 300 px wide x 300 px high
  //3D renderer
  size(300, 300, P3D);

  //fill the ips arrays
  ips[0] = ipWindows;
  ips[1] = ipMacbook;

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