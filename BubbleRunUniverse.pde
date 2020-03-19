import ddf.minim.*;
/*
 Danielle Rowe
 Final Project - Bubble Run Universe
 
 Creates the game selection screen: 5 worlds to choose from.
 Must play first world and win it to unlock second, play and win second to unlock third ... so on.
 
 How To Play:
 Click and drag to rotate the cube and collect all the coins. Do not touch the red enemies.
 NOTE: do not flip the cube, just spin horizontally.
 
 Each world is ordered by increasing difficulty, greater number of enemies in each.
 */


int score = 0;

float rotX = PI/6;
float rotY = PI/6;

//float newRotX = rotX % 6.283;
//float newRotY = rotY % 6.283;

//1
Coin c1;
Coin c2;

//2
Coin c3;
Coin c4;

//3
Coin c5;
Coin c6;

//4
Coin c7;
Coin c8;

//ENEMIES - world 1
Enemy e1;
Enemy e2;

//ENEMIES - world 2
Enemy e3;
Enemy e4;

//ENEMIES - world 3
Enemy e5;
Enemy e6;

//ENEMIES - world 4
Enemy e7;
Enemy e8;

//ENEMIES - world 5
Enemy e9;
Enemy e10;

ArrayList<Coin> coins = new ArrayList<Coin>();

//game state trackers
boolean gameStarted = false;
//boolean gameWon = false;
//boolean gameLost = false;
boolean world2Unlocked = false;
boolean world3Unlocked = false;
boolean world4Unlocked = false;
boolean world5Unlocked = false;
boolean world6Unlocked = false;

int state = 0;

//fonts
PFont font;
PFont font2;

//placement of the user's ball
TranslateVals myVals;

/*
Sets up the canvas, creates coins, and stores the coins in an ArrayList
 */
void setup() {
  size(800, 800, OPENGL);

  //String[] fontList = PFont.list();
  //printArray(fontList);

  font = createFont("Bungee Outline", 50);
  font2 = createFont("VT323", 20);

  //rotX = rotX % 6.283;
  //rotY = rotY % 6.283;

  PVector v = new PVector(100, 150, -200);
  v = v.normalize();
  println(PVector.angleBetween(v, new PVector(0.2, 3.6, 0)));

  //face 1 - front
  //coords: ?, ?, 200
  this.c1 = new Coin(new TranslateVals(-100, -10, 200));
  this.c2 = new Coin(new TranslateVals(100, -78, 200));

  //face 2 - right
  //coords: 200, ?, ?
  this.c3 = new Coin(new TranslateVals(200, 70, 140));
  this.c4 = new Coin(new TranslateVals(200, -20, 50));

  //face 3 - back
  // ? ? -200
  this.c5 = new Coin(new TranslateVals(20, 160, -200));
  this.c6 = new Coin(new TranslateVals(-100, -100, -200));

  //face 4 - left
  // -200 ? ?
  this.c7 =  new Coin(new TranslateVals(-200, 150, 20));
  this.c8 = new Coin(new TranslateVals(-200, -50, -20));

  //adding coins to ArrayList
  this.coins.add(c1);
  this.coins.add(c2);
  this.coins.add(c3);
  this.coins.add(c4);
  this.coins.add(c5);
  this.coins.add(c6);
  this.coins.add(c7);
  this.coins.add(c8);

  //enemies for world 1
  //front ?, ?, 200
  this.e1 = new Enemy(new TranslateVals(100, 20, 200)); 
  this.e5 = new Enemy(new TranslateVals(-27, -20, 200)); 
  //right 200, ?, ?
  this.e2 = new Enemy(new TranslateVals(200, 100, 50)); 
  this.e6 = new Enemy(new TranslateVals(200, 20, -150)); 
  this.e9 =  new Enemy(new TranslateVals(200, -100, 57)); 
  //back ? ? -200
  this.e3 = new Enemy(new TranslateVals(-175, -50, -200)); 
  this.e7 = new Enemy(new TranslateVals(100, 20, -200)); 
  this.e10 = new Enemy(new TranslateVals(-100, -20, -200)); 
  //left -200 ? ?
  this.e4 = new Enemy(new TranslateVals(-200, 76, 76)); 
  this.e8 = new Enemy(new TranslateVals(-200, 20, -90)); 

  this.myVals = new TranslateVals(width/2, height/2, 400);
}

/*
Draws all states of this game depending on the current state
 */
void draw() {  
  background(0);

  //game state possibilities
  switch(state) {
    //main screen state
  case 0:
    startState();
    //accounting for in-between time
    break;
    //win state
  case 1:
    win();
    break;

    //lose state
  case 2:
    lose();
    break;

    //world1 state
  case 3:
    world1();
    break;

    //world2 state
  case 4:
    world2();
    break;

    //world1 state
  case 5:
    world3();
    break;

    //world1 state
  case 6:
    world4();
    break;

    //world1 state
  case 7:
    world5();
    break;
  }
}

/////////////////////////////////////////////////////////////////////////////

//draws the enemies for world 1
public void drawEnemiesWorld1() {
  pushMatrix();
  //setup
  translate(width/2, height/2);
  rotateX(rotX);
  rotateY(rotY);
  //placing coin
  fill(#f46542);
  translate(e1.vals.getX(), e1.vals.getY(), e1.vals.getZ());
  sphere(20);
  popMatrix();

  pushMatrix();
  //setup
  translate(width/2, height/2);
  rotateX(rotX);
  rotateY(rotY);
  //placing coin
  fill(#f46542);
  translate(e2.vals.getX(), e2.vals.getY(), e2.vals.getZ());
  sphere(20);
  popMatrix();
}

//checks enemies for world 1 to see if the user has collided with them
public void checkEnemiesWorld1() {
  float newRotX = rotX % 6.283;
  float newRotY = rotY % 6.283;

  System.out.println(newRotX);
  System.out.println(newRotY);

  if (newRotX > -0.07 && newRotX < 0.23 && newRotY < -0.28 && newRotY > -0.59 ||
    newRotX > -0.07 && newRotX < 0.23 && newRotY < 5.99 && newRotY > 5.69) {
    this.state = 2;
  } else if (newRotX > 0.28 && newRotX < 0.54 && newRotY < -1.16 && newRotY > -1.50 ||
    newRotX > 0.28 && newRotX < 0.54 && newRotY < 5.12 && newRotY > 4.78) {
    this.state = 2;
  }
}
/////////////////////////////////////////

//draws enemies for world 2
public void drawEnemiesWorld2() {
  drawEnemiesWorld1();

  pushMatrix();
  //setup
  translate(width/2, height/2);
  rotateX(rotX);
  rotateY(rotY);
  //placing coin
  fill(#f46542);
  translate(e3.vals.getX(), e3.vals.getY(), e3.vals.getZ());
  sphere(20);
  popMatrix();

  pushMatrix();
  //setup
  translate(width/2, height/2);
  rotateX(rotX);
  rotateY(rotY);
  //placing coin
  fill(#f46542);
  translate(e4.vals.getX(), e4.vals.getY(), e4.vals.getZ());
  sphere(20);
  popMatrix();
}

//checks to see if the user has collided with any enemies
public void checkEnemiesWorld2() {
  float newRotX = rotX % 6.283;
  float newRotY = rotY % 6.283;

  checkEnemiesWorld1();

  if (newRotX > -0.30 && newRotX < -0.06 && newRotY < -3.72 && newRotY > -3.94 ||
    newRotX > -0.30 && newRotX < -0.06 && newRotY < 2.56 && newRotY > 2.33) {
    this.state = 2;
  } else if (newRotX > 0.17 && newRotX < 0.48 && newRotY < 1.39 && newRotY > 1.07 ||
    newRotX > 0.17 && newRotX < 0.48 && newRotY < -4.89 && newRotY > -5.21) {
    this.state = 2;
  }
}

//draws enemies for world 3
public void drawEnemiesWorld3() {
  drawEnemiesWorld2();

  pushMatrix();
  //setup
  translate(width/2, height/2);
  rotateX(rotX);
  rotateY(rotY);
  //placing coin
  fill(#f46542);
  translate(e5.vals.getX(), e5.vals.getY(), e5.vals.getZ());
  sphere(20);
  popMatrix();

  pushMatrix();
  //setup
  translate(width/2, height/2);
  rotateX(rotX);
  rotateY(rotY);
  //placing coin
  fill(#f46542);
  translate(e6.vals.getX(), e6.vals.getY(), e6.vals.getZ());
  sphere(20);
  popMatrix();
}

//checks to see if the user has collided with any enemies
public void checkEnemiesWorld3() {
  float newRotX = rotX % 6.283;
  float newRotY = rotY % 6.283;

  checkEnemiesWorld2();

  if (newRotX > -0.26 && newRotX < 0.07 && newRotY < 0.3 && newRotY > -0.04 ||
    newRotX > -0.07 && newRotX < 0.23 && newRotY < 0.33 && newRotY > 6.23) {
    this.state = 2;
  } else if (newRotX > -0.05 && newRotX < 0.21 && newRotY < -2.06 && newRotY > -2.29 ||
    newRotX > -0.05 && newRotX < 0.21 && newRotY < 4.22 && newRotY > 3.98) {
    this.state = 2;
  }
}

//draws enemies for world 4
public void drawEnemiesWorld4() {
  drawEnemiesWorld3();

  pushMatrix();
  //setup
  translate(width/2, height/2);
  rotateX(rotX);
  rotateY(rotY);
  //placing coin
  fill(#f46542);
  translate(e7.vals.getX(), e7.vals.getY(), e7.vals.getZ());
  sphere(20);
  popMatrix();

  pushMatrix();
  //setup
  translate(width/2, height/2);
  rotateX(rotX);
  rotateY(rotY);
  //placing coin
  fill(#f46542);
  translate(e8.vals.getX(), e8.vals.getY(), e8.vals.getZ());
  sphere(20);
  popMatrix();
}

//checks to see if the user has collided with any enemies
public void checkEnemiesWorld4() {
  float newRotX = rotX % 6.283;
  float newRotY = rotY % 6.283;

  checkEnemiesWorld3();

  if (newRotX > -0.07 && newRotX < 0.24 && newRotY < 2.14 && newRotY > 1.82 ||
    newRotX > -0.07 && newRotX < 0.23 && newRotY < -4.14 && newRotY > -4.46) {
    this.state = 2;
  } else if (newRotX > -0.06 && newRotX < 0.23 && newRotY < 3.73 && newRotY > 3.43 ||
    newRotX > -0.06 && newRotX < 0.23 && newRotY < -2.53 && newRotY > -2.84) {
    this.state = 2;
  }
}

//draws enemies for world 5
public void drawEnemiesWorld5() {
  drawEnemiesWorld4();

  pushMatrix();
  //setup
  translate(width/2, height/2);
  rotateX(rotX);
  rotateY(rotY);
  //placing coin
  fill(#f46542);
  translate(e9.vals.getX(), e9.vals.getY(), e9.vals.getZ());
  sphere(20);
  popMatrix();

  pushMatrix();
  //setup
  translate(width/2, height/2);
  rotateX(rotX);
  rotateY(rotY);
  //placing coin
  fill(#f46542);
  translate(e10.vals.getX(), e10.vals.getY(), e10.vals.getZ());
  sphere(20);
  popMatrix();
}

//checks to see if the user has collided with any enemies
public void checkEnemiesWorld5() {
  float newRotX = rotX % 6.283;
  float newRotY = rotY % 6.283;

  checkEnemiesWorld4();

  if (newRotX > -0.54 && newRotX < -0.26 && newRotY < -1.12 && newRotY > -1.47 ||
    newRotX > -0.54 && newRotX < -0.26 && newRotY < 5.16 && newRotY > 4.81) {
    this.state = 2;
  } else if (newRotX > -0.24 && newRotX < 0.07 && newRotY < -3.43 && newRotY > -3.71 ||
    newRotX > 0.28 && newRotX < 0.54 && newRotY < 2.84 && newRotY > 4.54) {
    this.state = 2;
  }
}
///////////////////////////////////////////////////////////////////////////////

//draws all coins
public void drawCoins() {
  for (int i = 0; i < coins.size(); i++) {
    if (coins.get(i).isVisible) {
      drawCoin(coins.get(i));
    }
  }
}

//draws the given coin
public void drawCoin(Coin coin) {
  pushMatrix();
  //setup
  translate(width/2, height/2);
  rotateX(rotX);
  rotateY(rotY);
  //placing coin
  fill(coin.c);
  translate(coin.vals.getX(), coin.vals.getY(), coin.vals.getZ());
  sphere(10);
  popMatrix();
}

/*
Checks if any of the coins have been collected. Checks the rotation angle of the user's
 ball to detect if it is above a coin, then makes that coin invisible and 
 increments the score.
 */
void checkCoin() {

  float newRotX = rotX % 6.283;
  float newRotY = rotY % 6.283;

  //System.out.println(newRotX);
  //System.out.println(newRotY);

  //float fullRot = 6.283;

  //FRONT
  //coin 1
  if (newRotX > -0.16 && newRotX < 0.08 && newRotY > 0.35 && newRotY < 0.57 ||
    newRotX > -0.16 && newRotX < 0.08 && newRotY > -5.93 && newRotY < -5.72) {
    if (this.c1.isVisible == true) {
      this.c1.isVisible = false;
      score++;
    }
  }

  //coin 2
  else if (newRotX < -0.2 && newRotX > -0.43 && newRotY < -0.35 && newRotY > -0.53 ||
    newRotX < -0.2 && newRotX > -0.43 && newRotY < 5.95 && newRotY > 5.71) {
    if (this.c2.isVisible == true) {
      this.c2.isVisible = false;
      score++;
    }
  }

  //RIGHT
  //coin 3
  else if (newRotX > 0.17 && newRotX < 0.35 && newRotY < -0.89 && newRotY > -1.07  ||
    newRotX > 0.17 && newRotX < 0.35 && newRotY < 5.41 && newRotY > 5.22) {
    if (this.c3.isVisible == true) {
      this.c3.isVisible = false;
      score++;
    }
  }

  //coin 4
  else if (newRotX > -0.22 && newRotX < 0.01 && newRotY < -1.2 && newRotY > -1.46 ||
    newRotX > -0.22 && newRotX < 0.01 && newRotY < 5.09 && newRotY > 4.83) {
    if (this.c4.isVisible == true) {
      this.c4.isVisible = false;
      score++;
    }
  }

  //BACK
  //coin 5
  else if (newRotX > 0.56 && newRotX < 0.71 && newRotY < -2.94 && newRotY > -3.13 ||
    newRotX > 0.56 && newRotX < 0.71 && newRotY < 3.36 && newRotY > 3.11) {
    if (this.c5.isVisible == true) {
      this.c5.isVisible = false;
      score++;
    }
  }

  //coin 6
  else if (newRotX > -0.48 && newRotX < -0.31 && newRotY < -3.48 && newRotY > -3.69 ||
    newRotX > -0.48 && newRotX < -0.31 && newRotY < 2.80 && newRotY > 2.593) {
    if (this.c6.isVisible == true) {
      this.c6.isVisible = false;
      score++;
    }
  }

  //LEFT
  //coin 7
  else if (newRotX > 0.54 && newRotX < 0.69 && newRotY < 1.60 && newRotY > 1.35 ||
    newRotX > 0.54 && newRotX < 0.69 && newRotY < -4.68 && newRotY > -4.93) {
    if (this.c7.isVisible == true) {
      this.c7.isVisible = false;
      score++;
    }
  }

  //coin 8
  else if (newRotX > -0.36 && newRotX < -0.11 && newRotY < 1.81 && newRotY > 1.51 ||
    newRotX < -0.10 && newRotX > -0.37 && newRotY < -4.47 && newRotY > -4.75) {
    if (this.c8.isVisible == true) {
      this.c8.isVisible = false;
      score++;
    }
  }
}

//moves the cube according to the dragging of the mouse
void mouseDragged() {
  float rate = 0.01;
  rotX += (pmouseY-mouseY) * rate;
  rotY -= (mouseX-pmouseX) * rate;
}

//checks which world the user has selected to play, and if that world is playable (unlocked) yet
//if the world is playable, allows user to play that world.
void mousePressed() {

  if (state == 0) {
    if (mouseX > 120 && mouseX < 270 && mouseY > 120 && mouseY < 295) {
      this.state = 3;
      //reset position
      rotX = PI/6;
      rotY = PI/6;
    }

    //fill(#2d2d2d);
    //rect(325, 120, 150, 175);
    if (mouseX > 325 && mouseX < 475 && mouseY > 120 && mouseY < 295) {
      if (this.world2Unlocked) {
        this.state = 4;
        //reset position
        rotX = PI/6;
        rotY = PI/6;
      }
    }

    //fill(#2d2d2d);
    //rect(530, 120, 150, 175);
    if (mouseX > 530 && mouseX < 680 && mouseY > 120 && mouseY < 295) {
      if (this.world3Unlocked) {
        this.state = 5;
        //reset position
        rotX = PI/6;
        rotY = PI/6;
      }
    }

    //fill(#2d2d2d);
    //x y w h
    //rect(180, 335, 150, 175);
    if (mouseX > 180 && mouseX < 330 && mouseY > 335 && mouseY < 510) {
      if (this.world4Unlocked) {
        this.state = 6;
        //reset position
        rotX = PI/6;
        rotY = PI/6;
      }
    }

    //fill(#2d2d2d);
    //rect(470, 335, 150, 175);
    if (mouseX > 470 && mouseX < 620 && mouseY > 335 && mouseY < 510) {
      if (this.world5Unlocked) {
        this.state = 7;
        //reset position
        rotX = PI/6;
        rotY = PI/6;
      }
    }
  } else if (state == 1) {
    //x y w h
    //rect(width/2 - 100, height-100, 200, 100);
    if (mouseX > width/2 - 100 && mouseX < width/2 - 100 + 200 && mouseY < height-100 && mouseY > height-200) {
      this.state = 0;
    }
  } else if (state == 2) {
    //x y w h
    //rect(width/2 - 100, height-100, 200, 100);
    if (mouseX > width/2 - 100 && mouseX < width/2 - 100 + 200 && mouseY < height-100 && mouseY > height-200) {
      this.state = 0;
    }
  }
}

//checks if the game is won, updates worlds accordingly.
void checkScore() {
  if (this.score == 8) {

    if (this.state == 3) {
      this.world2Unlocked = true;
    }

    if (this.state == 4) {
      this.world3Unlocked = true;
    }

    if (this.state == 5) {
      this.world4Unlocked = true;
    }

    if (this.state == 6) {
      this.world5Unlocked = true;
    }

    if (this.state == 7) {
      this.world6Unlocked = true;
    }
    this.state = 1;
  }
}
