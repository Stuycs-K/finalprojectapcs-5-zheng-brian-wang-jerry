class Block {
  int x, y, size, c;       

  Block(int x, int y, int size, color c) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.c = c;
  }
  
  void drawBlock() {
    fill(c);
    stroke(50);  
    rect(x * size, y * size, size, size);
  }

  
  void move(int dx, int dy) {
    x += dx;
    y += dy;
  }

  
  Block copy() {
    return new Block(x, y, size, c);
  }
}
