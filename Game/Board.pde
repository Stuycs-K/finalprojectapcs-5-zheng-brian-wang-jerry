class Board{
  Block[][] grid;
  int boardWidth, boardHeight;
  int blockLength = 10;
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
    this.currentTetro = new Tetromino(x, y, type, blockLength, c);
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
    currentTetro.moveDown();
  }
}
