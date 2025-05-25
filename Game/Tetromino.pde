class Tetromino {
  Block[] blocks;
  int c_x, c_y;
  int t_color, b_size;
  int tetrominoType;
  
  Tetromino(int c_x, int c_y, int type, int size, int c) {
    this.c_x = c_x;
    this.c_y = c_y;
    this.t_color = c;
    this.b_size = size;
    this.tetrominoType = type;

    initializeBlocks();
  }

  void initializeBlocks() {
    this.blocks = new Blocks[4];
    double scale = b_size / 2.0;
    int[][] offests = new int[][] {
      {0, -3}, {0 ,-1}, {0, 1}, {0, 3}, // straight
      {0, -2}, {0, 0}, {0, 2}, {-2, 2}, // L left
      {0, -2}, {0, 0}, {0, 2}, {2, 2}, // L right
      {-1, -1}, {1 ,-1}, {-1, 1}, {1, 1}, // square
      {-2, -1}, {0 ,-1}, {0, 1}, {2, 1}, // left zigzag
      {2, -1}, {0 ,-1}, {0, 1}, {-2, 1}, // right zigzag
      {-2, 0}, {0, 0}, {2, 0}, {0, 2}, // T shape
    }
    for (int i = 0; i < 4; i++) {
      blocks[i] = new Block(
        c_x + offsets[tetrominoType][0] * scale,
        c_y + offsets[tetrominoType][1] * scale,
        b_size, t_color
      );
    }
  }
  
  void rotate() {
    // coordinates of centers of block relative to center
    for (int i = 0; i < blocks.length; i++) {
      int n_x = blocks[i].x - c_x;
      int n_y = blocks[i].y - c_y;
      
      int temp = n_x;
      n_x = -n_y;
      n_y = temp;

      n_x += c_x;
      n_y += c_y;
    }
    
  }

  void moveBlocks(int dx, int dy) {
    for (int i = 0; i < blocks; i++) {
      blocks[i].move(dx, dy);
    }
  }

  // moves the center of the tetromino
  void move(int dx, int dy) {
    c_x += dx;
    c_y += dy;
    moveBlocks(dx, dy)
  }
  
  void moveLeft() {
    move(1, 0);
  }
  
  void moveRight() {
    move(-1, 0);
  }
  
  void moveDown() {
    move(0, 1);
  }

  void drawTetro() {
    for (int i = 0; i < blocks; i++) {
      blocks[i].drawBlock();
    }
  }
}
