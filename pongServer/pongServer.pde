import processing.net.*;

int port = 10002;       


Player clientPlayer;
Player serverPlayer;

Ball ball;
NetworkServer network; 


void setup()
{
  size(1280, 720, P3D);
  background(0);
  frameRate(30);
  Server server = new Server(this, port);

  clientPlayer = new Player(true);
  serverPlayer = new Player(false);
  ball = new Ball();
  network = new NetworkServer(server);

}


void draw()
{
  
  ball.move();
  
  ball.hasHit(serverPlayer, clientPlayer);
  
  
  switch(network.state) {
    case 0: // Samuel
      background(0);
      clientPlayer.draw();
      serverPlayer.draw();
      ball.draw();
      break;
    case 1: // Axel
      background(22, 11, 0);
      clientPlayer.draw2();
      serverPlayer.draw2();
      ball.draw2();
      break;
    case 2: // Leo
      background(171, 219, 250);
      clientPlayer.draw3();
      serverPlayer.draw3();
      ball.draw3();
      break;
  }
  
  network.drawScore();
  serverPlayer.update(mouseY);


  network.getNextMessage();
  network.sendServerState();


}


void keyPressed() {
  
  if(keyCode == ' ') {
    network.nextState();
  }
  
}
