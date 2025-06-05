class ScoreManager {

  void addScore(int linesCleared) {
    score += linesCleared * 100;
    int prevLevel = level;
    level = 1 + score / 500;
    if (prevLevel < level) {
      if (grayMode){
        if (grayRows >= 2){
          grayRows--;
          board.grayRow(grayRows);
        }
      }
      else{
        levelChange = true;
        if (level >= 5) {
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
  }
}
