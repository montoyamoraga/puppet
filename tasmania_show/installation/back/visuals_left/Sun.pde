//based on shiffman's work

class Sun {
  float mass;
  PVector location;
  float G;

  Sun(float x, float y, float z) {
    location = new PVector(x, y, z);
    mass = 80;
    G = 20.0;
  }

  PVector getAttractForce( Particle p) {
    PVector force  = PVector.sub(location, p.loc);
    float d = force.mag();  //disatance between objects
    d = constrain(d, 5.0, 25.0);
    float strength = (G*mass*p.mass)/(d*d);
    force.setMag(strength);
    return force;
  }

  void display() {
    stroke(255);
    noFill();
    pushMatrix();
    translate(location.x, location.y);
    sphere(20);
    popMatrix();
  }
}