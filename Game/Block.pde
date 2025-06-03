class Block {
  int x, y, size, c;
  boolean highlight;      

  Block(int x, int y, int size, color c) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.c = c;
    this.highlight = false;
  }
  
  void drawBlock() {
    strokeWeight(1);
    int strokeC = 50;
    // if (x / size == 10) strokeWeight(10);
    if (highlight) strokeC = color(150, 150, 150);
    else if (x / size >= 10) strokeC = color(181, 181, 181);
    fill(c);
    stroke(strokeC);  
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
  
  void setHighlight(boolean value) {
    this.highlight = value;
  }
}
