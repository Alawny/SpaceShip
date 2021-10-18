class Particle extends GameObject {
//PARTICLE CLASS=====================================================================================================================================================================================

  //INSTANCE VARIABLES
  int t;     //TRANSPARENCY + LIFE SPAN CALCULATOR
  int red;   //RED CONTRUCTOR
  int green; //GREEN CONTRUCTOR
  int blue;  //BLUE CONTRUCTOR
  

  //CONTRUCTOR
  Particle(float x, float y, int r, int g, int b) {
    lives    = 1;
    size     = int(random(12, 17));
    t        = int(random(200, 500));
    loc      = new PVector (x, y);
    vel      = new PVector (0, 1);
    vel.rotate(random(0, TWO_PI)); //180 degrees or (radians(180)); random(0, TWO_PI);
    vel.setMag(5);
    red      = r;
    green    = g;
    blue     = b;
  }

  //SHOW PARTICLE
  void show() {
    noStroke();
    fill(red, green, blue, t);
    square(loc.x, loc.y, size);
  }

  //PARTICLE TRANSPARENCY AND LIFE SPAN + SUPERCLASS ACT
  void act() {
    super.act();
    t = t - 15;
    if (t <= 0) lives = 0;
  }
}
