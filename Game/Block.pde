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
    rect(x - (size / 2.0), y - (size / 2.0), size, size);
  }
  
  void setColor(int c) {
    this.c = c;
  }

  
  void move(int dx, int dy) {
    x += dx * size;
    y += dy * size;
  }
  
  Block copy() {
    return new Block(x, y, size, c);
  }
}
