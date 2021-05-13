import processing.net.*; 
Player clientPlayer;
Player serverPlayer;
NetworkClient network;
Ball ball;



void setup() { 

  size(1280, 720, P3D);
  background(0);
  frameRate(30);
  network = new NetworkClient(new Client(this, "127.0.0.1", 10002));

  clientPlayer = new Player(true);
  serverPlayer = new Player(false);
  ball = new Ball();
}

void clientEvent(Client client) {
  String input = client.readStringUntil(';');
  network.updateGameState(network.decodeGameState(input.substring(0, input.length() -1)));
} 

void draw() { 
  
  switch(network.state) {
    case 1: // Axel
      background(0, 0, 66);
      clientPlayer.draw2();
      serverPlayer.draw2();
      ball.draw2();
      break;
    case 2: // Leo
      background(22, 11, 0);
      clientPlayer.draw3();
      serverPlayer.draw3();
      ball.draw3();
      break;
    case 0: // Samuel
    default:
      background(0);
      clientPlayer.draw();
      serverPlayer.draw();
      ball.draw();
      break;
  }
  
  network.drawScore();
  clientPlayer.update(mouseY);
  network.sendClientState();
} 

void keyPressed() {
  
  if(keyCode == ' ') {
    network.nextState();
  }
  
}
