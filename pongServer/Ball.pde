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
  
    position = new PVector(width/2, height/2);
    this.x = position.x;
    this.y = position.y;
  
    velocity = PVector.random2D();
    velocity.mult(speed);
    
  }
  

  
  void move() {
    
    if(position.x + radius > width || (position.x + radius < 0)) {
       if(position.x < width/2) 
       {
         
         clientPlayer.score++;
       }
       else
       {
         serverPlayer.score++;
       }
       ball.position.set(width/2, height/2);
       velocity.x *= -1;
    }
    
    if(position.y + radius > height || position.y + radius < 0) {
      velocity.y *= -1;
    } 
    
    position.add(velocity);
    
    this.x = position.x;
    this.y = position.y;
    
  }
  
  void draw3() {
    stroke(1);
    fill(250, 113, 255);
    circle(position.x, position.y, size);
  }
  
  void draw2() {
    stroke(1);
    fill(200, 0, 110);
    circle(position.x, position.y, size);
  }  
  
  void draw() {
    stroke(1);
    fill(255);
    circle(position.x, position.y, size);
  }

  void hasHit(Player ps, Player pc) {
    if((position.x > ps.x - radius) && (position.x < ps.x + radius) && (position.y + radius > ps.y && position.y < ps.y + ps.y_off)) {
      velocity.x *= -1;
      
    }
    
    if((position.x > pc.x - radius) && (position.x < pc.x + radius) && (position.y + radius > pc.y && position.y < pc.y + pc.y_off)) {
      velocity.x *= -1;
    }
  }   
}
