class Particle {

  PVector loc;
  PVector vel;
  PVector acc;
  float lifespan;
  float mass;
  float velLimit = 20.0;

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
    noStroke();
    fill(255);
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    sphere(mass*10);
    popMatrix();
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

  void mouseForce(float px, float py) {
    PVector targetLoc = new PVector(px, py);
    PVector dir = PVector.sub(loc, targetLoc);
    //d = dir.mag();
    dir.normalize();
    dir.mult(-1);
    applyForce(dir);
  }

  void bounds() {
    if (loc.y > height || loc.y < 0) {
      vel.y *= -1;
    }
    if (loc.x > width || loc.x < 0) {
      vel.x *= -1;
    }
    if(loc.z>100 || loc.z < -20){
     vel.z *= -1; 
    }
  }


  void run() {

    display();
    bounds();
    update();
  }
}