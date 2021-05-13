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
  
  background(0);
  clientPlayer.draw();
  serverPlayer.draw();
  ball.draw();
  serverPlayer.update(mouseY);


  network.getNextMessage();
  network.sendServerState();


}
