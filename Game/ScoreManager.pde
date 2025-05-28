class ScoreManager {
  int score = 0;
  int level = 1;

  void addScore(int linesCleared) {
    score += linesCleared * 100;
    level = 1 + score / 500;
  }

  int getLevel() {
    return level;
  }

  void display() {
    fill(255);
    textSize(16);
    text("Score: " + score, 10, 20);
    text("Level: " + level, 10, 40);
  }
}
