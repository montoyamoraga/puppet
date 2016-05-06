//choreographic interventions
//final project
//by yuli cai, aaron montoya donald shorter 
//april-may 2016

//import libraries for strings drawing
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

//receving port
//1994 raw data
//1995 smoot data
int yuliIn = 1993;

//boolean to check if there has
//been an incoming OSC message
boolean receivedOSC;

//switching from intro to the second scene
int scene = 1;



//float arrays to store
//all of the joints pvectors
float[] xPos = new float[10];
float[] yPos = new float[10];
float[] zPos = new float[10];

void setup() {
  //size(1280, 800, P3D);
   fullScreen(P3D);
  smooth();
  spinningHurricaneSetup();
  chainFistSetup();
  setupOSCMax();
  setupOSCWekinator();
}

void draw() {
  println("y= " + toWorld(leftHand()).x);


  updateValues();
  if (scene == 1) {
    spinningHurricane();
  } else if (scene == 2) {
    chainFist();
  }

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
if(leftHandSpeed.mag()>0){
  sendToWekinator();
}
}

void updateValues() {
  if (receivedOSC) {
    //delete old values
    while (trailingJointPositions.size() > 0) {
      trailingJointPositions.remove(0);
    }

    //retrieve from OSC
    for (int i = 0; i < 10; i++) {
      PVector aux = new PVector(xPos[i], yPos[i], zPos[i]);
      trailingJointPositions.add(aux);
    }
  }
}