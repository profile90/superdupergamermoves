
import processing.net.*; 



class NetworkClient {

  Client client;
  final int SERVER_BALL_X_INDEX = 0;
  final int SERVER_BALL_Y_INDEX = 1;
  final int SERVER_PADDLE_Y_INDEX = 2;
  final int SERVER_SCORE = 3;
  final int CLIENT_SCORE = 4;



  NetworkClient(Client client) {
    this.client = client;
  }

  void sendClientState() {
    if(client.active()) {
      client.write(client_player.y + ";");
    }
  }

  float[] decodeGameState(String gamestate) {
    return float(split(gamestate, ','));
  }

  void updateGameState(float[] data) {
    //println(data[SERVER_BALL_X_INDEX], data[SERVER_BALL_Y_INDEX], int(data[SERVER_SCORE]), data[SERVER_PADDLE_Y_INDEX], int(data[CLIENT_SCORE])); 
    ball.x = data[SERVER_BALL_X_INDEX];
    ball.y = data[SERVER_BALL_Y_INDEX];
    server_player.score = int(data[SERVER_SCORE]);
    server_player.y = data[SERVER_PADDLE_Y_INDEX];
    client_player.score = int(data[CLIENT_SCORE]);
  }
}
