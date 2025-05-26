class Board{
  Block[][] grid;
  int boardWidth, boardHeight;
  int blockLength;
  Tetromino currentTetro;


  Board(){
    blockLength = 10;
    boardWidth = width/blockLength;
    boardHeight = height/blockLength;
    
    grid = new Block[boardHeight][boardWidth];  

    for (int i = 0; i < boardHeight; i++) {
      for (int j = 0; j < boardWidth; j++) {
        grid[i][j] = new Block((int) ((j+0.5) * blockLength), int ((i+0.5) * blockLength), blockLength, 0);
    }
    }

  }
  
  public boolean isLineFull(int row){
    for (int i = 0; i < (boardWidth / blockLength); i++){
      if (grid[row][i] == null){
        return false;
      }
    }
    return true;
  }

  public void spawnTetro(int type, int c) {
    this.currentTetro = new Tetromino(grid[1][boardWidth / 2].x, grid[1][boardWidth / 2 ].y, type, blockLength, c, grid);
    // for (int i = 0; i < 4; i++) {
    //   Block[] b = currentTetro.blocks;
    //   int b_x = b[i].x / blockLength;
    //   int b_y = b[i].y / blockLength; 
    //   System.out.println(b_x + " " + b_y);
    //   grid[b_y][b_x] = b[i];
    // }
  }


  public void drawBoard() {
    for (int i = 0; i < boardHeight; i++) {
      for (int j = 0; j < boardWidth; j++) {
        if (grid[i][j] != null) {
          stroke(255);
          grid[i][j].drawBlock();
        }
      }
    }

    if (currentTetro != null) {
      currentTetro.drawTetro();
    }
  }

  public void updateBoard() {
    if (currentTetro == null) return;
    currentTetro.moveDown();
  }
}
