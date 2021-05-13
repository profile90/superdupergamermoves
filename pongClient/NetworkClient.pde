
import processing.net.*; 



class NetworkClient {

  
  Client client;
  final int SERVER_BALL_X_INDEX = 0;
  final int SERVER_BALL_Y_INDEX = 1;
  final int SERVER_PADDLE_Y_INDEX = 2;
  final int SERVER_SCORE = 3;
  final int CLIENT_SCORE = 4;
  final int SERVER_STATE = 5;

  int state = 0;


  NetworkClient(Client client) {
    this.client = client;
  }
  
  void nextState() {
    state++;    
    if(this.state >= 3) {
       state = 0;
    }    
  }
  

  void sendClientState() {
    if(client.active()) {
      client.write(clientPlayer.y + ";");
    }
  }

  float[] decodeGameState(String gamestate) {
    return float(split(gamestate, ','));
  }
  


  void updateGameState(float[] data) {
    //println(data[SERVER_BALL_X_INDEX], data[SERVER_BALL_Y_INDEX], int(data[SERVER_SCORE]), data[SERVER_PADDLE_Y_INDEX], int(data[CLIENT_SCORE])); 
    ball.x = data[SERVER_BALL_X_INDEX];
    ball.y = data[SERVER_BALL_Y_INDEX];
    serverPlayer.score = int(data[SERVER_SCORE]);
    serverPlayer.y = data[SERVER_PADDLE_Y_INDEX];
    clientPlayer.score = int(data[CLIENT_SCORE]);
  }
 
 void drawScore() {
     textSize(32);
     textAlign(CENTER);
     text(serverPlayer.score + " : " + clientPlayer.score, width/2, height/8);

   }
  
}
