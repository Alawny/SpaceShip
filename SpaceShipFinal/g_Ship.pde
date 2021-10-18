class Ship extends GameObject {
//SHIP CLASS==========================================================================================================================================================================================
  
  //INSTANCE VARIBALES
  PVector dir;           //DIRECTION
  int shotTimer;         //BULLET COOLDOWN TIMER
  int threshold;         //BULLET COOLDOWN THRESHOLD
  int dmgTimer;          //DAMAGE COOLDOWN TIMER
  int dmgThreshold;      //DAMAGE COOLDOWN THRESHOLD
  int clr;               //COLOUR (USED FOR FLASHING)
  int dmgFlash;          //FLASHING TIMER
  int TPTime;            //TELEPORTATION COOLDOWN           
  boolean safe;          //SAFETY CHECK



  //CONTRUCTOR
  Ship() {
    lives         = 3;
    TPTime        = 0;
    loc           = new PVector(width/2, height/2);
    vel           = new PVector(0, 0);
    dir           = new PVector(0, -0.1);
    shotTimer     = 0;
    threshold     = 50;
    size          = 50;
    dmgTimer      = 0;
    dmgThreshold  = 500;
    clr           = 255;
    safe          = true;
  }

//SHIP BEHAVIOUR FUNCTIONS=============================================================================================================================================================================
  void show() {
    
    //SHIP SHOWING
    pushMatrix();
    rectMode(CENTER);
    translate(loc.x, loc.y);
    rotate(dir.heading());
    noFill();
    strokeWeight(10);
    stroke(255, clr, clr);
    triangle(-20, 15, -20, -15, 25, 0);
    rect(-20, 0, 20, 7.5);
    popMatrix();
   


    //FLASHING ANIMATION
    dmgTimer++;

      if (dmgTimer < dmgThreshold)                   {
      if (dmgTimer < 50)                    clr = 0;
      if (dmgTimer > 50  && dmgFlash < 100) clr = 255;
      if (dmgTimer > 100 && dmgFlash < 150) clr =   0;
      if (dmgTimer > 150 && dmgFlash < 200) clr = 255;
      if (dmgTimer > 200 && dmgFlash < 250) clr =   0;
      if (dmgTimer > 250 && dmgFlash < 300) clr = 255;
      if (dmgTimer > 300 && dmgFlash < 350) clr =   0;
      if (dmgTimer > 350 && dmgFlash < 400) clr = 255;
      if (dmgTimer > 400 && dmgFlash < 450) clr =   0;
      if (dmgTimer > 450 && dmgFlash < 500) clr = 255;
    } else                                           {
      clr = 255;
    }
  }

  void act() {
    
    //SUPERCLASS ACT FUNCTION
    super.act();


    //TELEPORT TIMER (YES THERE IS 2)
    TPTime++;
    TPTime++;
    
    //TELEPORT PARTICLE SPAWN + ACTUAL TELEPORT + MAKE YOU TEMP INVINCIBLE
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);

      if (TPTime >= 2000) {
        if (rkey == true) {
          myObjects.add(new Particle(loc.x, loc.y, 255, 0, 0));
          myObjects.add(new Particle(loc.x, loc.y, 255, 0, 0));
          myObjects.add(new Particle(loc.x, loc.y, 255, 0, 0));
          myObjects.add(new Particle(loc.x, loc.y, 255, 0, 0));
          myObjects.add(new Particle(loc.x, loc.y, 255, 0, 0));
          myObjects.add(new Particle(loc.x, loc.y, 255, 0, 0));
          myObjects.add(new Particle(loc.x, loc.y, 255, 0, 0));
          myObjects.add(new Particle(loc.x, loc.y, 255, 0, 0));
          myObjects.add(new Particle(loc.x, loc.y, 255, 0, 0));
         
        }
      }

      if (TPTime >= 2000) {
        if (rkey == true || safe == false) {

          loc.x = (random(0, width));
          loc.y = (random(0, height));
          if (myObj instanceof Asteroid) {
            while (dist(loc.x, loc.y, myObj.loc.x, myObj.loc.y) <= size/2 + myObj.size + 300) {
              safe = false;
            }
          }
          safe = true;
          TPTime = 0;
          myObjects.add(new Particle(loc.x, loc.y, 255, 0, 0));
          myObjects.add(new Particle(loc.x, loc.y, 255, 0, 0));
          myObjects.add(new Particle(loc.x, loc.y, 255, 0, 0));
          myObjects.add(new Particle(loc.x, loc.y, 255, 0, 0));
          myObjects.add(new Particle(loc.x, loc.y, 255, 0, 0));
          myObjects.add(new Particle(loc.x, loc.y, 255, 0, 0));
          myObjects.add(new Particle(loc.x, loc.y, 255, 0, 0));
          myObjects.add(new Particle(loc.x, loc.y, 255, 0, 0));
      
          dmgTimer = 0;
        }
      }
      i++;
    }

   
    //SHOT COOLDOWN TIMER
    shotTimer++;

    //SPEED LIMITER
    if (vel.mag() > 3)
      vel.setMag(3);

    //CONTROLS + FIRECLASS WITH MOVING FORWARDS + BULLETS
    if (upkey) {  
      vel.add(dir);
      myObjects.add(new Fire());
    }

    if (downkey)  vel.sub(dir);
    if (leftkey)  dir.rotate(radians(-3));
    if (rightkey) dir.rotate(radians(3));
    if (spacekey && shotTimer >= threshold) {
      myObjects.add( new Bullet());
      shotTimer = 0;
    }
    
    //SPEED REDUCER WHEN NOT MOVING
    if (upkey == false) vel.setMag(vel.mag()*0.99);
  }
}
