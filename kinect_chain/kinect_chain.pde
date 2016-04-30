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
int chainNum = 10;

//receving port
//1994 raw data
//1995 smoot data
int yuliIn = 1995;

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
  smooth();

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
    float initxPos = i*50;
    //Chain(total length, numpoints, ellipse radius, strength, initial x, physics world)
    chains.add(new Chain(200, 20, 12, 0.2, initxPos, physicWorlds.get(i)));
  }

  setupOSCMax();
  setupOSCWekinator();
}

void draw() {
  background(255);
  fill(255, 0, 0);
  ellipse(leftThumb().x*kinectScaling, leftThumb().y*kinectScaling, 20, 20);
  ellipse(leftTip().x*kinectScaling, leftTip().y*kinectScaling, 20, 20);
  ellipse(leftHandPos().x*kinectScaling, leftHandPos().y*kinectScaling, 20, 20);
  updateValues();
  if (beingDragged() ) {

    for (Chain c : chains) {
      c.dragged=true;
    }
  }
  if (beingReleased()) {

    for (Chain c : chains) {
      c.release();
    }
  }
  for (VerletPhysics2D p : physicWorlds) {
    p.update();
  }
  for (Chain c : chains) {
    c.updateTail((int)leftHandPos().x, (int)leftHandPos().y);
  }
  for (Chain c : chains) {
    c.display();
  }

  sendToWekinator();

  //if (trailingJointPositions.size() > 0) {

  //}
}

void updateValues() {

  if (receivedOSC) {
    println("data");
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




boolean beingDragged() {
  if (leftHand.x>width/2) {
    return true;
  } else {
    return false;
  }
}

boolean beingReleased() {
  if (leftHand.x>width/2) {
    return false;
  } else {
    return true;
  }
}

void mousePressed() {
  // Check to see if we're grabbing the chain
  for (Chain c : chains) {
    c.dragged=true;
  }
}

void mouseReleased() {
  // Release the chain
  for (Chain c : chains) {
    c.release();
  }
}