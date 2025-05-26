class Board{
  Block[][] grid;
  int boardWidth, boardHeight, blockLength;
  Tetromino currentTetro;


  Board(){
    boardWidth = width/blockLength;
    boardHeight = height/blockLength;
    grid = new Block[boardHeight][boardWidth];
  }
  
  public boolean isLineFull(int row){
    for (int i = 0; i < (boardWidth / blockLength); i++){
      if (grid[row][i] == null){
        return false;
      }
    }
    return true;
  }

  public void spawnTetro(int x, int y, int type, int c) {
    Tetromino tetro = new Tetromino(x, y, type, blockLength, c);
    this.currentTetro = tetro;

    for (int i = 0; i < 4; i++) {
      Block[] b = tetro.blocks;
      int x2 = b[i].x / blockLength;
      int y2 = b[i].y / blockLength; 
      grid[y2][x2] = b[i];
    }
  }

  public void drawBoard() {
    for (int i = 0; i < boardHeight; i++) {
      for (int j = 0; j < boardWidth; j++) {
        if (grid[i][j] != null) {
          grid[i][j].drawBlock();
        }
      }
    }
  }

  public void updateBoard() {
    if (currentTetro == null) return;
    
    for (int i = 0; i < boardHeight; i++) {
      for (int j = 0; j < boardWidth; j++) {
        currentTetro.moveDown();
      }
    }
  }
  
}
