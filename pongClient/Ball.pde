
/*

  Client ball, only draws the ball

*/
class Ball {

  float x, y;
  float size;

  float speed;

  Ball() {
    x = width/2;
    y = height/2;
    size = 30;
    speed = 2;
  }

  void draw() {
 
    circle(x, y, size);
  }

}
