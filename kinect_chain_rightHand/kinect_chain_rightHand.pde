//choreographic interventions
//final project
//by yuli cai, aaron montoya donald shorter 
//april-may 2016

//import libraries for strings drawing
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

// Reference to physics "world" (2D)
VerletPhysics2D physics;

//creat a arraylist to store all of our chains
ArrayList<Chain> chains = new ArrayList<Chain>();

//creat an arraylist to store all of our referenced physics world, each to a different chain
ArrayList<VerletPhysics2D> physicWorlds = new ArrayList<VerletPhysics2D>();

//our chains number
int chainNum = 20;
int gap = 0;

//receving port
//1994 raw data
//1995 smoot data
int yuliIn = 1993;

//boolean to check if there has
//been an incoming OSC message
boolean receivedOSC;

//float arrays to store
//all of the joints pvectors
float[] xPos = new float[10];
float[] yPos = new float[10];
float[] zPos = new float[10];

void setup() {
  size(400, 300);
  //fullScreen();
  smooth();
  gap = int(width / chainNum);
  // Initialize the physics world
  for (int i = 0; i<chainNum; i++) {
    physicWorlds.add(new VerletPhysics2D());
  }
  for (int i =0; i< physicWorlds.size(); i++) {
    physicWorlds.get(i).addBehavior(new GravityBehavior(new Vec2D(0, 0.1)));
    physicWorlds.get(i).setWorldBounds(new Rect(0, 0, width, height));
  }

  // Initialize couple of chains
  //chain1 = new Chain(200, 20, 12, 0.2);
  for (int i = 0; i<chainNum; i++) {
    float initxPos = 20+i*gap;
    //Chain(total length, numpoints, ellipse radius, strength, initial x, physics world)
    chains.add(new Chain(300, 20, 12, 0.2, initxPos, physicWorlds.get(i)));
  }

  setupOSCMax();
  setupOSCWekinator();
}

void draw() {
  background(255);
  //println("width = " + width +",height= "+height);
  //println("x= " + toWorld(leftHand()).x + "y= " +  toWorld(leftHand()).y);
  fill(255, 0, 0);
  //ellipse(toWorld(leftThumb()).x, toWorld(leftThumb()).y, 5, 5);
  //ellipse(toWorld(leftHand()).x, toWorld(leftHand()).y, 5, 5);
  //ellipse(toWorld(leftTip()).x, toWorld(leftTip()).y, 5, 5);
  ellipse(toWorld(rightThumb()).x, toWorld(rightThumb()).y, 5, 5);
  ellipse(toWorld(rightHand()).x, toWorld(rightHand()).y, 5, 5);
  ellipse(toWorld(rightTip()).x, toWorld(rightTip()).y, 5, 5);
 // ellipse(toWorld(kneeLeft()).x, toWorld(kneeLeft()).y, 5, 5);
 // ellipse(toWorld(kneeRight()).x, toWorld(kneeRight()).y, 5, 5);
  //ellipse(toWorld(spineBase()).x, toWorld(spineBase()).y, 5, 5);
  //ellipse(toWorld(head()).x, toWorld(head()).y, 10, 10);
  updateValues();
  detectMode();
  for (VerletPhysics2D p : physicWorlds) {
    p.update();
  }
  for (Chain c : chains) {
    c.updateTail((int)toWorld(rightHand()).x, (int)toWorld(rightHand()).y);
   // c.updateTail(mouseX, mouseY);
  }
  for (Chain c : chains) {
    c.display();
  }

  sendToWekinator();
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


void detectMode() {
  //categoryWekinator 1= release
  //categoryWekinator 2 = hold, dragged
  if (mode == 1) {
    for (Chain c : chains) {
      c.release();
    }
  } else if (mode == 2) {
    for (Chain c : chains) {
      c.dragged=true;
    }
  }
}

int mode = 0;
void keyPressed() {
  if (keyCode == UP) {
    mode = 1;
  }
  if (keyCode == DOWN) {
    mode = 2;
  }
}