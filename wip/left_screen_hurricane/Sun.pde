class Sun {
  float mass;
  PVector location;
  float G;

  Sun(float x, float y) {
    location = new PVector(x, y);
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
    strokeWeight(5);
    fill(255);
    pushMatrix();
    translate(location.x, location.y);
    //sphere(mass);
    ellipse(0,0,mass*0.5,mass*0.5);
    popMatrix();
  }
}