void game () {

//LOAD GAME GIF=======================================================================================================================================================================================
  image (gifG[frameG], 0, 0, width, height);
  frameG++;
  if    (frameG == nFramesG) frameG = 0;

//GAME================================================================================================================================================================================================
  
  //SETUP
  frameRate(60);

  //SHIP FUNCTIONS
  myShip.show();
  myShip.act();


  //SPAWN UFO
  UFOTime++;
  if (UFOTime >= 1000) {
    myObjects.add (new UFO());
    UFOTime = int (random(0, 201));
  }

  //SPAWN MYOBJECT (BULLETS, ASTEROIDS, UFOBULLETS, FIRE, PARTICLES UFO)
  int i = 0;
  while (i < myObjects.size()) {
    GameObject myObj = myObjects.get(i);
    myObj.show();
    myObj.act();
  
  //REMOVE MYOBJECT (BULLETS, ASTEROIDS, UFOBULLETS, FIRE, PARTICLES UFO)
    if (myObj.lives == 0 ) {
      myObjects.remove(i);
    } else                 {
      i++;
    }
  }

//GAME UI=============================================================================================================================================================================================

  //MAIN BAR
  stroke   (lpurple);
  fill     (purple);
  rectMode (CENTER);
  rect     (500, 925, 990, 100);
  line     (350, 880, 350, 975);
  line     (883, 880, 883, 975);
  fill     (255);

  //SHIP LIVES INDICATOR
  if (myShip.lives >= 1) image(shipLife, 25, 890, 100, 100);
  if (myShip.lives >= 2) image(shipLife, 125, 890, 100, 100);
  if (myShip.lives >= 3) image(shipLife, 225, 890, 100, 100);
  

  //SHIP TELEPORT TIMER INDICATOR
  if (myShip.TPTime < 500)   image(watch0, 890, 880, 100, 100);
  if (myShip.TPTime >= 500)  image(watch25, 890, 880, 100, 100);
  if (myShip.TPTime >= 1000) image(watch50, 890, 880, 100, 100);
  if (myShip.TPTime >= 1500) image(watch75, 890, 880, 100, 100);
  if (myShip.TPTime >= 2000) image(watch100, 890, 880, 100, 100);

//GAMEOVER LOSE CONDITIONS + SOME COOL ANIMATIONS (RED FLASH) + RESET GAME VALUES (DESTORY EVERYTHING, SHIP DAMAGE TIMER, SHIP LIVES, SHIP VELOCITY AND DIRECTION, SHIP TELEPORT TIMER)===============
  if (myShip.lives <= 0) {
    fill(255);
    rect(width/2, height/2, width, height);
    mode = GAMEOVERL;

    myShip.dmgTimer = 0;
    int e = 0;
    while (e < myObjects.size()) {
      GameObject myObj = myObjects.get(e);
      myObj.lives = 0;
      e++;
    }
    myShip.lives = 3; 
    myShip.vel = new PVector(0, 0);
    myShip.dir = new PVector(0, -0.1);
    myShip.TPTime = 0;
  }
  
//PAUSE KEY===========================================================================================================================================================================================

  if (pkey == true) mode = PAUSE;
  
//GAMEOVER WIN CONDITIONS + SOME COOL ANIMATIONS (WHITE LIGHT) + RESET GAME VALUES (DESTORY EVERYTHING, SHIP DAMAGE TIMER, SHIP LIVES, SHIP VELOCITY AND DIRECTION, SHIP TELEPORT TIMER)===============
  if (win >= 24) {
    wincount++;
    
    fill(255, wincount * 3);
    rect(width/2, height/2, width, height);
    if (wincount >= 200) {
    mode = GAMEOVERW;
        myShip.dmgTimer = 0;
    int e = 0;
    while (e < myObjects.size()) {
      GameObject myObj = myObjects.get(e);
      myObj.lives = 0;
      e++;
    }
    myShip.lives = 3; 
    myShip.vel = new PVector(0, 0);
    myShip.dir = new PVector(0, -0.1);
    myShip.TPTime = 0;
    }
  }
}

//USELESS STUFF
void gameClick () {
}
