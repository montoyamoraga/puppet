//puppet
//by yuli cai, aaron montoya donald shorter 
//second version
//for salamanca moves festival
//september  2016

//variable for choosing scene
int scene = 2;

//full screen width is 1440
void setup() {
  noCursor();
  //size(1280, 800, P3D);
  //size(600, 400, P3D);
  fullScreen(P3D);

  defaultValues();
  smooth();
  scene01Setup();
  scene02Setup();
  setupOSC();
}

void draw() {

  println("x= " + toWorld(leftHand()).x);

  updateValues();

  //if (isCalibrating) {
  //  printCalibX();
  //}


  if (scene == 1) {
  scene01Update();
  } else if (scene == 2) {
  scene02Update();
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