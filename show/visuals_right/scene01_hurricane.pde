//scene 1: intro

int initParticleNum = 10;
ArrayList<Particle> particles = new ArrayList<Particle>();
Sun sun;

PVector leftHandSpeed = new PVector();
PVector pleftHandPos = new PVector(0, 0, 0);

int lowSpeedCount = 0;


float speedThreshold = 40;
boolean posMiddle = false;

//zoned ared definition
//need to be calibrated in the scene, when facing the kinect, what x pos it is to set the middle line
float middleThreshold = 260.0; //the position where dancer facing straight to the middle of kinect
float depthThreshold  = 400.0; // less than this depthThreshold, closer to the audience

float zoneEdge = 280.0;


int isCenterCounter = 0;
int timer = 0;
int timer2 = 0;

//variable specially for right side screen
boolean coverMode = true;

void scene01Setup() {

  for ( int i = 0; i< initParticleNum; i++) {
    PVector pos = new PVector(0, random(0, height), random(-100, 100));
    particles.add(new Particle(random(1, 2), pos));
  }

  sun = new Sun(0, 0, 0);
}

void scene01Update() {
  background(0);
  //spotLight(255, 255, 255, width/2, height/2, 1000, 0, 0, -1, PI/4, 1);
  lights();
  sphereDetail(8); 
  float xDir = toWorld(leftHand()).x - pleftHandPos.x;
  println("xDir= " + xDir);

  leftHandSpeed = PVector.sub(toWorld(leftHand()), pleftHandPos);
  if (particles.size()>3000) {
    particles.remove(0);
  }


  if (xDir>0.0) {
    particles.add(new Particle(random(1, 4), new PVector(random(width), random(height), random(100))));
    for (Particle p : particles) {
      p.applyForce(leftHandSpeed);
      p.update();
    }
  }

  sun.location = new PVector(introPos(toWorld(leftHand())).x, introPos(toWorld(leftHand())).y);
  println("x!!!!!= "+introPos(toWorld(leftHand())).x);

  for (Particle p : particles) {
    PVector force = sun.getAttractForce(p);

    if (!posMiddle()) {
      force.mult(0);
    }
    p.applyForce(force);
    p.run();
  }

  if (!posMiddle()&&isCenterCounter>0) {
    coverMode = false;
    timer++;
    println("timer= " +timer);
    if (timer>150) {
      timer2++;
      //dim it to white    
      for (int i = 0; i< 50; i++) {
        int base = 100 + i*3;
        if (timer2>base) {  
          particles.add(new Particle(random(1, 4), new PVector(random(width), random(height), random(100))));
          //background(base);
          if (base>240) {
            scene = 2;
          }
        }
      }
    }
  }
  sun.display();
  pleftHandPos = toWorld(leftHand());
    if (coverMode) {
    background(0);
  }
}

//using spine instead of hand pos

//Create a function to map the data for intro screens (lefthandx,0,width/2,0,width)
// put the postision which is already translated by the toWorld function as the perameter
PVector introPos(PVector input) {
  PVector output = new PVector(input.x, input.y, input.z);
  float m = map(input.x, 0.0, width/2, 0.0, width);
  output.x = m;
  return output;
}

boolean posMiddle() {
  float zoneWidth = abs(zoneEdge - middleThreshold);
  //in the scope, declare the center area zone
  if (toWorld(leftHand()).x <= (middleThreshold+zoneWidth) 
    && toWorld(leftHand()).x>=(middleThreshold-zoneWidth)
    &&toWorld(leftHand()).z>=depthThreshold) {
    posMiddle = true;
    isCenterCounter++;
    println("zoned!!!!");
  } else {
    posMiddle = false;
  }
  return posMiddle;
}