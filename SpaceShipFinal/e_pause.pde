void pause() {
//PAUSE SCREEN=========================================================================================================================================================================================

  //PURPLE BACKGROUND EFFECT
  fill (purple, 10);
  rect (width/2, height/2, width, height);

  //TOP BOX
  fill (pBoxColorb);
  rect (width/2, height/2 + 100, 400, 150, 10);

  //BOTTOM BOX
  fill (pBoxColort);
  rect (width/2, height/2 - 200, 400, 150, 10);

  //MOUSE CHANGE TEXT AND COLOUR
  if (mouseX >= 295 && mouseX <= 705 && mouseY >= 520 && mouseY <= 680) {
    pBoxColorb = blue;
    pBoxTextb  = 1;
  } else {
    pBoxColorb = purple;
    pBoxTextb  = 0;
  }
  if (mouseX >= 295 && mouseX <= 705 && mouseY >= 220 && mouseY <= 380) {
    pBoxColort = blue;
    pBoxTextt  = 1;
  } else {
    pBoxColort = purple;
    pBoxTextt  = 0;
  }

  if (pBoxTextt == 0) {
    textSize(72);
    fill(255);
    text("RESUME", width/2, height/2 - 200);
  } else if (pBoxTextt == 1) {
    textSize(72);
    fill(255);
    text("READY?", width/2 + 10, height/2 - 200);
  }

  if (pBoxTextb == 0) {
    textSize(100);
    fill(255);
    text("MENU", width/2, height/2 + 95);
  } else if (pBoxTextb == 1) {
    textSize(55);
    fill(255);
    text("YOU SURE?", width/2 + 5, height/2 + 100);
  }
}

//PAUSE CLICKING======================================================================================================================================================================================
void pauseClick () {

  //RETURN TO MENU (INTRO) + RESET ALL GAME VARIABLES
  if (mouseX >= 295 && mouseX <= 705 && mouseY >= 520 && mouseY <= 680) {
    mode = INTRO;
    myShip.dmgTimer = 0;
    int e = 0;
    while (e < myObjects.size()) {
      GameObject myObj = myObjects.get(e);
      myObj.lives = 0;
      e++;
    }
    myShip.lives   = 3; 
    myShip.vel     = new PVector(0, 0);
    myShip.dir     = new PVector(0, -0.1);
    myShip.TPTime  = 0;
    wincount       = 0;
    win            = 0;
    UFOTime        = 0;
  }
  
  //RETURN TO GAME
  if (mouseX >= 295 && mouseX <= 705 && mouseY >= 220 && mouseY <= 380) {
    mode = GAME;
  }
}
