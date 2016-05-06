class Particle {

  PVector loc;
  PVector vel;
  PVector acc;
  float lifespan;
  float mass;
  float velLimit = 20.0;
  float angle = 0.0;


  Particle(float _mass, PVector _loc) {
    acc = new  PVector(0, 0.05, 0);
    vel = new PVector(0, 0, 0);
    loc = _loc;
    lifespan = 255.0;
    mass = _mass;
  }



  void update() {

    vel.add(acc);
    vel.limit(velLimit);
    loc.add(vel);
    acc.mult(0);
    // lifespan -= 1.0;
  }

  void display() {
    float offset = 50.0*noise(0.09);
    noStroke();

    pushMatrix();

    translate(loc.x, loc.y, loc.z); 
    fill(255);
    sphere(mass*10);
    box(mass*5);  
    popMatrix();




    pushMatrix();
    translate(loc.x+offset, loc.y+offset, loc.z + offset); 
    sphere(mass*6);
    //ellipse(0,0,mass*6,mass*6);
    popMatrix();
    angle += 0.05;
  }


  void applyForce(PVector _force) {
    PVector f = PVector.div(_force, mass); 
    acc.add(f);
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }



  void bounds() {
    if (loc.y > height || loc.y < 0) {
      vel.y *= -0.7;
    }
    if (loc.x > width || loc.x < 0) {
      vel.x *= -0.7;
    }
    if (loc.z>100 || loc.z < -20) {
      vel.z *= -0.7;
    }
  }


  void run() {
    update();
    display();
    bounds();
  }
}