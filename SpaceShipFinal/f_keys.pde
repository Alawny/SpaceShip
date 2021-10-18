//MOUSE AND KEYBOARD CONTROL==========================================================================================================================================================================

  //BOOLEAN VARIABLES
  boolean upkey, downkey, leftkey, rightkey, spacekey, rkey, pkey;

void keyPressed() {
  if (keyCode == UP)                       upkey    = true;
  if (keyCode == DOWN)                     downkey  = true;
  if (keyCode == LEFT)                     leftkey  = true;
  if (keyCode == RIGHT)                    rightkey = true;
  if (keyCode == ' ')                      spacekey = true;
  if (keyCode == 'r' || keyCode == 'R')    rkey     = true;
  if (keyCode == 'p' || keyCode == 'P')    pkey     = true;
}

void keyReleased() {
  if (keyCode == UP)                       upkey    = false;
  if (keyCode == DOWN)                     downkey  = false;
  if (keyCode == LEFT)                     leftkey  = false;
  if (keyCode == RIGHT)                    rightkey = false;
  if (keyCode == ' ')                      spacekey = false;
  if (keyCode == 'r' || keyCode == 'R')    rkey     = false;
  if (keyCode == 'p' || keyCode == 'P')    pkey     = false;
}

void mouseReleased () {


    if      (mode == INTRO)     {
    introClick();
  } else if (mode == GAME)      {
    gameClick();
  } else if (mode == PAUSE)     {
    pauseClick();
  } else if (mode == GAMEOVERW) {
    gameoverwClick();
  } else if (mode == GAMEOVERL) {
    gameoverlClick();
  }
}
