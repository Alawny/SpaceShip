void gameoverw () {
//GAMEOVER WIN=======================================================================================================================================================================================

  //BACKGROUND IMAGE
  image (gImg, 0, 0, width, height);
  
//GAMEOVER WIN ANIMATIONS============================================================================================================================================================================

  //SETUP
  gwTimer++;
  rectMode  (CENTER);
  frameRate (45);
  
  //TITLE
  if (gwTimer >= 25) {
    gwTitle++;
    textSize(125);
    fill(255, gwTitle * 10);
    textFont(chopsic);
    text("VICTORY", width/2, height/2 - 150);
  }

  //TEXT BOX ANIMATION AND OTHERS
  if (gwTitle >= 255)   gwTitle    = 255;
  if (gwTimer >= 70)    gwBoxTrans = 255;
  if (gwTimer >= 74)    gwBoxTrans = 0;
  if (gwTimer >= 78)    gwBoxTrans = 255;
  if (gwTimer >= 82)    gwBoxTrans = 0;
  if (gwTimer >= 86)    gwBoxTrans = 255;

  if (gwTimer >= 70) {
    if (gwTimer >= 92) {

      gwBoxSize = gwBoxSize + 1 * 50;
    }
    
    fill(gwBoxColor, gwBoxTrans);
    stroke(lpurple, gwBoxTrans);
    strokeWeight(20);
    rect (width/2, height/2 + 100, gwBoxSize, 150, 10);
    
  }
  if (gwTimer >= 105) {
    fill(255);
    if (gwText == 0) {
      textSize(110);
      text("MENU", width/2, height/2 + 90);
    } else if (gwText == 1) {
      textSize(80);
      text("READY?", width/2 + 5, height/2 + 90);
    }
  }

  if (gwBoxSize >= 400) gwBoxSize = 400;

  if (mouseX >= 265 && mouseX <= 735 && mouseY >= 515 && mouseY <= 685) {
    gwText     = 1;
    gwBoxColor = blue;
  } else {
    gwText     = 0;
    gwBoxColor = purple;
  }
}

//GAMEOVER WIN CLICKING===============================================================================================================================================================================
void gameoverwClick () {
  
  //MENU BUTTON (INTRO) + RESET GAMEOVER WIN VARIABLES + WIN VARIABLES + UFO SPAWN TIMER
  if (gwTimer >= 105) {
    if (mouseX >= 265 && mouseX <= 735 && mouseY >= 515 && mouseY <= 685) {
      gwTimer    = 0;
      gwTitle    = 0;
      gwBoxSize  = 0;
      wincount   = 0;
      win        = 0;
      UFOTime    = 0;
      mode       = INTRO;
    }
  }
}
