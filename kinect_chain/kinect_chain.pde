

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

//port for receving
int yuliIn = 1994;
boolean receivedOSC;

float[] xPos = new float[10];
float[] yPos = new float[10];
float[] zPos = new float[10];

PVector leftHand = new PVector();


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
  
  setupOSC();
  
}

void draw() {
  background(255);
  updateValues();
  println(leftHand.x);
  if (beingDragged() ) {
    println("dragged");
    for (Chain c : chains) {
      c.dragged=true;
    }
  }
  if (beingReleased()) {
    println("released");
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

PVector leftHandPos() {
  if (trailingJointPositions.size()>0) {

    leftHand = trailingJointPositions.get(4);
   // leftHand.mult(kinectScaling);
    leftHand.y = height/2 - leftHand.y;
    //leftHand.x *= -1;
    //leftHand.x +=width/2;
    return leftHand;
  } else {
    PVector zero = new PVector(0, 0, 0);
    return zero;
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