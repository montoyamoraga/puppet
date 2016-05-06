//Particle[] particles = new Particle[10];
ArrayList<Particle> particles = new ArrayList<Particle>();
Sun s;

float angle = 0;
int initParticleNum = 10;

int lowSpeedCount = 0;
float speedThreshold = 80;

int mode = 0;
boolean mouseMiddle = false;

int isCenterCounter = 0;
int timer = 0;
int timer2 = 0;


int scene = 1;

void setup() {
  size(640, 360, P3D);
  //fullScreen(P3D);

  for ( int i = 0; i< initParticleNum; i++) {
    PVector pos = new PVector(random(0, width), random(0, height), random(-100, 100));
    particles.add(new Particle(random(1, 2), pos));
  }
  s = new Sun(0, 0);
  rectMode(CENTER);
}

PVector center = new PVector(width/2, height/2, 0);

void draw() {
  if (scene == 1) {
    following();
  }
  if (scene == 2) {
    pulling();
  }
  //switch (scene) {
  //case 1:
  // following();
  //case 2:
  // pulling();
  //}
}


void following() {
  background(0);

  // spotLight(255, 255, 255, width/2, height/2, 1000, 0, 0, -1, PI/4, 20);
  lights();
  sphereDetail(8);  
  PVector mousePos = new PVector(mouseX, mouseY, 0);
  PVector pmousePos = new PVector(pmouseX, pmouseY, 0);
  PVector mouseSpeed = PVector.sub(mousePos, pmousePos);
  float mSpeed = mouseSpeed.mag();
  PVector mDir = mouseSpeed.normalize();
  float xDir = mouseX - pmouseX;
  //keep the size in explosion time in 2000
  if (particles.size()>2000) {
    particles.remove(0);
  }

  if (lowSpeedCount>300 && particles.size()>10) {
    particles.remove(0);
  }


  if (xDir>0) {
    particles.add(new Particle(random(1, 4), new PVector(random(width), random(height), random(100))));
    for (Particle p : particles) {
      p.applyForce(mouseSpeed);
      p.update();
    }
  }

  s.location = new PVector(mouseX, mouseY);
  for (Particle p : particles) {
    PVector force = s.getAttractForce(p);
    //if (particles.size()>150) {
    //  force.mult(-1);
    //}

    if (mouseMiddle()) {    
      force.mult(0);
    }
    p.applyForce(force);
    p.run();
  }

  if (mouseMiddle()&&isCenterCounter>0) {
    timer++;
    if (timer>150) {
      timer2++;
      //dim it to white    
      for (int i = 0; i< 70; i++) {
        int base = 50 + i*3;
        if (timer2>base) {    
          background(base);
          if (base>250) {
            scene = 2;
          }
        }
      }
    }
  }
  s.display();
}

void pulling() {
  background(255);
  fill(0);
  ellipse(width/2, height/2, 50, 50);
}



boolean mouseMiddle() {
  //in the kinect mode, it should be 3D, including z parameters to claim the center area
  if (mouseX<= width/2) {
    mouseMiddle = true;
  } else {
    mouseMiddle = false;
    isCenterCounter++;
  }
  return mouseMiddle;
}