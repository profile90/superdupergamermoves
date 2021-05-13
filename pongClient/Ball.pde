class Ball {

  float x, y;
  float size;
  float radius;

  float speed;
  
  
  PVector position;
  PVector velocity;


  Ball() {
    x = width/2;
    y = height/2;
    size = 30;
    radius = size / 2;
    speed = 10;
  
    this.x = 0;
    this.y = 0;
      
  }
  
  
  

  

  void draw() {
    stroke(1);
    fill(255);
    circle(this.x, this.y, size);
  }
}
