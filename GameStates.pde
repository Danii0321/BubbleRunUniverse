//the states of this game

//represents the starting/selection screen of the game
void startState() {
  //boxes behind world selection, lit up if the world is unlocked
  fill(#6d6c6c);
  rect(120, 120, 150, 175);

  fill(#2d2d2d);
  if (world2Unlocked) {
    fill(#6d6c6c);
  }
  rect(325, 120, 150, 175);

  fill(#2d2d2d);
  if (world3Unlocked) {
    fill(#6d6c6c);
  }
  rect(530, 120, 150, 175);

  fill(#2d2d2d);
  if (world4Unlocked) {
    fill(#6d6c6c);
  }
  rect(180, 335, 150, 175);

  fill(#2d2d2d);
  if (world5Unlocked) {
    fill(#6d6c6c);
  }
  rect(470, 335, 150, 175);

  fill(200);
  textFont(font2, 20);
  text("Instructions: Click and drag mouse to rotate world.", 200, 40);
  text("Collect all coins, avoid red enemies.", 260, 65);
  fill(200);
  textFont(font2, 30);
  text("Select world to begin!", width/2 - 120, 100);

  fill(250);
  textFont(font, 80);
  text("Bubble Run", 130, height- 200);
  textFont(font, 120);
  text("Universe", 80, height- 80);

  //drawing world selection boxes
  noStroke();
  smooth();
  lights();

  //level 1
  pushMatrix();
  translate(width/4, height/4);
  fill(#41f4ca);
  box(100);
  //text
  translate(-30, 90);
  fill(250);
  textFont(font2, 25);
  text("World 1", 0, 0);
  popMatrix();

  //level 2
  pushMatrix();
  translate(width/2, height/4);
  fill(#41f4e5);
  box(100);
  //text
  translate(-30, 90);
  fill(250);
  textFont(font2, 25);
  text("World 2", 0, 0);
  popMatrix();

  //level 3
  pushMatrix();
  translate(width - 200, height/4);
  fill(#41dcf4);
  box(100);
  //text
  translate(-50, 90);
  fill(250);
  textFont(font2, 25);
  text("World 3", 0, 0);
  popMatrix();

  //level 4
  pushMatrix();
  translate(width/3, height/2);
  fill( #41acf4);
  box(100);
  //text
  translate(-30, 90);
  fill(250);
  textFont(font2, 25);
  text("World 4", 0, 0);
  popMatrix();

  //level 5
  pushMatrix();
  translate(width/1.5, height/2);
  fill(#4185f4);
  box(100);
  //text
  translate(-30, 90);
  fill(250);
  textFont(font2, 25);
  text("World 5", 0, 0);
  popMatrix();
}

//represents world 1
void world1() {

  fill(255);
  textFont(font2, 30);
  text("Score: " + this.score, 20, 25);

  smooth();
  lights();

  fill(#004d66);
  noStroke();

  //rendering the world
  pointLight(255, 255, 0, width- 100, height/4, 100);
  directionalLight(0, 230, 230, 1, 0, 0);

  pushMatrix();
  translate(width/2, height/2);
  rotateX(rotX);
  rotateY(rotY);
  box(400);
  popMatrix();

  //draw the coins
  drawCoins();

  //draws the enemy
  drawEnemiesWorld1();

  //rendering the user's sphere
  pushMatrix();
  fill(255);
  //width/2, height/2, 400
  translate(myVals.getX(), myVals.getY(), myVals.getZ());
  sphere(12);
  // line(0, 100, 200, 0, 0, -400);
  stroke(300);
  popMatrix();

  checkCoin();
  checkEnemiesWorld1();

  checkScore();
}

////////////////////////////////////////////////


//represents world 2
void world2() {

  fill(255);
  textFont(font2, 30);
  text("Score: " + this.score, 20, 25);

  smooth();
  lights();

  fill(#004d66);
  noStroke();

  //rendering the world
  pointLight(255, 255, 0, width- 100, height/4, 100);
  directionalLight(0, 230, 230, 1, 0, 0);

  pushMatrix();
  translate(width/2, height/2);
  rotateX(rotX);
  rotateY(rotY);
  box(400);
  popMatrix();

  //draw the coins
  drawCoins();

  //draws the enemy
  drawEnemiesWorld2();

  //rendering the user's sphere
  pushMatrix();
  fill(255);
  //width/2, height/2, 400
  translate(myVals.getX(), myVals.getY(), myVals.getZ());
  sphere(12);
  // line(0, 100, 200, 0, 0, -400);
  stroke(300);
  popMatrix();

  checkCoin();
  checkEnemiesWorld2();

  checkScore();
}

///////////////////////////////////////////////////


//represents world 3
void world3() {

  fill(255);
  textFont(font2, 30);
  text("Score: " + this.score, 20, 25);

  smooth();
  lights();

  fill(#004d66);
  noStroke();

  //rendering the world
  pointLight(255, 255, 0, width- 100, height/4, 100);
  directionalLight(0, 230, 230, 1, 0, 0);
  pushMatrix();
  translate(width/2, height/2);
  rotateX(rotX);
  rotateY(rotY);
  box(400);
  popMatrix();

  //draw the coins
  drawCoins();

  //draws the enemy
  drawEnemiesWorld3();


  //rendering the user's sphere
  pushMatrix();
  fill(255);
  //width/2, height/2, 400
  translate(myVals.getX(), myVals.getY(), myVals.getZ());
  sphere(12);
  // line(0, 100, 200, 0, 0, -400);
  stroke(300);
  popMatrix();

  line(0, 0, 0, 200, 200, 0);

  checkCoin();
  checkEnemiesWorld3();

  checkScore();
}

/////////////////////////////////////////////////////


//represents world 4
void world4() {

  fill(255);
  textFont(font2, 30);
  text("Score: " + this.score, 20, 25);

  smooth();
  lights();

  fill(#004d66);
  noStroke();

  //rendering the world
  pointLight(255, 255, 0, width- 100, height/4, 100);
  directionalLight(0, 230, 230, 1, 0, 0);
  pushMatrix();
  translate(width/2, height/2);
  rotateX(rotX);
  rotateY(rotY);
  box(400);
  popMatrix();

  //draw the coins
  drawCoins();

  //draws the enemy
  drawEnemiesWorld4();

  //rendering the user's sphere
  pushMatrix();
  fill(255);
  //width/2, height/2, 400
  translate(myVals.getX(), myVals.getY(), myVals.getZ());
  sphere(12);
  // line(0, 100, 200, 0, 0, -400);
  stroke(300);
  popMatrix();

  line(0, 0, 0, 200, 200, 0);

  checkCoin();
  checkEnemiesWorld4();

  checkScore();
}

//////////////////////////////////////////////


//represents world 5
void world5() {

  fill(255);
  textFont(font2, 30);
  text("Score: " + this.score, 20, 25);

  smooth();
  lights();

  fill(#004d66);
  noStroke();

  //rendering the world
  pointLight(255, 255, 0, width- 100, height/4, 100);
  directionalLight(0, 230, 230, 1, 0, 0);
  pushMatrix();
  translate(width/2, height/2);
  rotateX(rotX);
  rotateY(rotY);
  box(400);
  popMatrix();

  //draw the coins
  drawCoins();

  //draws the enemy
  drawEnemiesWorld5();

  //rendering the user's sphere
  pushMatrix();
  fill(255);
  //width/2, height/2, 400
  translate(myVals.getX(), myVals.getY(), myVals.getZ());
  sphere(12);
  // line(0, 100, 200, 0, 0, -400);
  stroke(300);
  popMatrix();

  line(0, 0, 0, 200, 200, 0);

  checkCoin();
  checkEnemiesWorld5();

  checkScore();
}

//////////////////////////////////////////////////

//represents the win state of the game, 
//allows user to return to home screen
void win() {
  background(#2bada2);
  fill(255);
  textFont(font, 100);
  text("You win! ", width/2 - 250, 150);

  fill(255);
  //x, y, w, h
  rect(width/2 - 100, height-200, 200, 100);
  fill(0);
  textFont(font2, 30);
  text("Return to Home", width/2 - 90, height-200 + 50);

  score = 0;
  c1.isVisible = true;
  c2.isVisible = true;
  c3.isVisible = true;
  c4.isVisible = true;
  c5.isVisible = true;
  c6.isVisible = true;
  c7.isVisible = true;
  c8.isVisible = true;
}

//represents the lose state of the game
//allows user to return to home screen
void lose() {
  background(#e2521d);
  fill(255);
  textFont(font, 100);
  text("You lose! ", width/2 - 250, 150);

  fill(255);
  //x, y, w, h
  rect(width/2 - 100, height-200, 200, 100);
  fill(0);
  textFont(font2, 30);
  text("Return to Home", width/2 - 90, height-200 + 50);

  score = 0;
  c1.isVisible = true;
  c2.isVisible = true;
  c3.isVisible = true;
  c4.isVisible = true;
  c5.isVisible = true;
  c6.isVisible = true;
  c7.isVisible = true;
  c8.isVisible = true;
}
