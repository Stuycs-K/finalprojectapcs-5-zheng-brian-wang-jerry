class Board{
  Block[][] grid;
  int blockLength = 50;
  int boardWidth = width/blockLength;
  int boardHeight = height/blockLength; 

  ArrayList<Integer> tetroTypes;

  ArrayList<Tetromino> upcomingTetro;
  // Block[][] displayUpcomingTetro;
  Tetromino currentTetro;
  Tetromino heldTetro;
  boolean hasHeld = false;
  


  Board(){
    grid = new Block[boardHeight][boardWidth];  
    for (int i = 0; i < boardHeight; i++) {
      for (int j = 0; j < boardWidth; j++) {
        int c = 0;
        // if (j == 10) c = color(255, 255, 255);
        if (j >= 10) c = color(211, 211, 211);
        grid[i][j] = new Block((int) ((j+0.5) * blockLength), int ((i+0.5) * blockLength), blockLength, c);
      }
    }
    tetroTypes = new ArrayList<Integer>();


    upcomingTetro = new ArrayList<Tetromino>();
    for (int i = 0; i < 3; i++) {
      upcomingTetro.add(makeRandoTetro());
    }
    // currentTetro = makeRandoTetro();
  }



  public boolean isLineFull(int row){
    for (int j = 0; j < boardWidth; j++){
      if (grid[row][j].c == 0 || grid[row][j].c == 128 ){
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
        grid[grayRows][col].move(0, -1);
        //System.out.println(grid[1][col].y / blockLength);
    }
    scoreManager.addScore(1);
    
    
  }

  public Tetromino makeRandoTetro() {
    int[][] colors = new int[][] {{0, 255, 255}, {0, 0, 255}, {255, 165, 0}, {255, 255, 0}, {255, 0, 0}, {0, 255, 0}, {255, 0, 255}};
    if (tetroTypes.size() == 0) {
      for (int i = 0; i < 7; i++) {
        tetroTypes.add(i);
      }
    }
    int rand = (int) (Math.random() * tetroTypes.size());
    // System.out.println(tetroTypes.get(rand));
    int type = tetroTypes.remove(rand);
    int h = 0;

    if (type == 0 || type == 1 || type == 2) {
      h = 1;
    }
    
    return new Tetromino(
      grid[h][500 / 2 / blockLength].x,
      grid[h][500 / 2 / blockLength].y,
      type, blockLength,
      color(colors[type][0], colors[type][1], colors[type][2]),
      grid
    );

  }

  public void spawnTetro() {
    
    currentTetro = upcomingTetro.remove(0);
    upcomingTetro.add(makeRandoTetro());
    hasHeld = false;
    
    for (Block b : currentTetro.blocks) {
      int x = b.x / blockLength;
      int y = b.y / blockLength;
  
      if (grid[y][x].c != 0) {
        isGameOver = true;
        return;
      }
    }
    
    //for (int i = 0; i < 3; i++) {
    //  System.out.print(upcomingTetro.get(i).tetrominoType + ", ");
    //}
    //System.out.println();
    

  }

  public void drawBorders() {
    stroke(color(255, 255, 255));
    strokeWeight(10);
    
    line(10 * blockLength, 0, 10*blockLength, boardHeight * blockLength);

    line(10*blockLength, 15*blockLength, 14*blockLength, 15*blockLength);
    strokeWeight(1);
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


    allDownAndHighlight(false);



    if (currentTetro != null) {
      currentTetro.drawTetro();
    }

    drawBorders();




    

    int y = 1;
    int offset = 4;

    for (int i = 0; i < 3; i++) {
      Tetromino current = upcomingTetro.get(i); 
      int type = current.tetrominoType;
      if (type == 0) offset = 6;

      for (int j = 0; j < 4; j++) {
        Block bCopy = current.blocks[j].copy();
        bCopy.move(7, y);
        bCopy.drawBlock();
      }

      y+=offset;

    }

    for (int j = 0; j < 4; j++) {
        if (heldTetro != null) {
          Block heldCopy = heldTetro.blocks[j].copy();
          heldCopy.move(7, 16);
          heldCopy.drawBlock();
        }
        
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
      spawnTetro();
    //} 
  }


  
  void allDownAndHighlight(boolean placeDown) {
    Tetromino tetroCopy = currentTetro.copy();

    tetroCopy.setBlocks(currentTetro.blocks);


    while (tetroCopy.moveDown() != 1);

    // int c = tetroCopy.t_color;
    // float r = red(c);
    // float g = green(c);
    // float b = blue(c);

    // r += (255 - r) / 1.4;
    // g += (255 - g) / 1.4;
    // b += (255 - b) / 1.4;

    // r%=256;
    // g%=256;
    // b%=256;

    for (Block block : tetroCopy.blocks) {
      // Block gridPos = grid[block.y / blockLength][block.x / blockLength];
      // gridPos.setHighlight(true);
      // gridPos.c = color(r, g, b);
      block.c = 0;
      block.setHighlight(true);
    }

    tetroCopy.drawTetro();


    
    

    if (placeDown) {
      while (currentTetro.moveDown() != 1);
      tetroDown();
    }
    // int max_y = -1;
    // int col = 0;
    
    // for (int i = 0; i < 4; i++) {
    //   if (max_y < currentTetro.blocks[i].y) {
    //     max_y = currentTetro.blocks[i].y;
    //     col = currentTetro.blocks[i].x;
    //   }
    // }
    // max_y /= blockLength;
    // col /= blockLength;
    
    // int row = max_y + 1;
    // //System.out.println("max: "  + max_y + "row: " + row);
    // while (row < boardHeight && grid[row][col].c == 0) {
    //   row++;
    // }
    // //System.out.println("max: "  + max_y + "row: " + row);    
    // currentTetro.move(0, row - max_y - 1);
    
    // // calculate the lowest block of the tetro
    // // loop down to nearest row where grid has color
    // // move down by the diff
  }
  
  void lockPiece() {
    if (hasHeld) return;  
  
    
    if (heldTetro == null) {
      heldTetro = currentTetro;
      spawnTetro();  
    } else {
      Tetromino temp = currentTetro;
      currentTetro = heldTetro;
  
      
      currentTetro.c_x = grid[1][5].x;
      currentTetro.c_y = grid[1][5].y;
      currentTetro.initializeBlocks();  
  
      heldTetro = temp;
    }
  
    hasHeld = true;
  }
  
  void grayRow(int row) {
    for (int i = row-1; i >= 0; i--) {
      for (int col = 0; col < boardWidth; col++) {
        grid[i][col].move(0, 1);
        grid[i+1][col] = grid[i][col].copy();
      }
    }
    
  for (int col = 0; col < 10; col++) {
    grid[0][col] = new Block(col * blockLength, 0, blockLength, 0); 
  }
    
    for (int col = 0; col < 10; col++) {
      grid[grid.length - row][col].setColor(128);
    }
  }
}
