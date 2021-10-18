class Asteroid extends GameObject {
//ASTEROID CLASS======================================================================================================================================================================================

  //CONTRUCTOR
  Asteroid() {
    lives = 1;
    loc = new PVector (random(0, width), random(0, height));
    vel = new PVector(0, 1);
    vel.rotate(random(0, TWO_PI));
    size = 100;
  }

  //CONTRUCTOR FOR SPLIT ASTEROIDS
  Asteroid(int s, float x, float y) {
    lives = 1;
    loc = new PVector (x, y);
    vel = new PVector(0, 2);
    vel.rotate(random(0, TWO_PI));
    size = s;
  }

//ASTEROID BEHAVIOURAL FUNCTIONS======================================================================================================================================================================

  //SHOW ASTEROID
  void show() {
    noFill();
    stroke(lpurple);
    ellipse(loc.x, loc.y, size, size);
  }

  void act() {
    
    //SUPERCLASS ACT
    super.act();

    //SPLIT ASTEROIDS IF HIT BY BULLET + ADD WIN COUNTER REQUIREMENTS + PARTICLES
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {
        if (dist(loc.x, loc.y, myObj.loc.x, myObj.loc.y) <= size/2 + myObj.size/2) { 
          myObj.lives = 0;
          lives = 0;
          win = win + 1;
          if (size >= 70) {
            myObjects.add(new Asteroid(size/2, loc.x, loc.y));
            myObjects.add(new Asteroid(size/2, loc.x, loc.y));
            myObjects.add(new Asteroid(size/2, loc.x, loc.y));
          
          }
          myObjects.add(new Particle(loc.x, loc.y, 218, 201, 255));
          myObjects.add(new Particle(loc.x, loc.y, 218, 201, 255));
          myObjects.add(new Particle(loc.x, loc.y, 218, 201, 255));
          myObjects.add(new Particle(loc.x, loc.y, 218, 201, 255));
          myObjects.add(new Particle(loc.x, loc.y, 218, 201, 255));
          myObjects.add(new Particle(loc.x, loc.y, 218, 201, 255));
          myObjects.add(new Particle(loc.x, loc.y, 218, 201, 255));
          myObjects.add(new Particle(loc.x, loc.y, 218, 201, 255));
          myObjects.add(new Particle(loc.x, loc.y, 218, 201, 255));
          myObjects.add(new Particle(loc.x, loc.y, 218, 201, 255));
          myObjects.add(new Particle(loc.x, loc.y, 218, 201, 255));
          myObjects.add(new Particle(loc.x, loc.y, 218, 201, 255));
        }
      }
      i++;
    }
    
    //DAMAGE SHIP IF HIT BY ASTEROID + SPAWN PARTICLES
    if (myShip.dmgTimer >= myShip.dmgThreshold) {
      if (dist(loc.x, loc.y, myShip.loc.x, myShip.loc.y) <= size/2 + myShip.size/2) {
        myShip.lives = myShip.lives - 1;
        myShip.dmgTimer = 0;
        myObjects.add(new Particle(myShip.loc.x, myShip.loc.y, 255, 0, 0));
        myObjects.add(new Particle(myShip.loc.x, myShip.loc.y, 255, 0, 0));
        myObjects.add(new Particle(myShip.loc.x, myShip.loc.y, 255, 0, 0));
        myObjects.add(new Particle(myShip.loc.x, myShip.loc.y, 255, 0, 0));
        myObjects.add(new Particle(myShip.loc.x, myShip.loc.y, 255, 0, 0));
        
      }
    }
  }
}
