class Ball {

  float x, y;
  float size;
  float radius;

  
  Ball() {
    x = width/2;
    y = height/2;
    size = 30;
  
    this.x = 0;
    this.y = 0;
      
  }
  
  void draw3() {
    stroke(1);
    fill(250, 113, 255);
    circle(this.x, this.y, size);
  }
  
  
  void draw2() {
    stroke(1);
    fill(112, 0, 245);
    circle(this.x, this.y, size);
  }

  void draw() {
    stroke(1);
    fill(255);
    circle(this.x, this.y, size);
  }
}
