class Tetromino {
  Block[] blocks;
  int c_x, c_y;
  int t_color, b_size;
  int tetrominoType;
  Block[][] grid;
  
  Tetromino(int c_x, int c_y, int type, int size, int c, Block[][] grid) {
    this.c_x = c_x;
    this.c_y = c_y;
    this.t_color = c;
    this.b_size = size;
    this.tetrominoType = type;
    this.grid = grid;

    initializeBlocks();
  }

  void initializeBlocks() {
    this.blocks = new Block[4];
    double scale = b_size / 2.0;
    int[][][] offsets = {
      {{0, -3}, {0 ,-1}, {0, 1}, {0, 3}}, // straight
      {{0, -2}, {0, 0}, {0, 2}, {-2, 2}}, // L left
      {{0, -2}, {0, 0}, {0, 2}, {2, 2}}, // L right
      {{-1, -1}, {1 ,-1}, {-1, 1}, {1, 1}}, // square
      {{-2, -1}, {0 ,-1}, {0, 1}, {2, 1}}, // left zigzag
      {{2, -1}, {0 ,-1}, {0, 1}, {-2, 1}}, // right zigzag
      {{-2, 0}, {0, 0}, {2, 0}, {0, 2}}, // T shape 
    };
    for (int i = 0; i < 4; i++) {
      int dx = offsets[tetrominoType][i][0];
      int dy = offsets[tetrominoType][i][1];
      blocks[i] = new Block(
        (int)(c_x + dx * scale),
        (int)(c_y + dy * scale),
        b_size,
        t_color
      );
    }
  }
  
  void rotate() {
    for (int i = 0; i < blocks.length; i++) {
    //  System.out.println("Before: " + blocks[i].x + " " + blocks[i].y); 
    //  System.out.println("Center: " + c_x + " " + c_y); 
      int dx = blocks[i].x - c_x;
      int dy = (blocks[i].y - c_y);
  
      int new_dx = -dy;
      int new_dy = dx;
  
      blocks[i].x = c_x + new_dx;
      blocks[i].y = c_y + new_dy;

      // System.out.println("After: " + blocks[i].x + " " + blocks[i].y);

    }
  }



  boolean moveBlocks(int dx, int dy) {
    for (int i = 0; i < blocks.length; i++) {
      
      int x = (blocks[i].x / b_size) + dx;
      int y = (blocks[i].y / b_size) + dy;
      if (grid[y][x].c != 0) {
        return false;
      }
      
      blocks[i].move(dx, dy);
    }
    return true;
  }

  // moves the center of the tetromino
  void move(int dx, int dy) {
    if (moveBlocks(dx, dy) == false) {
      return;
    }
    c_x += dx * b_size;
    c_y += dy * b_size;
  }
  
  void moveLeft() {
    move(-1, 0);
  }
  
  void moveRight() {
    move(1, 0);
  }

  
  void moveDown() {
    move(0, 1);
  }

  void drawTetro() {
    for (int i = 0; i < blocks.length; i++) {
      blocks[i].drawBlock();
    }
  }
}
