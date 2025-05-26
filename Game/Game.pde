  Board board;
  int dropCounter = 0;
  int dropInterval = 30; 
  
  void setup() {
    size(300, 600);
    frameRate(60);
    board = new Board();
    board.spawnTetro(width / 2, 2, int(random(0, 7)), color(random(255), random(255), random(255)));
  }
  
  void draw() {
    background(0);
  
    if (dropCounter >= dropInterval) {
      board.updateBoard();
      dropCounter = 0;
    }
    dropCounter++;
  
    board.drawBoard();
    
  }
  
  void keyPressed() {
    if (key == CODED) {
      if (keyCode == LEFT) {
        board.currentTetro.moveLeft();
      } else if (keyCode == RIGHT) {
        board.currentTetro.moveRight();
      } else if (keyCode == DOWN) {
        board.currentTetro.moveDown();
      } else if (keyCode == UP) {
        board.currentTetro.rotate();
      }
    }
  }
