//choreographic interventions
//final project
//by yuli cai, aaron montoya donald shorter 
//april 2016

//IP address of aaron's macbook
String macbook_aaron = "172.17.47.97";

//port for receiving
int yuliIn = 1994;

boolean receivedOSC;

float[] xPos = new float[11];
float[] yPos = new float[11];
float[] zPos = new float[11];

//Particle[] particles = new Particle[10];
ArrayList<Particle> particles = new ArrayList<Particle>();
Sun s;

float angle = 0;
int initParticleNum = 10;

int lowSpeedCount = 0;
float speedThreshold = 40;
int middleThreshold = width/2;

PVector pleftHand = new PVector(0, 0, 0);
PVector leftHand = new PVector(0, 0, 0);
boolean posMiddle = false;

void setup() {
  // size(640, 360, P3D);
  fullScreen(P3D);
  //setupKinect();
  setupOSC();

  for ( int i = 0; i< initParticleNum; i++) {
    PVector pos = new PVector(random(0, width), random(0, height), random(-100, 100));
    particles.add(new Particle(random(1, 2), pos));
  }

  s = new Sun(0, 0, 0);

  receivedOSC = false;
}

void draw() {

  background(0);
  //updateKinectSkeletons();
  spotLight(255, 255, 255, width/2, height/2, 1000, 0, 0, -1, PI/4, 20);
  sphereDetail(8); 

  updateValues();
  following();
  
  sendToWekinator();
}

void updateValues() {

  if (receivedOSC) {

    //delete old values
    while (trailingJointPositions.size() > 0) {
      trailingJointPositions.remove(0);
    }

    //retrieve from OSC
    for (int i = 0; i < 11; i++) {
      PVector aux = new PVector(xPos[i], yPos[i], zPos[i]);
      trailingJointPositions.add(aux);
    }
  }
}
PVector leftHandSpeed = new PVector();
float lHandSpeed = 0.0;
void following() {
  //get data from kinect: left hand pos-speed
  if (trailingJointPositions.size()>0) {
    leftHand = trailingJointPositions.get(1);
    leftHand.mult(kinectScaling);
    leftHand.y = height/2 - leftHand.y;

    //leftHand.x *= -1;
    leftHand.x +=width/2;
  }

  //kinect mode, hand position
  leftHandSpeed = PVector.sub(leftHand, pleftHand);
  lHandSpeed = leftHandSpeed.mag();
  // around 1-150
  //println(lHandSpeed);

  //setup 3D scene
  rotateY(angle);
  pushMatrix();
  translate(width/2, height/2, 40);
  //fill(200,20);
  noFill();
  box(width, height, 120);
  popMatrix();

  //keep the size in explosion time in 2000
  if (particles.size()>2000) {
    particles.remove(0);
  }

  if (lowSpeedCount>300 && particles.size()>10) {
    particles.remove(0);
  }

  if (lHandSpeed>speedThreshold) {
    lowSpeedCount = 0;
    particles.add(new Particle(random(1, 2), leftHand));
    for (Particle p : particles) {
      p.applyForce(leftHandSpeed);
      p.update();
    }
  } else if (lHandSpeed<speedThreshold) {
    lowSpeedCount++;
  }

  s.location = new PVector(leftHand.x, leftHand.y);
  for (Particle p : particles) {
    PVector force = s.getAttractForce(p);
    if (lowSpeedCount<20) {
      if (particles.size()>150) {
        force.mult(-1);
      }
    }

    if (!posMiddle()) {
      force.mult(0);
    }
    p.applyForce(force);
    p.run();
  }
  s.display();

  //update previous left hand position
  pleftHand = leftHand;
}

//function to detect whether the dancer is in the middle
//right now using left hand data 
boolean posMiddle() {
  if (leftHand.x<=middleThreshold) {
    posMiddle = true;
  } else {
    posMiddle = false;
  }
  return posMiddle;
}