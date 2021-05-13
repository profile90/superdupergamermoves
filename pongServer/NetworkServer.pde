
class NetworkServer {

  int messageNumber = 0;
  final int CLIENT_Y = 0;
  int state;
  
  Server server;
  Client client;
  
  NetworkServer(Server server) {
    this.server = server;
  }
  
  void sendServerState() {
    server.write(ball.x + "," + ball.y + "," + serverPlayer.y  + "," + serverPlayer.score + "," + clientPlayer.score + ";"); 
  }
  
  void nextState() {
    state++;    
    if(this.state >= 3) {
       state = 0;
    }    
  }
  
  
  void getNextMessage() {
    client = server.available();
    if (client != null) {
      String input = client.readStringUntil(';');
      this.updateGameState(decodeGameState(input.substring(0, input.length() -1)));
    }
  }
  
  float[] decodeGameState(String gamestate) {
    return float(split(gamestate, ',')); 
  }

  void drawScore() {
    textSize(32);
    textAlign(CENTER);
    text(serverPlayer.score + ":" + clientPlayer.score, width/2, height/2);
  }
  
  
  private void updateGameState(float[] data) {
    clientPlayer.update(data[CLIENT_Y]);
  }
   

}
