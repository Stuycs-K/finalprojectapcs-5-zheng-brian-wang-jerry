class Board{
  Tetronimo[][] grid;
  int boardWidth;
  int boardHeight;
  static int blockLength;
  
  Board(int w, int h){
    boardWidth = w;
    boardHeight = h;
  }
  
  public boolean isLineFull(int row){
    for (int i = 0; i < (boardWidth / blockLength); i++){
      if (grid[row][i] == null){
        return false;
      }
    }
    return true;
  }
  
}
