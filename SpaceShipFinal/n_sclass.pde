class GameObject {
//SUPER CLASS============================================================================================================================================================================================

  //INSTANCE VARIBLES (USED BY ALL WHO EXTENDS GAMEOBJECT)
  int lives;
  PVector loc;
  PVector vel;
  int size;

  //USELESS STUFF
  GameObject( ) {
  }
  void show() {
  } 


  //ADD VELOCITY + BRING THINGS AROUND THE MAP, LOOPING THEM
  void act() {
    loc.add(vel);

    if (loc.y < -50)          loc.y = height - 70;
    if (loc.y > height - 70)  loc.y = -50;
    if (loc.x < -50)          loc.x = width + 50;
    if (loc.x > width + 50)   loc.x = -50;
  }
}
