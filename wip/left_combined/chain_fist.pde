//scene 2

// Reference to physics "world" (2D)
VerletPhysics2D physics;

//creat a arraylist to store all of our chains
ArrayList<Chain> chains = new ArrayList<Chain>();

//creat an arraylist to store all of our referenced physics world, each to a different chain
ArrayList<VerletPhysics2D> physicWorlds = new ArrayList<VerletPhysics2D>();

//our chains number
int chainNum = 20;
int gap = 0;
int speedCheckCounter = 0;

//variables that need to be calibrated
//the z position of the left hand is connected to the size of the ellipse
float frontHand =350.0;
float backHand  = 600.0;

PVector prightHand = new PVector(0, 0, 0);
int scissorCounting = 0;

void chainFistSetup() {
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
  for (int i = 0; i<chainNum; i++) {
    float initxPos = 20+i*gap;
    //Chain(total length, numpoints, ellipse radius, strength, initial x, physics world)
    chains.add(new Chain(300, 20, 12, 0.2, initxPos, physicWorlds.get(i)));
  }
}

void chainFist() {
  leftHandSpeed = PVector.sub(toWorld(leftHand()), pleftHand);
  background(255);
  detectMode();
  for (VerletPhysics2D p : physicWorlds) {
    p.update();
  }
  println("chainZ = " + toWorld(leftHand()).z);
  for (Chain c : chains) {
    c.updateTail((width-(int)toWorld(leftHand()).x), (int)toWorld(leftHand()).y);
    c.radius = toWorld(leftHand()).z;
    //c.radius = c.radius/4;
    c.radius = map(c.radius, frontHand, backHand, 30, 1);
  }
  for (Chain c : chains) {
    //println("RADIUS= " +c.radius);
    c.display();
  }
  pleftHand = toWorld(leftHand());
  speedCheckCounter++;
}

void detectMode() {
  println("scissorCounting = "+scissorCounting);
  if (skeletonsTracked>1) {
    scissorCounting++;
  }
  if (scissorCounting>200) {
    categoryWekinator =2;
  }
  //categoryWekinator 2= release
  //categoryWekinator 1 = hold, dragged
  if (speedCheckCounter>10) {
    if (categoryWekinator == 2.0) {
      for (Chain c : chains) {
        c.release();
      }
    }
    if (categoryWekinator == 1.0) {
      for (Chain c : chains) {
        c.dragged=true;
      }
    }
    speedCheckCounter = 0;
  }  


}