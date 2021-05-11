import processing.net.*;

int port = 10002;       


Player client_player;
Player server_player;

Ball ball;
NetworkServer network; 


void setup()
{
  size(1280, 720, P3D);
  background(0);
  frameRate(10);
  Server server = new Server(this, port);

  client_player = new Player(true);
  server_player = new Player(false);
  ball = new Ball();
  network = new NetworkServer(server);

}



void draw()
{
  background(0);
  client_player.draw();
  server_player.draw();

  server_player.update(mouseY);


  network.getNextMessage();
  network.sendServerState();


}
