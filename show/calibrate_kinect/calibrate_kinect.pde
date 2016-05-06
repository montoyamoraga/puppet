//choreographic interventions
//final project
//by yuli cai, aaron montoya donald shorter 
//april-may 2016

//define the ip addresses of other computers used
int computers = 3;

//declare array to contain the ip addresses
String[] ips = new String[3];

//declare and define the ip addresses used
String ipYuliVisualsLeft = "172.16.253.83";
String ipAaronVisualsRight = "172.16.220.163";
String ipAaronAudio = "172.16.219.239";

//boolean for current states
boolean isCalibrating;
boolean isRunning;

//colos for interface
color colorCalibrate = color(192, 192, 192);
color colorRun = color(0, 0, 0);
color colorText = color(255, 255, 255);

//setup loop
void setup() {

  //canvas 300 px wide x 300 px high
  //3D renderer
  size(300, 300, P3D);

  //initial state is callibrate
  isCalibrating = false;
  isRunning = false;

  //fill the ips arrays
  ips[0] = ipYuliVisualsLeft;
  ips[1] = ipAaronVisualsRight;
  ips[2] = ipAaronAudio;

  //function for kinect setup
  setupKinect();

  //setup OSC communication
  setupOSC();

  //setup calibration
  setupCalibration();

  //green background
  background(0, 0, 0);

  fill(colorCalibrate);
  rect(0, 0, width/2, height);
  fill(colorRun);
  rect(width/2, 0, width, height);

  fill(colorText);
  textAlign(CENTER);
  textSize(32);
  text("calibrate", width/4, height/4);
  text("run", 3*width/4, height/4);
}

//draw loop
void draw() {

  if (isCalibrating) {
    //get data from Kinect
    //getKinectData();
    calibrationRoutine();

    if (calibrationReady) {
      sendCalibrationToComputers();
      calibrationReady = false;
    }
  }

  //check if there is data
  if (isRunning) {
    //get data from Kinect
    getKinectData();
    //send raw data to all of computers
    sendRawToComputers();
  }
}

void sendRawToComputers() {
  //check if there 
  if (trailingJointPositions.size() > 0) {
    //send the data to the other computers
    for (int i = 0; i < ips.length; i++) {
      sendRawData(addresses[i]);
    }
  }
}

void sendCalibrationToComputers() {
  //check if there is data
  if (trailingJointPositions.size() > 0) {
    //send the data to the other computers
    for (int i = 0; i < ips.length; i++) {
      sendCalibrationData(addresses[i]);
    }
  }
}

void mouseClicked() {
  if (mouseX > 0 && mouseX < width/2) {
    isCalibrating = true;
    isRunning = false;
  } else if (mouseX > width/2 && mouseX < width) {
    isCalibrating = false;
    isRunning = true;
  }
}