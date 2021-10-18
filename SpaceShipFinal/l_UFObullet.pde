class UFOBullet extends GameObject {
//UFOBULLET CLASS=====================================================================================================================================================================================

  //INSTANCE VARIABLES
  int UFOBTimer;  //UFO BULLET LIFE SPAN TIMER

  //CONTRUCTOR
  UFOBullet (float x, float y, float vx, float vy) {
    UFOBTimer = 120;
    lives = 1;
    loc = new PVector (x, y);
    vel = new PVector (vx, vy);
    vel.setMag(10);
    size = 10;
  }


//UFO BULLET BEHAVIOUR FUNCTIONS======================================================================================================================================================================

  //SHOW UFO BULLET
  void show () {
    pushMatrix();
    stroke(0, 0, 255);
    fill(0, 0, 255);
    ellipse(loc.x, loc.y, size, size);
    popMatrix();
  } 

  void act () {
    
    //SUPERCLASS ACT
    super.act();

    //UFO BULLET LIFE SPAN
    UFOBTimer--;
    if (UFOBTimer <= 0) {
      lives = 0;
      UFOBTimer = 0;
    }
    
    //DAMAGE SHIP IF TOUCHING UFO BULLET + KILL BULLET + MAKE SHIP INVINCIBLE + SPAWN PARTICLES
    if (myShip.dmgTimer >= myShip.dmgThreshold) {
      if (dist(loc.x, loc.y, myShip.loc.x, myShip.loc.y) <= size/2 + myShip.size/2) {
        myShip.lives = myShip.lives - 1;
        myShip.dmgTimer = 0;
        lives = 0;
        myObjects.add(new Particle(loc.x, loc.y, 0, 0, 255));
        myObjects.add(new Particle(loc.x, loc.y, 0, 0, 255));
        myObjects.add(new Particle(loc.x, loc.y, 0, 0, 255));
        myObjects.add(new Particle(myShip.loc.x, myShip.loc.y, 255, 0, 0));
        myObjects.add(new Particle(myShip.loc.x, myShip.loc.y, 255, 0, 0));
        myObjects.add(new Particle(myShip.loc.x, myShip.loc.y, 255, 0, 0));
        myObjects.add(new Particle(myShip.loc.x, myShip.loc.y, 255, 0, 0));
        myObjects.add(new Particle(myShip.loc.x, myShip.loc.y, 255, 0, 0));
      }
    }
  }
}
