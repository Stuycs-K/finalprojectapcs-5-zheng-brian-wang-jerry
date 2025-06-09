  static Board board;
  ScoreManager scoreManager;

  int dropCounter = 0; 
  int dropInterval = 60;

  static int level = 0;
  static int score = 0;
  static int linesCleared  = 0;

  static int grayRows = 0;
  static int grayTicks = 0;

  static int lastPoint = 0;

  static int blockLength = 50;
  static int statsBoardWidth = 200;
  static int startingX = statsBoardWidth / blockLength;
  static int endingX = startingX + 10;

  static boolean levelChange = false;
  static boolean isGameOver = false;
  boolean holdingSpace = false;
  static boolean grayMode = false;
  static boolean fastRotateMode = false;
  static boolean inverseMode = false;

  



  
  void setup() {
    size(950, 1000);
    frameRate(60);
    board = new Board();
    board.spawnTetro();
    scoreManager = new ScoreManager();
    
    dropCounter = 0; 
    dropInterval = 60;

    level = 0;
    score = 0;

    grayRows = 0;
    grayTicks = 0;

    lastPoint = 0;
   
    levelChange = false;
    isGameOver = false;
    holdingSpace = false;
    grayMode = false;
    fastRotateMode = false;
    inverseMode = false;

    strokeCap(SQUARE);
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
        board.grayRow(grayRows);
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
      scoreManager.display();

      fill(255, 0, 0);
      textAlign(CENTER, CENTER);
      textSize(48);
      text("GAME OVER", (width+startingX*blockLength) / 2, height / 2 - 50);
      textSize(24);
      text("Press R to Restart", (width+startingX*blockLength) / 2, height / 2 + 10);
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
      if (isGameOver) return;
      
      if (keyCode == LEFT) {
        if (inverseMode){
           board.currentTetro.moveRight();
        }
        else{
          board.currentTetro.moveLeft();
        }
      } else if (keyCode == RIGHT) {
        if (inverseMode){
           board.currentTetro.moveLeft();
        }
        else{
          board.currentTetro.moveRight();
        }
      } else if (keyCode == DOWN) {
        if (board.currentTetro.moveDown() == 1) {
          board.placeDown();
        }
      } else if (keyCode == UP) {
        board.currentTetro.rotate();
      }
    }
    else {

      // if (isGameOver) {
        if (key == 'r' || key == 'R') setup();
        // return;
      // }
      
      if (key == 'c' || key == 'C') {
        board.lockPiece();
      }
      // if (key == 'T' || key == 't') {
      //   grayRows--;
      //   board.grayRow(grayRows, true);

      // }
      if (key == 'g' || key == 'G') {
        grayMode = !grayMode;
      }
      if (key == 'f' || key == 'F') {
        fastRotateMode = !fastRotateMode;
      }
      if (key == 'i' || key == 'I') {
        inverseMode = !inverseMode;
      }
      if (key == ' ' && !holdingSpace) {
        holdingSpace = true;
        board.allDownAndHighlight(true);
      }
      
    } 
  }
  void keyReleased() {
    if (key == ' ') holdingSpace = false;
  }
    
