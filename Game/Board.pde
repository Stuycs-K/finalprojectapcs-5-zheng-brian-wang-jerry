import java.util.Queue;

class Board{
  Block[][] grid;
  int blockLength = 50;
  int boardWidth = width/blockLength;
  int boardHeight = height/blockLength; 
  Queue<Tetromino> next3Tetro;
  Tetromino currentTetro;
  Tetromino heldTetro;
  boolean hasHeld = false;


  Board(){
    grid = new Block[boardHeight][boardWidth];  
    for (int i = 0; i < boardHeight; i++) {
      for (int j = 0; j < boardWidth; j++) {
        grid[i][j] = new Block((int) ((j+0.5) * blockLength), int ((i+0.5) * blockLength), blockLength, 0);
      }
    }
  }



  public boolean isLineFull(int row){
    for (int j = 0; j < boardWidth; j++){
      if (grid[row][j].c == 0){
        return false;
      }
    }
    return true;
  }



  public void clearLine(int row) {
    for (int col = 0; col < boardWidth; col++) {
      grid[row][col].setColor(0);
    }
    for (int i = row-1; i >= 0; i--) {
      for (int col = 0; col < boardWidth; col++) {
        grid[i][col].move(0, 1);
        grid[i+1][col] = grid[i][col].copy();
      }
    }

    for (int col = 0; col < boardWidth; col++) {
        grid[0][col].move(0, -1);
        //System.out.println(grid[1][col].y / blockLength);
    }
    scoreManager.addScore(1);
  }

  public void updateNext3Tetro() {
    if (next3Tetro.size() < 3) {
      
      
    }
  }
  
  public Tetromino makeRandoTetro() {
    int[][] colors = new int[][] {{0, 255, 255}, {0, 0, 255}, {255, 165, 0}, {255, 255, 0}, {255, 0, 0}, {0, 255, 0}, {255, 0, 255}};
    int type = (int) random(7);
    int h = 0;

    if (type == 0 || type == 1 || type == 2) {
      h = 1;
    }
    
    return new Tetromino(
      grid[h][boardWidth / 2].x,
      grid[h][boardWidth / 2].y,
      type, blockLength,
      color(colors[type][0], colors[type][1], colors[type][2]),
      grid
    );

  }

  public void spawnTetro() {
    if (
    this.currentTetro = makeRandoTetro();
    hasHeld = false;

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


  public void tetroDown() {
    if (currentTetro == null) return;
    if (currentTetro.moveDown() == 1) placeDown();
  }


  public void update() {
    for (int row = 0; row < boardHeight; row++) {
      if (isLineFull(row)) {
        clearLine(row);
      }
    }
  }


  public void placeDown() {
    //if (currentTetro.blocks[3].y >= grid[boardHeight - 1][0].y) {
      for (int i = 0; i < 4; i++) {
        int x = (currentTetro.blocks[i].x / blockLength);
        int y = (currentTetro.blocks[i].y / blockLength);
        grid[y][x].setColor(currentTetro.blocks[i].c);
      }
      next3Tetro.remove();
      spawnTetro();
    //} 
  }
  
  void allTheWayDown() {
    //while (currentTetro.moveDown() != 1);
    int max_y = -1;
    int col = 0;
    
    for (int i = 0; i < 4; i++) {
      if (max_y < currentTetro.blocks[i].y) {
        max_y = currentTetro.blocks[i].y;
        col = currentTetro.blocks[i].x;
      }
    }
    max_y /= blockLength;
    col /= blockLength;
    
    int row = max_y + 1;
    //System.out.println("max: "  + max_y + "row: " + row);
    while (row < boardHeight && grid[row][col].c == 0) {
      row++;
    }
    //System.out.println("max: "  + max_y + "row: " + row);    
    currentTetro.move(0, row - max_y - 1);
    
    // calculate the lowest block of the tetro
    // loop down to nearest row where grid has color
    // move down by the diff
  }
  
  void lockPiece() {
    if (hasHeld) return;  
  
    
    if (heldTetro == null) {
      heldTetro = currentTetro;
      spawnTetro();  
    } else {
      Tetromino temp = currentTetro;
      currentTetro = heldTetro;
  
      
      currentTetro.c_x = grid[1][boardWidth / 2].x;
      currentTetro.c_y = grid[1][boardWidth / 2].y;
      currentTetro.initializeBlocks();  
  
      heldTetro = temp;
    }
  
    hasHeld = true;
  }
  
  boolean gameOver(){
    if (isLineFull(0)){
      
}
