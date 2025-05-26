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
    this.blocks = new Block[4];
    double scale = b_size / 2.0;
    int[][][] offsets = {
      {{0, -3}, {0, -1}, {0, 1}, {0, 3}},     
      {{0, -2}, {0, 0}, {0, 2}, {-2, 2}},     
      {{0, -2}, {0, 0}, {0, 2}, {2, 2}},      
      {{-1, -1}, {1, -1}, {-1, 1}, {1, 1}},   
      {{-2, -1}, {0, -1}, {0, 1}, {2, 1}},    
      {{2, -1}, {0, -1}, {0, 1}, {-2, 1}},    
      {{-2, 0}, {0, 0}, {2, 0}, {0, 2}}       
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
      int dx = (blocks[i].x - c_x) / b_size;
      int dy = (blocks[i].y - c_y) / b_size;
  
      int new_dx = -dy;
      int new_dy = dx;
  
      blocks[i].x = c_x + new_dx * b_size;
      blocks[i].y = c_y + new_dy * b_size;
    }
  }



  void moveBlocks(int dx, int dy) {
    for (int i = 0; i < blocks.length; i++) {
      blocks[i].move(dx, dy);
    }
  }

  // moves the center of the tetromino
  void move(int dx, int dy) {
    c_x += dx;
    c_y += dy;
    moveBlocks(dx, dy);
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
