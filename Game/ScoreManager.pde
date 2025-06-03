class ScoreManager {
  int score = 0;
  
  
  ScoreManager(Board board) {
    this.board = board;
  }

  void addScore(int linesCleared) {
    score += linesCleared * 100;
    level = 1 + score / 500;
    
    if (level > prevLevel) {
      board.addGrayRow();  
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
