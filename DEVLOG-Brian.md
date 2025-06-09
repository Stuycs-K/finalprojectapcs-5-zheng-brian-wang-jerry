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

### 2025-06-02 - Displayed outline of where tetro will go
Made a copy of the currentTetro and moved that copy all the way down. This tetroCopy was drawn using lighter colors and border. A highlight instance variable needed to be added to Block for a lighter outline, and setBlocks() was created for Tetro to make sure tetroCopy followed rotations. - 45 min

### 2025-06-03 - Fix tetro generation and adjusted outline
Added new instance variable of Board called tetroTypes. Updated makeRandoTetro such that it will fill tetroTypes with numbers 0-6 when it is empty, and when it is not, a tetro with a random type with be generated, and that type will be removed from tetroType. This ensures that all 7 tetro will be used until they repeat. If highlight is true for a block, it will have a strokeWeight of 4. Blocks belonging to an upcoming tetro will have an outline that is a darker shade of its color. - 35 min

### 2025-06-04 - Tried to fix positioning of held tetro
Wrote a moveTo method for Blocks and Tetromino. Called this method on a copy of heldTetro to move it to the bottom right corner. Made a new constructor for Tetromino that takes in a Block[] blocks, used this contructor for the copy() method for Tetromino. copy() was also edited to make a blocksCopy[] of blocks[] by calling copy() on each Block. - 35 min.

### 2025-06-04 - More tweaking of upcoming/held tetro positions. Adjusted tetro offsets.
After observing tetr.io, realized that some of the centers of rotation for our tetro were wrong, namely for the straight, square, and left and right zigzag pieces. Thus, the offsets in initializeBlocks() were adjusted. Also updated initializeBlocks() to intialize c_x to 9 and c_y to 3,  or to 10 and 2 for the straight and square tetro. Adjusted the y value upcoming and held tetro would be placed if they were a straight or a square, becuase those have different center y values from the rest. - 55 min

### 2025-06-04 - Aesthetic changes and fix held tetro
Tweaked drawBlock() such that tetro inside the board will also have a border color of a darker shade of its color. Changed lockPiece() so that initializeBlocks() is called on heldTetro when taking in a tetro to reset it, and it is also called on a copy of currentTetro before being assigned to heldTetro. - 25 min

### 2025-06-04 - Tweak fall down speed, detect holding space
Created the instance variable holdingSpace that will be true when space is being held. Used keyReleased() to detect when holdingSpace becomes false. Only allows tetro to go all the way down when space is not being held, because holding space would have made many blocks go down way too fast and almost instantly lose the game. Also adjusted the dropInterval to use the official tetris formula for speed of tetro moving down. - 20 min

### 2025-06-04 - Debug and fix gray blocks
The error with gray blocks was due to the previous reworking of move() for moveTo(). It was fixed by changing the units from block units to pixels. Also only incremented grayRows if level is at least 5. - 25 min

### 2025-06-06 - Fixed removing gray blocks
Added the boolean parameter subtract to grayBlocks. Reused code from clearLine() to move the blocks down after a grayRow is removed. - 30 min

### 2025-06-08 - Difficulty balancing and reset tweaks
Fast rotate mode only makes rotate move down the tetro 2 blocks rather than 3. If isGameOver is true, keyPressed() will return after checking for r and R. - 10 min

### 2025-06-08 - Moved stats to a seperate section on left
Expanded the window to the left. Added variables startingX and endingX to mark the start and end of board. Fixed all the errors that followed regarding x values not being offset by startingX. Displayed the score, level, and lines cleared in the stats section. - 45 min

### 2025-06-08 - Added switches to stats
Made a seperate removeGrayRow() method instead of using a boolean parameter for grayRows. Wrote drawSwitch(), which draws a light grey outer rectangle outline, a filled in darker gray inner rectangle that covers half of the outer rectangle, a line dividing the outer rectangle in half, and the status of the mode (on/off). Toggling the mode causes the inner rectangle to switch the half of the outer rectangle its on, acting as a switch. Added switches for all 3 modes - 80 min

### 2025-06-08 - Changes for recording
Allowed for reseting the game at any time during the game for convenience, and made T give the user 5000 score. These changes were reverted after the video was recorded. - 15 min

### 2025-06-08 - Clean code and merge
Deleted useless comments of previous code, added clarifying comments, and merged the code into main - 20 min.

I believe this document accurately reflects the contributions of my teammate - Jerry Wang









