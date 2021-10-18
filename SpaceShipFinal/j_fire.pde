class Fire extends GameObject {
//FIRE CLASS==========================================================================================================================================================================================

  //INSTANCE VARIABLES
  int t;         //TRANSPARENCY AND LIFE SPAN VARIABLE
  PVector nudge; //SHIFT FIRE SPAWN LOCATION

  //CONTRUCTOR
  Fire() {
    lives     = 1;
    size      = int(random(5, 17));
    t         = int(random(150, 255));
    loc       = myShip.loc.copy();
    nudge     = vel = myShip.dir.copy();
    nudge.rotate(PI);
    nudge.setMag(35);
    loc.add(nudge);
    vel       = myShip.dir.copy();
    vel.rotate(PI + (random(-0.5, 0.5))); 
    vel.setMag(5);
  }

  //SHOW FIRE
  void show() {
    noStroke();
    fill(255, 0, 0, t);
    circle(loc.x, loc.y, size);
  }

  //FIRE LIFE SPAN AND TRANSPARENCY + SUPERCLASS ACT
  void act() {
    super.act();
    t = t - 15;
    if (t <= 0) lives = 0;
  }
}
