  static Board board;
  ScoreManager scoreManager;
  int dropCounter = 0; 
  int dropInterval = 60;
  static int level = 0;
  static boolean levelChange = false;
  static boolean isGameOver = false;
  static int grayRows = 0;
  boolean holdingSpace = false;
  static boolean grayMode = false;
  static int grayTicks = 0;
  static int lastPoint = 0;
  static int score = 0;


  
  void setup() {
    size(750, 1000);
    frameRate(60);
    board = new Board();
    board.spawnTetro();
    scoreManager = new ScoreManager();
    
    dropCounter = 0; 
    dropInterval = 60;
    level = 0;
    levelChange = false;
    isGameOver = false;
    grayRows = 0;
    holdingSpace = false;
  }
  
  void draw() {
    background(0);
    
    if (grayMode){
      if (lastPoint != score){
        grayTicks = 0;
      }
      
      if (grayTicks >= 600){
        grayTicks = 0;
        grayRows++;
        board.grayRow(grayRows, false);
      }
    }
    
    if (levelChange) {
      dropInterval = (int) (60 * (Math.pow((0.8-((level-1)*0.007)), level - 1)));
      levelChange = false;
    }
    
    //for (int i = 0; i < level; i++) {
    //  dropInterval *= 0.9;
    //}
    //frameRate(60 + (level * 20));
      
    if (isGameOver) {
      fill(255, 0, 0);
      textAlign(CENTER, CENTER);
      textSize(48);
      text("GAME OVER", width / 2, height / 2 - 50);
      textSize(24);
      text("Press R to Restart", width / 2, height / 2 + 10);
      return;
    }
    
  
    if (dropCounter >= dropInterval) {
      board.tetroDown();
      dropCounter = 0;
    }
    dropCounter++;
    //board.placeAtBottom();
    board.update();
    board.drawBoard();
    scoreManager.display();
    if (grayMode){
      grayTicks++;
    }
    lastPoint = score;
  }
  
  void keyPressed() {
    if (key == CODED) {
      
      if (keyCode == LEFT) {
        board.currentTetro.moveLeft();
      } else if (keyCode == RIGHT) {
        board.currentTetro.moveRight();
      } else if (keyCode == DOWN) {
        if (board.currentTetro.moveDown() == 1) {
          board.placeDown();
        }
      } else if (keyCode == UP) {
        board.currentTetro.rotate();
      }
    } else {
      
      if (key == 'c' || key == 'C') {
        board.lockPiece();
      }
      if (key == 'T' || key == 't') {
        grayRows--;
        board.grayRow(grayRows, true);

      }
      if (key == 'g' || key == 'G') {
        grayMode = !grayMode;
      }
      if (key == ' ' && !holdingSpace) {
        holdingSpace = true;
        board.allDownAndHighlight(true);
      }
      else if (isGameOver && key == 'r' || key == 'R'){
       setup();
       isGameOver = false;
       level = 0;
       grayRows = 0;
      }
    } 
  }
  void keyReleased() {
    if (key == ' ') holdingSpace = false;
  }
    
