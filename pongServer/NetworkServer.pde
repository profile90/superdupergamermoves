



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
    server.write(ball.x + "," + ball.y + "," + server_player.y  + "," + server_player.score + "," + client_player.score + ";"); 
  }
  
  void clientScored() {
    client_player.score++;
  }
  void server_scored() {
    server_player.score++;
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
    
    client_player.update(data[CLIENT_Y]);
  }
   

}
