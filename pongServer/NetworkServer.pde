



/*
  Expects: 
  
  client_x,client_y;


*/

class NetworkServer {

  int messageNumber = 0;
  final int CLIENT_Y = 0;
  Server server;
  Client client;
  
  NetworkServer(Server server) {
    this.server = server;
  }
  
  void sendServerState() {
    server.write(ball.x + "," + ball.y + "," + serverPlayer.y  + "," + serverPlayer.score + "," + clientPlayer.score + ";"); 
  }
  
  void clientScored() {
    clientPlayer.score++;
  }
  void server_scored() {
    serverPlayer.score++;
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
  
  
  private void updateGameState(float[] data) {
    
    clientPlayer.update(data[CLIENT_Y]);
  }
   

}
