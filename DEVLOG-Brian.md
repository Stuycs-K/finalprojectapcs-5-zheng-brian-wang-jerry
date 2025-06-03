# Dev Log:

This document must be updated daily every time you finish a work session.

## Brian Zheng

### 2025-05-16 - Second Proposal
Wrote the second proposal (a 2048-based game with Fibonacci numbers) into PROTOTYPE.md. ~ 15 minutes

### 2025-05-21 - Started writing the in-depth description
Expanded on the brief description about what we considered were the "defining features of Tetris". Also started the in-depth description by decreasing our minimum viable product. ~ 20 min

### 2025-05-21 - Wrote the features we want beyond the MVP
Specifically described what each personal gimmick would entail: floor is lava would make certain tiles unbreakable, reverse gravity mode made blocks go up instead of down, and the board could completely flip 180 degrees. - 30 min

### 2025-05-22 - Started Block class
Wrote the instance variables and constructor for the Block class. - 15 min

### 2025-05-23 - Started Tetromino class
Wrote the instance variables (array of blocks, x, y positions, color, and tetromino type) and constructor for the Block class. Also wrote the rotate method based on making new coordinates for the centers of the blocks that would be relative to the center of the tetromino, and then rotating by 90 degrees by doing (x, y) -> (-y, x). - 35 min

### 2025-05-25 - Merging, moving and drawing Tetrominos and Blocks
Fixed the drawBlock method: x is the center of the block, and thus the top left corner is given by (x-size/2, y-size/2) rather than (x*size, y*size). Wrote a move() method for Block, and used that to make a move() method for Tetromino, which was used to write moveLeft(), moveRight(), and moveDown(). Fixed rotate() by adding the Tetromino center coordinates back to the new coordinates. Wrote initializeBlocks(), which used an array of offsets to initialize the 4 blocks of each Tetromino type with its proper coordinates. - 60 min

### 2025-05-25 - Methods for drawing, updating Board, and spawning Tetrominos
Started to spawnTetro(): made the Tetromino blocks elements of grid[][] first. Wrote drawBoard(), which looped through grid[][] and called drawBlocks on each Block. Wrote funcitonality for updating the board by moving the current tetro down one block. - 25 min

### 2025-05-26 - grid/Tetromino logic tweaks and updated move()
Made the dx and dy parameters for move in terms of unit blocks, so the actual distance traveled would be dx*blockSize and dy*blockSize. Removed adding Tetro to the grid upon spawning, and instead decided to draw it seperately from the grid and only add it in when it is placed down. - 20 min

### 2025-05-26 - grid initialization and tetro move() tweaks
Initialized grid in the Board constructor with black colored blocks with proper coordinates. Also checked to see if the new coord inates after move() made the Tetro overlap with non empty blocks (those with color), and if so didn't allow the Tetro to move. - 15 min

### 2025-05-26 - more rotation tweaks and tetro centering fix
Changed the centers of some tetro such that the center is actually the center of one of the tetro blocks. Made rotate() not do anything if tetro is a square. Changed the height at which tetro would spawn based on the type (some are taller so need to spawn lower). - 20 min

### 2025-05-26 - Start work on placing tetro down functionality but it is broken
Wrote placeDown(), which used the coordinates of the tetro to insert it into grid[][] in the right spot, and then called spawnTetro(). Removed the parameters of spawnTetro() and intialized the needed variables inside the method instead. Changed the color of tetro from random colors to actual tetris colors based on tetro type. Made move() and moveDown() booleans so that placeDown() is called if moveDown() is false. However, tetro tries to move down one more level before being placed down. - 60 min

### 2025-05-27 - fixed issue with placeDown()
Seperated the for loop in moveBlocks() that goes through all 4 blocks into 2 for loops, one to calculate the new coords and make sure they are valid, and only then will the 2nd for loop that actually moves the blocks be run. - 15 min

### 2025-05-27 - Prevent tetro moving and rotating outside left/right borders
Move and moveDown were made to return ints where returning 1 meant that the tetro tried to move below the bottom border and failed, and 2 meant that tetro failed to move past the left/right borders. If moveLeft() and moveRight() gets a 2 when move() is called, it will simply return and do nothing. Seperated rotate() into two for loops like in moveBlocks(): one for calculating and validating new coordinates, and the other for applying them. - 35 min

### 2025-05-27 - Implemented line clearing 
Revised isLineFull() in accordance with current grid logic. Wrote clearLine(row) so that it set all blocks in grid[row] to have color black, and moved all blocks down by 1 row, both in coordinates and in position in grid[][]. - 40 min

### 2025-05-28 - Prevented rotation into existing blocks
Updated the condition in rotate() such that it will return if the block at the position of the calculated coordinates has color. - 10 min

### 2025-05-29- added functionality for sending tetro all the way down with space key
Wrote allTheWayDown(), which calculates the lowest block in a tetro, then the highest row in which there are fixed blocks, and moves the tetro down by the difference between these two values. - 15 min

### 2025-05-29- started work on displaying the next 3 tetro to be spawned
Created the instance variable of upcomingTetro for Board, which is an ArrayList<Tetromino> with the next 3 tetro. Initialized upcomingTetro in the constructor with three random Tetro. Made the generation of a random Tetormino a seperate method. Updated spawnTetro such that the currentTetro became the first element of upcomingTetro, upcomingTetro is removed of the first element, and a new random Tetro is addded to it. - 75 min

### 2025-05-30 - Forgot to pull; fixed merge conflicts from game over code
Was fixing game over logic, but it was already fixed in the latest commit. Fixed merge conflicts in Game and Board - 25 min.

### 2025-05-31 - Disabled pressing R to start new game during game. Updated allTheWayDown() logic
When r or R is pressed, whether isGameOver is true is checked before proceeding. allTheWayDown() simply calls moveDown() until it returns a 1. - 20 min

### 2025-05-31 - MVP is done, merged MVP into main
git checkout main
git merge --no-ff MVP
- 5 min

### 2025-06-02 - Wrote code to display next 3 tetro
Changed the window size from 500x1000 to 700x1000. Looped through the tetro of upComingTetro in drawBoard(), and drew them in that newly created right hand section by moving them right and (if necessary) down. Assigned blocks in grid a color if j >= 10 to make the right hand section apparent, and drew a thick line down x=500 to act as a border. - 35 min






