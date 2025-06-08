class ScoreManager {
  int rightEdge = startingX * blockLength;

  int middle = rightEdge / 2;

  void addScore() {
    score += 100;
    int prevLevel = level;
    level = 1 + score / 500;
    if (prevLevel < level) {
      if (grayMode){
          grayRows--;
          board.grayRow(grayRows, true);
      }
      else{
        levelChange = true;
        if (level >= 1) {
          grayRows++;
          board.grayRow(grayRows, false);
        }
      }
    }
  }

  int getLevel() {
    return level;
  }

  void display() {
    int tSize = 43;
    fill(255);
    textSize(tSize);
    textAlign(CENTER);
    
    text("SCORE", middle, tSize + tSize/2);
    text(score, middle, 2*tSize + tSize/2);

    text("LEVEL", middle, 5*tSize + tSize/2);
    text(level, middle, 6*tSize + tSize/2); 

    text("LINES", middle, 9*tSize + tSize/2);
    text(level, middle, 10*tSize + tSize/2); 

    stroke(255);
    strokeWeight(10);

    line(0, height/2, startingX*blockLength, height/2);
    line(startingX*blockLength, 0, startingX*blockLength, height);
    // if (grayMode){
    //   text("GRAY MODE: OFF", 10, 60);
    // }
    // else{
    //   text("GRAY MODE: ON", 10, 60);
    // }
    // if (fastRotateMode){
    //   text("FAST ROTATE MODE: ON", 10, 80);
    // }
    // else{
    //   text("FAST ROTATE MODE: OFF", 10, 80);
    // }
  }
}
