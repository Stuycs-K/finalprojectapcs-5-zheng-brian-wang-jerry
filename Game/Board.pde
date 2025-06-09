class Board{
  Block[][] grid;
  int blockLength = Game.blockLength;

  int startingX = Game.startingX;
  int endingX = Game.endingX;
  int boardWidth = Game.endingX - Game.startingX;

  int boardHeight = height/blockLength; 

  ArrayList<Integer> tetroTypes;

  ArrayList<Tetromino> upcomingTetro;

  Tetromino currentTetro;
  Tetromino heldTetro;
  boolean hasHeld = false;
  


  Board(){
    grid = new Block[boardHeight][boardWidth];  
    for (int i = 0; i < boardHeight; i++) {
      for (int j = 0; j < boardWidth; j++) {
        int c = 0;
        grid[i][j] = new Block((int) ((startingX + j+0.5) * blockLength), int ((i+0.5) * blockLength), blockLength, c);
      }
    }
    tetroTypes = new ArrayList<Integer>();


    upcomingTetro = new ArrayList<Tetromino>();
    for (int i = 0; i < 4; i++) {
      upcomingTetro.add(makeRandoTetro());
    }
  }



  public boolean isLineFull(int row){
    for (int j = 0; j < 10; j++){
      if (grid[row][j].c == 0 || grid[row][j].c == 128){
        return false;
      }
    }
    return true;
  }



  public void clearLine(int row) {
    linesCleared++;

    int before = grayRows;
    scoreManager.addScore();

    if (grayRows > before) return;

    for (int col = 0; col < 10; col++) {
      grid[row][col].setColor(0);
    }

    for (int i = row-1; i >= 0; i--) {
      for (int col = 0; col < 10; col++) {
        grid[i][col].move(0, blockLength);
        grid[i+1][col] = grid[i][col].copy();
      }
    }

    for (int col = 0; col < boardWidth; col++) {
        grid[0][col].move(0, -blockLength);
    } 
  }

  public Tetromino makeRandoTetro() {
    int[][] colors = new int[][] {{0, 255, 255}, {0, 0, 255}, {255, 165, 0}, {255, 255, 0}, {255, 0, 0}, {0, 255, 0}, {255, 0, 255}};
    if (tetroTypes.size() == 0) {
      for (int i = 0; i < 7; i++) {
        tetroTypes.add(i);
      }
    }
    int rand = (int) (Math.random() * tetroTypes.size());

    int type = tetroTypes.remove(rand);
    int h = 0;

    if (type == 0 || type == 1 || type == 2) {
      h = 1;
    }
    
    return new Tetromino(
      type,
      color(colors[type][0], colors[type][1], colors[type][2]),
      grid
    );

  }

  public void spawnTetro() {
    
    currentTetro = upcomingTetro.remove(0);
    upcomingTetro.add(makeRandoTetro());
    hasHeld = false;
    
    for (Block b : currentTetro.blocks) {
      int x = b.x / blockLength - startingX;
      int y = b.y / blockLength;
  
      if (grid[y][x].c != 0) {
        isGameOver = true;
        return;
      }
    }
  }

  public void drawBorders() {
    stroke(color(255, 255, 255));
    strokeWeight(10);
    
    line(endingX * blockLength, 0, endingX * blockLength, boardHeight * blockLength);

    line(endingX *blockLength, 16*blockLength, width, 16*blockLength);
    strokeWeight(1);
  }

  public void drawUpcomingTetro() {
    double y = 2.5;
    int prevType = -1;

    for (int i = 0; i < 4; i++) {
      double offset = 4;

      Tetromino current = upcomingTetro.get(i); 
      Tetromino currentCopy = current.copy();

      int type = current.tetrominoType;

      if (type == 0 || type == 3) y-=0.5;
    
      currentCopy.moveTo(12.5 + startingX, y);

      if (type == 0) y-=0.5;
      if (type == 3) y+=0.5;

      currentCopy.drawTetro();

      y+=offset;
      prevType = type;
    }
  }

  public void drawHeldTetro() {
    if (heldTetro != null) {
      Tetromino heldTetroCopy = heldTetro.copy();
      int type = heldTetro.tetrominoType;

      double x = 12.5 + startingX;
      double y = 18.5;

      if (type == 3) {
        y-=0.5;
      }

      heldTetroCopy.moveTo(x, y);
      heldTetroCopy.drawTetro();
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

    allDownAndHighlight(false);
   
    if (currentTetro != null) {
      currentTetro.drawTetro();
    }

    drawBorders();
    drawUpcomingTetro();
    drawHeldTetro();

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
      for (int i = 0; i < 4; i++) {
        int x = (currentTetro.blocks[i].x / blockLength);
        int y = (currentTetro.blocks[i].y / blockLength);
        grid[y][x-startingX].setColor(currentTetro.blocks[i].c);
      }
      spawnTetro();
  }


  
  void allDownAndHighlight(boolean placeDown) {
    Tetromino tetroCopy = currentTetro.copy();


    while (tetroCopy.moveDown() != 1);

    for (Block block : tetroCopy.blocks) {
      block.c = 0;
      block.setHighlight(true);
    }
    tetroCopy.drawTetro();

    
    if (placeDown) {
      while (currentTetro.moveDown() != 1);
      tetroDown();
    }
  }
  
  void lockPiece() {
    if (hasHeld) return;  
  
      
    if (heldTetro == null) {
      heldTetro = currentTetro;
      heldTetro.initializeBlocks();  
      spawnTetro();  
    }
    else {
      Tetromino temp = currentTetro.copy();
      temp.initializeBlocks();  

      currentTetro = heldTetro;
      heldTetro = temp;
    }
    hasHeld = true;
  }

  void removeGrayRow(int row) {
    for (int col = 0; col < 10; col++) {
      grid[boardHeight-1-row][col].c = 0;
    }

    for (int i = boardHeight - 2 - row; i >= 0; i--) {
      for (int col = 0; col < 10; col++) {
        grid[i][col].move(0, blockLength);
        grid[i+1][col] = grid[i][col].copy();
      }
    }

    for (int col = 0; col < boardWidth; col++) {
        grid[0][col].move(0, -blockLength);
    }
  }
  
  void grayRow(int row) {
      for (int col = 0; col < 10; col++) {
        grid[grid.length - row][col].setColor(128);
      }
  }
}
