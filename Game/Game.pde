  static Board board;
  ScoreManager scoreManager;
  int dropCounter = 0; 
  int dropInterval = 50;
  static int level = 0;
  static boolean isGameOver = false;


  
  void setup() {
    size(500, 1000);
    frameRate(60);
    board = new Board();
    board.spawnTetro();
  }
  
  void draw() {
    background(0);
    //for (int i = 0; i < level; i++) {
    //  dropInterval *= 0.9;
    //}
    frameRate(60 + (level * 20));
      
    if (isGameOver) {
      fill(255, 0, 0);
      textAlign(CENTER, CENTER);
      textSize(48);
      text("GAME OVER", width / 2, height / 2 - 50);
      textSize(24);
      text("Press R to Restart", width / 2, height / 2 + 10);
      return;
    }
    
  
    if (dropCounter >= dropInterval) {
      board.tetroDown();
      dropCounter = 0;
    }
    dropCounter++;
    //board.placeAtBottom();
    board.update();
    board.drawBoard();
    scoreManager.display();
     
  }
  
  void keyPressed() {
    if (key == CODED) {
      if (keyCode == LEFT) {
        board.currentTetro.moveLeft();
      } else if (keyCode == RIGHT) {
        board.currentTetro.moveRight();
      } else if (keyCode == DOWN) {
        if (board.currentTetro.moveDown() == 1) {
          board.placeDown();
        }
      } else if (keyCode == UP) {
        board.currentTetro.rotate();
      }
    } else {
      if (key == 'c' || key == 'C') {
        board.lockPiece();
      }
      if (key == ' ') {
        board.allTheWayDown();
      }
      else if (key == 'r' || key == 'R' && isGameOver){
       setup();
       isGameOver = false;
      }
    } 
  }
