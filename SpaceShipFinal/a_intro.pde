void intro () {

//LOAD INTRO GIF======================================================================================================================================================================================
  image (gif[frame], 0, 0, width, height);
  frame++;
  if (frame == nFrames) frame = 0;

//INTRO ANIMATIONS====================================================================================================================================================================================

  //SETUP WORK
  iTimer++;
  frameRate (45);

  //MAIN TITLE
  if (iTimer >= 25) {
    iTitle++;
    textSize  (150);
    fill      (255, iTitle * 10);
    textFont  (chopsic);
    text      ("ASTEROIDS", width/2, height/2 - 150);
  }

  //TEXT BOX ANIMATION AND OTHERS
  if (iTitle >= 255)   iTitle    = 255;
  if (iTimer >= 70)    iBoxTrans = 255;
  if (iTimer >= 74)    iBoxTrans = 0;
  if (iTimer >= 78)    iBoxTrans = 255;
  if (iTimer >= 82)    iBoxTrans = 0;
  if (iTimer >= 86)    iBoxTrans = 255;

  if (iTimer >= 70) {
    if (iTimer >= 92) {

      iBoxSize = iBoxSize + 1 * 50;
    }
    fill         (iBoxColor, iBoxTrans);
    stroke       (lpurple, iBoxTrans);
    strokeWeight (20);
    rect         (width/2, height/2 + 100, iBoxSize, 150, 10);
  }
  if (iTimer >= 105) {
    fill (255);
    if   (iText == 0) {
      textSize(90);
      text("START", width/2, height/2 + 90);
    } else if (iText == 1) {
      textSize(80);
      text("READY?", width/2 + 5, height/2 + 90);
    }
  }

  if (iBoxSize >= 400) iBoxSize = 400;

  if (mouseX >= 265 && mouseX <= 735 && mouseY >= 515 && mouseY <= 685) {
    iText     = 1;
    iBoxColor = blue;
  } else {
    iText     = 0;
    iBoxColor = purple;
  }
}

//INTRO CLICKING======================================================================================================================================================================================
void introClick () {

  //START BUTTON + SPAWN ASTEROIDS + SETUP SHIP LOCATION + RESTART INTRO VARIABLES
  if (iTimer >= 105) {
    if (mouseX >= 265 && mouseX <= 735 && mouseY >= 515 && mouseY <= 685) {

      //INTRO VARIABLE RESET
      iTimer   = 0;
      iTitle   = 0;
      iBoxSize = 0;

      //SHIP LOCATION RESET
      myShip.loc.x = width/2;
      myShip.loc.y = height/2;

      //ASTEROID SPAWNING
      myObjects.add(new Asteroid());
      myObjects.add(new Asteroid());
      myObjects.add(new Asteroid());
      myObjects.add(new Asteroid());
      myObjects.add(new Asteroid());
      myObjects.add(new Asteroid());

      //MODE CHANGE
      mode = GAME;
    }
  }
}
