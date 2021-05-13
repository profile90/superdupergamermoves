

class Player {

  float x, y; 
  float y_off;
  float x_off;
  boolean client;
  int score = 0;
 
  Player(boolean client) {
    this.client = client;
    
    x = width/4;     
   
    if(this.client) 
    {
      x += width/2;    
    }    

    y_off = 120;
    x_off = 5;
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
    strokeWeight(10);
    stroke(101, 12, 45);
    line(this.x, this.y, this.x, this.y + y_off);
  }
  
  void draw() {
    strokeWeight(3);
    stroke(255);
    line(this.x, this.y, this.x, this.y + y_off);
    
  }

}
