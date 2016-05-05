//scene 1: intro

int initParticleNum = 10;
ArrayList<Particle> particles = new ArrayList<Particle>();
Sun s;

PVector leftHandSpeed = new PVector();
PVector pleftHand = new PVector(0, 0, 0);

int lowSpeedCount = 0;
float speedThreshold = 40;
boolean posMiddle = false;
int middleThreshold = width/2;

void spinningHurricaneSetup() {

  for ( int i = 0; i< initParticleNum; i++) {
    PVector pos = new PVector(random(0, width), random(0, height), random(-100, 100));
    particles.add(new Particle(random(1, 2), pos));
  }

  s = new Sun(0, 0, 0);
}

void spinningHurricane() {
  background(0);
  //updateKinectSkeletons();
  spotLight(255, 255, 255, width/2, height/2, 1000, 0, 0, -1, PI/4, 20);
  sphereDetail(8); 

  
  leftHandSpeed = PVector.sub(toWorld(leftHand()), pleftHand);
  if (particles.size()>2000) {
    particles.remove(0);
  }

  if (lowSpeedCount>300 && particles.size()>10) {
    particles.remove(0);
  }

  if (leftHandSpeed.mag()>speedThreshold) {
    lowSpeedCount = 0;
    particles.add(new Particle(random(1, 2), toWorld(leftHand())));
    for (Particle p : particles) {
      p.applyForce(leftHandSpeed);
      p.update();
    }
  } else if (leftHandSpeed.mag()<speedThreshold) {
    lowSpeedCount++;
  }
  s.location = new PVector(toWorld(leftHand()).x, toWorld(leftHand()).y);

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
  pleftHand = toWorld(leftHand());
}

boolean posMiddle() {
  if (toWorld(leftHand()).x<=middleThreshold) {
    posMiddle = true;
  } else {
    posMiddle = false;
  }
  return posMiddle;
}