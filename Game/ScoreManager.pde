class ScoreManager {
  int rightEdge = startingX * blockLength;

  int middle = rightEdge / 2;

  int tSize;

  void addScore() {
    score += 100;
    int prevLevel = level;
    level = 1 + score / 500;
    if (prevLevel < level) {
      if (grayMode){
          if (grayRows > 0) grayRows--;
          board.removeGrayRow(grayRows);
      }
      levelChange = true;
    }
  }

  int getLevel() {
    return level;
  }

  void display() {
    tSize = 43;
    fill(255);
    textSize(tSize);
    textAlign(CENTER);
    
    text("SCORE", middle, tSize + tSize/2);
    text(score, middle, 2*tSize + tSize/2);

    text("LEVEL", middle, 5*tSize + tSize/2);
    text(level, middle, 6*tSize + tSize/2); 

    text("LINES", middle, 9*tSize + tSize/2);
    text(linesCleared, middle, 10*tSize + tSize/2); 

    stroke(255);
    strokeWeight(10);

    line(0, height/2, startingX*blockLength, height/2);
    line(startingX*blockLength, 0, startingX*blockLength, height);

    tSize = 34;
    textSize(tSize);

    text("GRAY MODE", middle, height/2 + tSize + tSize/2);
    drawSwitch(grayMode, height/2 + 2*tSize + tSize/2);

    text("FAST ROTATE", middle, height/2 + 6*tSize + tSize/2);
    drawSwitch(fastRotateMode, height/2 + 7*tSize + tSize/2);

    text("INVERSE", middle, height/2 + 11*tSize + tSize/2);
    drawSwitch(inverseMode, height/2 + 12*tSize + tSize/2);

  }

  void drawSwitch(boolean on, int startingHeight) {
    strokeWeight(5);
    stroke(color(215, 215, 215));
    fill(0);

    rect(middle-2*tSize, startingHeight, 4*tSize, 3*tSize/2 );
    
    fill(128);
    stroke(128);

    
    if (on) {
      rect(middle+5, startingHeight+5, 2*tSize-10, 3*tSize/2-10);
      fill(color(0, 255, 0));
      text("ON", middle + tSize, startingHeight + tSize+2.5);
    }
    else {
      rect(middle-2*tSize+5, startingHeight+5, 2*tSize-10, 3*tSize/2-10);
      fill(color(255, 0, 0));
      text("OFF", middle - tSize, startingHeight + tSize+2.5 );
    }

    stroke(75);
    line(middle, startingHeight + 3, middle, startingHeight + 3*tSize/2 - 2.5);

    fill(255);
  }
}
