# Dev Log:

This document must be updated daily every time you finish a work session.

## Brian Zheng

### 2025-05-16 - Second Proposal
Wrote the second proposal (a 2048-based game with Fibonacci numbers) into PROTOTYPE.md. ~ 10 minutes

### 2025-05-21 - Started writing the in-depth description
Expanded on the brief description about what we considered were the "defining features of Tetris". Also started the in-depth description by decreasing our minimum viable product. ~ 15 min

### 2025-05-21 - Wrote the features we want beyond the MVP
Specifically described what each personal gimmick would entail: floor is lava would make certain tiles unbreakable, reverse gravity mode made blocks go up instead of down, and the board could completely flip 180 degrees. - 20 min

### 2025-05-22 - Started Block class
Wrote the instance variables and constructor for the Block class. - 10 min

### 2025-05-23 - Started Tetromino class
Wrote the instance variables (array of blocks, x, y positions, color, and tetromino type) and constructor for the Block class. Also wrote the rotate method based on making new coordinates for the centers of the blocks that would be relative to the center of the tetromino, and then rotating by 90 degrees by doing (x, y) -> (-y, x). - 30 min

### 2025-05-25 - Merging, moving and drawing Tetrominos and Blocks
Fixed the drawBlock method: x is the center of the block, and thus the top left corner is given by (x-size/2, y-size/2) rather than (x*size, y*size). Wrote a move() method for Block, and used that to make a move() method for Tetromino, which was used to write moveLeft(), moveRight(), and moveDown(). Fixed rotate() by adding the Tetromino center coordinates back to the new coordinates. Wrote initializeBlocks(), which used an array of offsets to initialize the 4 blocks of each Tetromino type with its proper coordinates. - 60 min

### 2025-05-25 - Methods for drawing, updating Board, and spawning Tetrominos
Started to spawnTetro(): made the Tetromino blocks elements of grid[][] first. Wrote drawBoard(), which looped through grid[][] and called drawBlocks on each Block. Wrote funcitonality for updating the board by moving the current tetro down one block. - 25 min

### 2025-05-26 - grid/Tetromino logic tweaks and updated move()
Made the dx and dy parameters for move in terms of unit blocks, so the actual distance traveled would be dx*blockSize and dy*blockSize. Removed adding Tetro to the grid upon spawning, and instead decided to draw it seperately from the grid and only add it in when it is placed down. - 30 min

### 2025-05-26 - grid/Tetromino logic tweaks and updated move()
Initialized grid in the Board constructor with black colored blocks with proper coordinates. Also checked to see if the new coord inates after move() made the Tetro overlap with non empty blocks (those with color), and if so didn't allow the Tetro to move. - 20 min






