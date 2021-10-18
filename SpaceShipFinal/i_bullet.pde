class Bullet extends GameObject {
//BULLET CLASS========================================================================================================================================================================================

  //INSTANCE VARIABLES
  int timer; //BULLET LIFE SPAN
  
  //CONTRUCTOR
  Bullet() {
    timer  = 45;
    lives  = 1;
    loc    = myShip.loc.copy();  
    vel    = myShip.dir.copy();  
    vel.setMag(15); 
    vel.add(myShip.vel);
    size   = 10;
  }

  //SHOW BULLET
  void show () {
    pushMatrix();
    stroke(255, 0, 0);
    fill(255, 0, 0);
    ellipse(loc.x, loc.y, size, size);
    popMatrix();
  } 


  //BULLET LIFE SPAN + SUPERCLASS ACT
  void act () {
    super.act();

    timer--;
    if (timer <= 0) {
      lives = 0;
    }
  }
}
