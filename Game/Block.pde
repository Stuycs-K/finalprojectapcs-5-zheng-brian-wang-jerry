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

    if (highlight) { // thicker outline for tetro
      strokeWeight(3);
      strokeC = color(210, 210, 210);
    }
    else {

      if (c != 0) {
        float r = red(c);
        float g = green(c);
        float b = blue(c);

        r *= (1.0 / 1.5); // darker shade as outline for all tetro
        g *= (1.0 / 1.5);
        b *= (1.0 / 1.5); 

        strokeC = color(r, g, b);
      }

      if (x / size >= endingX) {
        if (c != 0) {
          strokeWeight(3);
        }
        else strokeC = c;
      }
    }

    fill(c);
    stroke(strokeC);  
    rect(x - (size / 2.0), y - (size / 2.0), size, size);
  }
  
  void setColor(int c) {
    this.c = c;
  }

  void move(int dx, int dy) { // dx and dy are in pixels
    x += dx;
    y += dy;
  }

  void moveTo(int x, int y) { // x and y are in blockLength units
    this.x = x*size;
    this.y = y*size;
  }
  
  Block copy() {
    return new Block(x, y, size, c);
  }
  
  void setHighlight(boolean value) {
    this.highlight = value;
  }
  
}
