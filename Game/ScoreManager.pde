class ScoreManager {

  void addScore(int linesCleared) {
    score += linesCleared * 100;
    int prevLevel = level;
    level = 1 + score / 500;
    if (prevLevel < level) {
      if (grayMode){
          grayRows--;
          board.grayRow(grayRows);
      }
      else{
        levelChange = true;
        if (level >= 1) {
          grayRows++;
          board.grayRow(grayRows);
        }
      }
    }
  }

  int getLevel() {
    return level;
  }

  void display() {
    fill(255);
    textSize(16);
    textAlign(LEFT, BASELINE);
    text("Score: " + score, 10, 20);
    text("Level: " + level, 10, 40);
    if (grayMode){
      text("Gray Mode: On", 10, 60);
    }
    else{
      text("Gray Mode: Off", 10, 60);
    }
  }
}
