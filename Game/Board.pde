class Board{
  Block[][] grid;
  int blockLength = 50;
  int boardWidth = width/blockLength;
  int boardHeight = height/blockLength; 
  Tetromino currentTetro;


  Board(){
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

  public void spawnTetro() {
    int[][] colors = new int[][] {{0, 255, 255}, {0, 0, 255}, {255, 165, 0}, {255, 255, 0}, {255, 0, 0}, {0, 255, 0}, {255, 0, 255}};
    int type = (int) random(7);

    int h = 0;
    if (type == 0 || type == 1 || type == 2) {
      h = 1;
    }
    this.currentTetro = new Tetromino(
      grid[h][boardWidth / 2].x,
      grid[h][boardWidth / 2].y,
      type, blockLength,
      color(colors[type][0], colors[type][1], colors[type][2]),
      grid
    );
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
          //stroke(255);
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
    if (currentTetro.moveDown() == 1) placeDown();
  }
  
  public void placeDown() {
    //if (currentTetro.blocks[3].y >= grid[boardHeight - 1][0].y) {
      for (int i = 0; i < 4; i++) {
        int x = (currentTetro.blocks[i].x / blockLength);
        int y = (currentTetro.blocks[i].y / blockLength);
        grid[y][x].setColor(currentTetro.blocks[i].c);
      }
      spawnTetro();
    //} 
  }
  
}
