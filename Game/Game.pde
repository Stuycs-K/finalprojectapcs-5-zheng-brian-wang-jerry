  Board board;
  ScoreManager scoreManager;
  int dropCounter = 0; 
  int dropInterval = 50;
  static int level = 0;

  
  void setup() {
    size(500, 1000);
    frameRate(60);
    board = new Board();
    board.spawnTetro();
    scoreManager = new ScoreManager();
  }
  
  void draw() {
    background(0);
    frameRate(60 + (level * 20));
  
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
      //else{
      // setup(); 
      //}
    } 
  }
