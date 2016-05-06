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
  //chain1 = new Chain(200, 20, 12, 0.2);
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
  for (Chain c : chains) {
    c.updateTail((int)toWorld(leftHand()).x, (int)toWorld(leftHand()).y);
    // c.updateTail(mouseX, mouseY);
  }
  for (Chain c : chains) {
    c.display();
  }
  pleftHand = toWorld(leftHand());
  speedCheckCounter++;
}

void detectMode() {
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
  //if (mode == 1) {
  //  for (Chain c : chains) {
  //    c.release();
  //  }
  //} else if (mode == 2) {
  //  for (Chain c : chains) {
  //    c.dragged=true;
  //  }
  //}
}

int mode = 0;
void keyPressed() {
  if (key == 'a' || key == 'A') {
    scene = 1;
  }
  if (key == 'b' || key == 'B') {
    scene = 2;
  }
  if (keyCode == UP) {
    mode = 1;
  }
  if (keyCode == DOWN) {
    mode = 2;
  }
}