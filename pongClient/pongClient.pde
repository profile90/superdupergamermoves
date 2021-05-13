import processing.net.*; 
Player client_player;
Player server_player;
NetworkClient network;
Ball ball;



void setup() { 

  size(1280, 720, P3D);
  background(0);
  frameRate(30);
  network = new NetworkClient(new Client(this, "127.0.0.1", 10002));

  client_player = new Player(true);
  server_player = new Player(false);
  ball = new Ball();
}

void clientEvent(Client client) {
  String input = client.readStringUntil(';');
  network.updateGameState(network.decodeGameState(input.substring(0, input.length() -1)));
} 

void draw() { 
  background(0);
  client_player.draw();
  server_player.draw();
  ball.draw();
  client_player.update(mouseY);
  network.sendClientState();
} 
