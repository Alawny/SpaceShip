void gameoverl () {
//GAMEOVER LOSE=======================================================================================================================================================================================
  //COOL RED FLASH
  pushMatrix();
  fill(red);
  rect(width/2, height/2, width, height);
  popMatrix();
  glRed++;
  image(gImg, 0, 0, width, height);
  tint(255, glRed * 7);
  rectMode(CENTER);
  
//GAMEOVER LOSE ANIMATIONS============================================================================================================================================================================
  //SETUP
  frameRate(45);
  glTimer++;
  
  //TITLE
  if (glTimer >= 25) {
    glTitle++;
    textSize(125);
    fill(255, glTitle * 10);
    textFont(chopsic);
    text("GAMEOVER", width/2, height/2 - 150);
  }

  //TEXT BOX ANIMATION AND OTHERS
  if (glTitle >= 255)    glTitle    = 255;
  if (glTimer >= 70)     glBoxTrans = 255;
  if (glTimer >= 74)     glBoxTrans = 0;
  if (glTimer >= 78)     glBoxTrans = 255;
  if (glTimer >= 82)     glBoxTrans = 0;
  if (glTimer >= 86)     glBoxTrans = 255;

  if (glTimer >= 70) {
    if (glTimer >= 92) {

      glBoxSize = glBoxSize + 1 * 50;
    }
    
    fill(glBoxColor, glBoxTrans);
    stroke(lpurple, glBoxTrans);
    strokeWeight(20);
    rect (width/2, height/2 + 100, glBoxSize, 150, 10);
    
  }
  if (glTimer >= 105) {
    fill(255);
    if (glText == 0) {
      textSize(110);
      text("MENU", width/2, height/2 + 90);
    } else if (glText == 1) {
      textSize(80);
      text("READY?", width/2 + 5, height/2 + 90);
    }
  }

  if (glBoxSize >= 400) glBoxSize = 400;

  if (mouseX >= 265 && mouseX <= 735 && mouseY >= 515 && mouseY <= 685) {
    glText = 1;
    glBoxColor = blue;
  } else {
    glText = 0;
    glBoxColor = purple;
  }
}

//====================================================================================================================================================================================================
void gameoverlClick () {
  
  //MENU BUTTON (INTRO) + GAMEOVER LOSE VARIABLES RESET + RESET WIN VARIABLES + UFO SPAWN TIMER
  if (glTimer >= 105) {
    if (mouseX >= 265 && mouseX <= 735 && mouseY >= 515 && mouseY <= 685) {
      glTimer    = 0;
      glTitle    = 0;
      glBoxSize  = 0;
      glRed      = 0;
      wincount   = 0;
      win        = 0;
      UFOTime    = 0;
      mode       = INTRO; 
      
    }
  }
}
  
  
  
  
  
  
