import java.util.Arrays;

class Tetromino {
  Block[] blocks;
  int c_x, c_y;
  int t_color;
  int b_size = Game.blockLength;
  int tetrominoType;
  Block[][] grid;
  boolean highlight;
  
  
  Tetromino(int type, int c, Block[][] grid) {
    this.t_color = c;
    this.tetrominoType = type;
    this.grid = grid;  

    initializeBlocks();
  }

  Tetromino(int type, int c, Block[][] grid, Block[] blocks) {
    this(type, c, grid);
    this.blocks = blocks;
  }
 

  void initializeBlocks() {
    this.blocks = new Block[4];
    double scale = b_size / 2.0;

    this.c_x = 9 + startingX;
    this.c_y = 3;

    if (tetrominoType == 0 || tetrominoType == 3) {
      this.c_x++;
      this.c_y--;
    }
    c_x*=scale;
    c_y*=scale;
    // int[][] starting_centers = new int[][] {{10, 2}, {9, 3},{9, 3}, {10, 2}, {9, 3}, {9, 3}, {9, 3}}

    int[][][] offsets = {
      {{-3, -1}, {-1 ,-1}, {1, -1}, {3, -1}}, // straight
      {{-2, -2}, {-2, 0}, {0, 0}, {2, 0}}, // L left
      {{2, -2}, {2, 0}, {0, 0}, {-2, 0}}, // L right
      {{-1, -1}, {1 ,-1}, {-1, 1}, {1, 1}}, // square
      {{-2, -2}, {0 ,-2}, {0, 0}, {2, 0}}, // left zigzag
      {{2, -2}, {0 ,-2}, {0, 0}, {-2, 0}}, // right zigzag
      {{0, -2}, {0, 0}, {-2, 0}, {2, 0}}, // T shape 
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
    if (tetrominoType == 3) return;
    
    int[] newXValues = new int[4];
    int[] newYValues = new int[4];
    
    for (int i = 0; i < blocks.length; i++) {
    //  System.out.println("Before: " + blocks[i].x + " " + blocks[i].y); 
    //  System.out.println("Center: " + c_x + " " + c_y); 
      int dx = blocks[i].x - c_x;
      int dy = (blocks[i].y - c_y);
  
      int new_dx = -dy;
      int new_dy = dx;
      
      int new_x = c_x + new_dx;
      int new_y = c_y + new_dy;      
      
      if (new_x-startingX*blockLength < 0 || new_x / b_size >= endingX) return;
      if (grid[new_y/ b_size][new_x/ b_size - startingX].c != 0) return;
      
      newXValues[i] = new_x;
      newYValues[i] = new_y;

      // System.out.println("After: " + blocks[i].x + " " + blocks[i].y);

    }
    for (int i = 0; i < 4; i++) {
      blocks[i].x = newXValues[i];
      blocks[i].y = newYValues[i];
    }
    
    if (fastRotateMode){
      moveDown();
      moveDown();
    }
  }



  boolean moveBlocks(int dx, int dy) {
    for (int i = 0; i < blocks.length; i++) {
      
      int x = (blocks[i].x / b_size) + dx;
      int y = (blocks[i].y / b_size) + dy;
      //System.out.println(dy + ", " + x + ", " + y);
      if (x >= startingX && x < endingX && y < grid.length) {
        // System.out.println("true");
        if (grid[y][x-startingX].c != 0) {
          return false;
        }
      }
      else {
        // System.out.println("bad");  
      //  System.out.println("false" + x + ", " + y + "dx: " + dx + " dy: " + dy); 
        return false;
      }
    }
    
    for (int i = 0; i < blocks.length; i++) {
      blocks[i].move(dx * b_size, dy * b_size);
    }
    return true;
  }

  // moves the center of the tetromino
  int move(int dx, int dy) {
    boolean result = moveBlocks(dx, dy);
    if (!result && dy == 1) {
      return 1;
    }
    if (!result) {
      //System.out.println(2);
      return 2;
    }
    this.c_x += dx * b_size;
    this.c_y += dy * b_size;
    
    return 0;
  }
  
  void moveLeft() {
    if (move(-1, 0) == 2) return;
  }
  
  void moveRight() {
    if (move(1, 0) == 2) return;
  }

  
  int moveDown() {
    return move(0, 1);
  }

  // ignore grid
  void moveTo(double x, double y) { 
    int dx = (int) (x*b_size) - c_x;
    int dy = (int) (y*b_size) - c_y;

    for (Block b : blocks) {
      b.move(dx, dy);
    }
  }

  void drawTetro() {
    for (int i = 0; i < blocks.length; i++) {
      blocks[i].drawBlock();
    }
  }
  
  Tetromino copy() {
    Block[] blocksCopy = new Block[4];
    for (int i = 0; i < 4; i++) {
      blocksCopy[i] = blocks[i].copy();
    }

    return new Tetromino(tetrominoType, t_color, grid, blocksCopy);
  }

  void setHighlight(boolean value) {
    this.highlight = value;
  }

  void setColor(int c) {
    this.t_color = c;
  }
  
  void setBlocks(Block[] b) {
    for (int i = 0; i < 4; i++) {
      this.blocks[i] = b[i].copy();
    }
  }

  
  
  
}
