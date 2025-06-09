[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/YxXKqIeT)
# Project Description

For our final project, we decided to create a replica of Tetris in Java Processing. 

In our version of Tetris, the player controls falling block shapes called tetrominoes, which descend one at a time from the top of a vertical grid, which is the board where the game is played. The player can move each piece left or right, rotate it, or accelerate its fall using the arrow keys to position it within the grid. The goal is to complete full horizontal lines; when a line is filled, it clears from the board, and all blocks above it shift downward. This will give you points, which will allow you to level up. As the game progresses, the pieces fall faster, and the gray rows from below start to increase, which increases the difficulty of the game. The game ends when the stack of pieces reaches the top of the grid, leaving no space for new tetrominoes to enter. 

To add onto the original game, we decided to create new gamemodes, as well as work on the game aesthically. We chose to copy much of the game aesthically, making sure to make the game look as good as possible and fixing any visual flaws/bugs from the original game. In terms of new content, we aimed to make the base game much more thought-provoking/time-intensive. We created three new gamemodes, which will be descirbed below.

# Intended usage:

Modes:

Rising Tides: Want to fill only one part of the board for a satisifying clip? Well, now you can't! The gray rows will now rise as the game progresses, regardless of what you're doing! The only way to stop this is to PLAY THE GAME and score points! Eveyrtime points are scored, the counter of your impending doom is reset to 0. During this mode, normal level ups will not cause the gray rows to rise, but rather will actually get rid of one gray row. Have fun! (Keybind: G)

Fast Rotate: Ever spam rotate for fun? Well, now you can't. Meant to force players to think before they move, rotating now shifts the tetronimo downwards so that rotating has to be calculated. Get it right or face the consequences. (Keybind: F)

Inverse Movement: Ever autopilot the first few minutes of Tetris because its too slow and easy? Now, you have to think which key you're pressing, because the left key moves the Tetronimo right, and the right key moves the Tetronimo left! (Keybind: I)
Keybinds:

R: Restart game (only after losing a game)
Left and Right keys: move tetronimo left or right
Up key: Rotate tetronimo clockwise 90 degrees
Down key: Shift tetronimo down quickly
Space key: Forces tetronimo to lowest possible position
G key: Toggle Rising Tides mode
F key: Toggle Fast Rotate mode
I key: Toggle Inverse Movement mode

Video: [Demo](https://drive.google.com/file/d/1SaAGlwC3LbaDVZZGcK8loaCMVHe4kmM3/view?usp=sharing)