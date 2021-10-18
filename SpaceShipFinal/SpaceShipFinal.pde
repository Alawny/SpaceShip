//====================================================================================================================================================================================================
/*
 Alan Lu
 some time in Oct 2021
 
 GAME DETAILS:
 Hello player, welcome to the Asteroid Game.
 In this game, you will be controlling a flying mouse cursor looking space ship thingy and be shooting down random circles that are supposed be asteroids but they dont actually look like them.
 Anyways... beware, there will be blue cheese pizza looking things flying around sometimes and they will attempt to kill you with blue bullets.
 
 WIN CONDITION:
 kill all the asteroids without dying first
 
 LOSE CONDITION:
 lose all 3 lives
 
 CONTROLS:
 uparrow:     move foward
 downarrow:   move backwards
 leftarrow:   aim left
 rightarrow:  aim right
 spacebar:    fire
 R:           teleport (cooldown bottom right)
 P:           pause
 
 PS: the reseting varibles code is scattered all around, but it gets the job done
 
 Anyways have fun
 */
//====================================================================================================================================================================================================



//ARRAYS==============================================================================================================================================================================================

//SHIP
Ship myShip;


//GAME OBJECTS
ArrayList<GameObject> myObjects;

//COLOURS=============================================================================================================================================================================================

color purple  = #31078E;
color lpurple = #DAC9FF;
color blue    = #31A7FF;
color red     = #FF0000;  

//MODE FRAMEWORK VARIABLES============================================================================================================================================================================

//MODES
int mode;
final int INTRO     = 0;
final int GAME      = 1;
final int PAUSE     = 2;
final int GAMEOVERW = 3;
final int GAMEOVERL = 4;

//GIFS================================================================================================================================================================================================

//INTRO GIF
PImage[] gif;    //frame array
int nFrames;     //number of frames
int frame;       //frame number

//GAME GIF
PImage[] gifG;   //frame array
int nFramesG;    //number of frames
int frameG;      //frame number

//VARIABLES===========================================================================================================================================================================================

//INTRO
int iTimer;      //intro timer
int iTitle;      //intro title
int iText;       //intro text
int iBoxSize;    //intro box size
int iBoxTrans;   //intro box transparency
int iBoxColor;   //intro box colour

//GAME
int UFOTime;     //UFO spawn timer

//GAMEOVER LOSE
int glRed;       //gameover lose red flash
int glTimer;     //gameover lose timer
int glTitle;     //gameover lose title
int glText;      //gameover lose text
int glBoxSize;   //gameover lose box size
int glBoxTrans;  //gameover lose box transparency
int glBoxColor;  //gameover lose box colour

//GAMEOVER WIN
int gwTimer;     //gameover win timer
int gwTitle;     //gameover win title
int gwText;      //gameover win text
int gwBoxSize;   //gameover win box size
int gwBoxTrans;  //gameover win box transparency
int gwBoxColor;  //gameover win box colour

//PAUSE
int pBoxColorb;  //pause box colour bottom
int pBoxTextb;   //pause box text bottom
int pBoxColort;  //pause box colour top
int pBoxTextt;   //pause box text top

//WIN REQIREMENTS
int win;         //win counter (counts how many asteroids have been destroyed)
int wincount;    //win counter (timer that helps with the white screen)

//UTILITIES===========================================================================================================================================================================================  
PFont chopsic;   //font
PImage shipLife; //ship HP image
PImage watch0;   //stopwatch 0% image
PImage watch25;  //stopwatch 25% image
PImage watch50;  //stopwatch 50% image
PImage watch75;  //stopwatch 75% image
PImage watch100; //stopwatch 100% image
PImage gImg;     //image for gameover win and lose

//SETUP===============================================================================================================================================================================================
void setup () {

  //GLOBAL RULES
  size                 (1000, 1000, FX2D);
  frameRate            (45);
  mode =               INTRO;
  textAlign            (CENTER, CENTER);
  rectMode             (CENTER);
  chopsic = createFont ("Chopsic.ttf", 125);

//VARIABLES SETUP=====================================================================================================================================================================================

  //INTRO 
  iBoxTrans  = 0;
  iBoxSize   = 0;
  iText      = 0;

  //GAMEOVER LOSE
  glRed      = 0;
  glBoxTrans = 0;
  glBoxSize  = 0;
  glText     = 0;

  //PAUSE  
  pBoxTextt  = 0;
  pBoxTextb  = 0;

  //GAMEOVER WIN  
  wincount   = 0;

  //GAME  
  UFOTime    = 0;

//ARRAY SETUP=========================================================================================================================================================================================

  //INTRO (SHIP AND GAMEOBJECT) SETUP
  myShip    = new Ship(); 
  myObjects = new ArrayList<GameObject>();
  myObjects.add(myShip);

  //INTRO GIF SETUP 
  nFrames = 10;
  gif     = new PImage[nFrames];

  int img = 0;
  while (img < nFrames) {
    gif[img] = loadImage("frame_0"+img+"_delay-1s.gif");
    img++;
  }

  //GAME GIF SETUP
  nFramesG = 16;
  gifG = new PImage[nFramesG];

  int img2 = 0;
  while (img2 < nFramesG) {
    gifG[img2] = loadImage("frame_"+img2+"_delay-0.1s.gif");
    img2++;
  }

//UTILITIES SETUP======================================================================================================================================================================================

  //IMAGES
  gImg     = loadImage ("gameover_lose_img.gif");
  shipLife = loadImage ("shiplife.png");
  watch0   = loadImage ("watch0.png");
  watch25  = loadImage ("watch25.png");
  watch50  = loadImage ("watch50.png");
  watch75  = loadImage ("watch75.png");
  watch100 = loadImage ("watch100.png");
}

//MODE SWAPPING========================================================================================================================================================================================-
void draw () {

    if      (mode == INTRO)     {
    intro();
  } else if (mode == GAME)      {
    game();
  } else if (mode == PAUSE)     {
    pause();
  } else if (mode == GAMEOVERW) {
    gameoverw();
  } else if (mode == GAMEOVERL) {
    gameoverl();
  } else                        {
    println("ERROR MODE=" + mode);
  }
}
