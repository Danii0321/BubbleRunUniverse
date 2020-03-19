//Represents a coin
//contains location information, generates a random color, and tracks
//if the coin is visible or not (if it has been collected it is invisible)
public class Coin {
  //int faceNum;
  public TranslateVals vals;
  color c;
  Boolean isVisible;

  /*
  Coin(int faceNum) {
   this.faceNum = faceNum;
   //this.vals = createCoinOnFace(faceNum);
   this.c = chooseColor();
   }
   */

  Coin(TranslateVals vals) {
    this.vals = vals;
    this.c = chooseColor();
    this.isVisible = true;
  }

  //randomly generates coin colors
  public color chooseColor() {
    int rand = (int)random(1, 10);
    color newc = color(0);

    switch(rand) {
    case 1:
      //teal
      newc = color(#42f4f4);
      break;
    case 2:
      //green
      newc = color(#41f444);
      break;
    case 3:
      //yellow
      newc = color(#f4f141);
      break;
    case 4:
      //orange
      newc = color(#f49741);
      break;
    case 5:
      //blue
      newc = color(#41b8f4);
      break;
    case 6:
      //purple
      newc = color(#9d41f4);
      break;
    case 7:
      //pink
      newc = color(#f441d9);
      break;
    case 8:
      //lime green
      newc = color(#a9f441);
      break;
    case 9:
      //mint green
      newc = color(#41f4b2);
      break;
    case 10:
      //indigo
      newc = color(#8541f4);
      break;
    }
    return newc;
  }

  /*
  Creates the position values for this coin on the given face (1 - 6)
   
   public TranslateVals createCoinOnFace(int face) {
   TranslateVals createdVals = new TranslateVals(0, 0, 0);
   float xpos = random(-150, 150);
   float ypos = random(-150, 150);
   float zpos = random(-150, 150);
   
   switch(face) {
   //face 1 - front
   //coords: ?, ?, 200
   case 1:
   createdVals =  new TranslateVals(xpos, ypos, 200);
   break;
   //face 2 - right
   //coords: 200, ?, ?
   case 2:
   createdVals =  new TranslateVals(200, ypos, zpos);
   break;
   //face 3 - back
   // ? ? -200
   case 3:
   createdVals =  new TranslateVals(xpos, ypos, -200);
   break;
   //face 4 - left
   // -200 ? ?
   case 4:
   createdVals =  new TranslateVals(-200, ypos, zpos);
   break;
   //face 5 - top
   // ? -200 ?
   case 5:
   createdVals =  new TranslateVals(xpos, -200, zpos);
   break;
   //face 6 - bottom
   // ? 200 ?
   case 6:
   createdVals =  new TranslateVals(xpos, 200, zpos);
   break;
   }
   return createdVals;
   }
   */
}
