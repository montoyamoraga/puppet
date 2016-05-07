//choreographic interventions
//final project
//by yuli cai, aaron montoya donald shorter 
//april-may 2016

//variable for choosing scene
int scene = 1;

//full screen width is 1440
void setup() {
  //size(1280, 800, P3D);
  size(600, 400, P3D);
  //fullScreen(P3D);

  defaultValues();
  smooth();
  spinningHurricaneSetup();
  chainFistSetup();
  setupOSC();
}

void draw() {
  
  
  //println("x= " + toWorld(leftHand()).x);


  updateValues();

  //if (isCalibrating) {
  //  printCalibX();
  //}


  if (scene == 1) {
  spinningHurricane();
  } else if (scene == 2) {
  chainFist();
  }
  
  
  /*
  //drawing all the joints
   fill(255, 0, 0);
   ellipse(toWorld(leftThumb()).x, toWorld(leftThumb()).y, 5, 5);
   ellipse(toWorld(leftHand()).x, toWorld(leftHand()).y, 5, 5);
   ellipse(toWorld(leftTip()).x, toWorld(leftTip()).y, 5, 5);
   ellipse(toWorld(rightThumb()).x, toWorld(rightThumb()).y, 5, 5);
   ellipse(toWorld(rightHand()).x, toWorld(rightHand()).y, 5, 5);
   ellipse(toWorld(rightTip()).x, toWorld(rightTip()).y, 5, 5);
   ellipse(toWorld(kneeLeft()).x, toWorld(kneeLeft()).y, 5, 5);
   ellipse(toWorld(kneeRight()).x, toWorld(kneeRight()).y, 5, 5);
   ellipse(toWorld(spineBase()).x, toWorld(spineBase()).y, 5, 5);
   ellipse(toWorld(head()).x, toWorld(head()).y, 10, 10);
   */
}