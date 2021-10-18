class UFO extends GameObject{
//UFO CLASS===========================================================================================================================================================================================

  //INSTSANCE VARIABLES
  int ranUFO;      //DETERMINES UFO SPAWN LOCATION
  int bulletTime;  //TIMER FOR WHEN A UFO FIRES
  float UFOdir;    //UFO FLYING DIRECTION RANDOMIZER
  float vx, vy;    //CALCULATION VALUES FOR UFO AIM


  //CONTRUCTOR
  UFO() {
    lives = 1;
    size = 65;
    bulletTime = 0;
    UFOdir = random(-1, 1);
    ranUFO = int(random(0, 4));
    if (ranUFO == 0) {
      loc = new PVector (random(250, width - 250), -100);
      vel = new PVector (UFOdir, 1);
      vel.setMag(2);
    }
    if (ranUFO == 1) {
      loc = new PVector (-100, random(250, height - 250));
      vel = new PVector (1, UFOdir);
      vel.setMag(2);
    }
    if (ranUFO == 2) {
      loc = new PVector (1100, random(250, height - 250));
      vel = new PVector (-1, UFOdir);
      vel.setMag(2);
    }
    if (ranUFO == 3) {
      loc = new PVector (random(250, width - 250), 1000);
      vel = new PVector (UFOdir, -1);
      vel.setMag(2);
    }
  }


//UFO BEHAVIOURAL FUNCTIONS===========================================================================================================================================================================

  //SHOW UFO AND CALCULATE VX AND VY
  void show() {
    pushMatrix();
    stroke(180, 180, 255);
    fill(0, 0, 255);
    circle(loc.x, loc.y, size);
    popMatrix();
    vx = myShip.loc.x - loc.x;
    vy = myShip.loc.y - loc.y;
  }

  void act() {
    
    //MOVEMENT AS SUPERCLASS WONT BE USED
    loc.add(vel);
    
    //KILL UFO OFF MAP
    if (loc.x >= 1120 || loc.x <= -120 || loc.y >= 1020 || loc.y <= -120) {
      lives = 0;
    }
    
    //DAMAGE SHIP IF CLOSE TO UFO + PARTICLES
    if (myShip.dmgTimer >= myShip.dmgThreshold) {
      if (dist(loc.x, loc.y, myShip.loc.x, myShip.loc.y) <= size/2 + myShip.size/2) {
        myShip.lives = myShip.lives - 1;
        myShip.dmgTimer = 0;
        myObjects.add(new Particle(myShip.loc.x, myShip.loc.y, 255, 0, 0));
        myObjects.add(new Particle(myShip.loc.x, myShip.loc.y, 255, 0, 0));
        myObjects.add(new Particle(myShip.loc.x, myShip.loc.y, 255, 0, 0));
        myObjects.add(new Particle(myShip.loc.x, myShip.loc.y, 255, 0, 0));
        myObjects.add(new Particle(myShip.loc.x, myShip.loc.y, 255, 0, 0));
        myObjects.add(new Particle(myShip.loc.x, myShip.loc.y, 255, 0, 0));
        myObjects.add(new Particle(myShip.loc.x, myShip.loc.y, 255, 0, 0));
        myObjects.add(new Particle(myShip.loc.x, myShip.loc.y, 255, 0, 0));
        myObjects.add(new Particle(myShip.loc.x, myShip.loc.y, 255, 0, 0));
        myObjects.add(new Particle(myShip.loc.x, myShip.loc.y, 255, 0, 0));
      }
    }
    
    //SPAWN UFOBULLET ON A TIMER
    bulletTime++;
    if (bulletTime >= 100) {
      myObjects.add(new UFOBullet(loc.x, loc.y, vx, vy));
      bulletTime = 0;
    }
    
    //KILL UFO IF BULLET TOUCHES UFO + SPAWN PARTICLES + MAKE SHIP INVINCIBLE
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(loc.x, loc.y, myObj.loc.x, myObj.loc.y) <= size/2 + myObj.size/2) { 
          myObj.lives = 0;
          lives = 0;
          myObjects.add(new Particle(loc.x, loc.y, 0, 0, 255));
          myObjects.add(new Particle(loc.x, loc.y, 0, 0, 255));
          myObjects.add(new Particle(loc.x, loc.y, 0, 0, 255));
          myObjects.add(new Particle(loc.x, loc.y, 0, 0, 255));
          myObjects.add(new Particle(loc.x, loc.y, 0, 0, 255));
          myObjects.add(new Particle(loc.x, loc.y, 0, 0, 255));
          myObjects.add(new Particle(loc.x, loc.y, 0, 0, 255));
          myObjects.add(new Particle(loc.x, loc.y, 0, 0, 255));
          myObjects.add(new Particle(loc.x, loc.y, 0, 0, 255));
          myObjects.add(new Particle(loc.x, loc.y, 0, 0, 255));
        }
      }
      i++;
    }
  }
}
