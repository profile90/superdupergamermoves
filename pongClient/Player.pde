

class Player {

  float x, y; 
  float y_off;
  int score;
 
  Player(boolean client) {
  
   
    x = width/4;     
   
    if(client) 
    {
      x += width/2;    
    }    

    y_off = 120; 
    y = height/2 - (y_off / 2);    

  }
  
 
  void update(float y) {
    this.y = y;
  }
  
  void draw3() {
    strokeWeight(4);
    stroke(250, 113, 255);
    line(this.x, this.y, this.x, this.y + y_off);
  }
  
  
  void draw2() {
    strokeWeight(15);
    stroke(255, 0, 123);
    line(this.x, this.y, this.x, this.y + y_off);
  }
  
  void draw() {
    strokeWeight(3);
    stroke(255);
    line(this.x, this.y, this.x, this.y + y_off);
  }

}
