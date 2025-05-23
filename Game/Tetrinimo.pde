class Tetromino {
  Block[] blocks;
  int center_x;
  int center_y;
  int t_color;
  int[] tetrominoTypes = new int[7];
  // 0 is straight, 1 is L left, 2 is L right, 3 is square, 4 is left zizag, 5 is T shape, 6 is right zizag
  int tetrominoType;
  
  Tetromino(int c_x, int c_y, int type, int c) {
    this.center_x = c_x;
    this.center_y = c_y;
    this.t_color = c;
    this.tetrominoType = type;
  }
  
  
  void rotate() {
    // coordinates of centers of block relative to center
    for (int i = 0; i < blocks.length; i++) {
      int n_x = blocks[i].x - center_x;
      int n_y = blocks[i].y - center_y;
      
      int temp = n_x;
      n_x = - n_y;
      n_y = -temp;
    }
    
  }
}
