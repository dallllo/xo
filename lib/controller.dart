//conterler..

class Controller {


  //ConfettiController newController = ConfettiController(
  // duration:  Duration(seconds: 1),
  //);

  String currentWinner = '';
  int scoreO = 0;
  int scoreX = 0;
  int draws = 0;

  List<int> player1 = []; //player O
  List<int> player2 = []; // player X

  bool gameOver = false;
  List<int> winningSquares = [];
  late bool playerXOrO = true; //we start from plyer O
  List<String> listOfGame = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ]; 

  void winningActivites() {
    if (playerXOrO == true) {
      //O
      scoreO++;
     // newController.play();
      currentWinner = 'O';
      gameOver = true;
    }

    if (playerXOrO == false) {
      //X
      scoreX++;
    //  newController.play();
      currentWinner = 'X';
      gameOver = true;
    }
  }

  void resetGame() {
    for (int i = 0; i < listOfGame.length; i++) {
      listOfGame[i] = '';
    }
    playerXOrO = true;
    gameOver = false;
    currentWinner = '';
    winningSquares = [];
    player1 = [];
    player2 = [];
  }

  void checkWinning(List<int> list) {
    if (list.isNotEmpty) {
      if (list.contains(0) && list.contains(1) && list.contains(2)) {
        winningSquares = [0, 1, 2];
        winningActivites();
      }
      if (list.contains(3) && list.contains(4) && list.contains(5)) {
        winningSquares = [3, 4, 5];
        winningActivites();
      }
      if (list.contains(6) && list.contains(7) && list.contains(8)) {
        winningSquares = [6, 7, 8];
        winningActivites();
      }
      if (list.contains(0) && list.contains(3) && list.contains(6)) {
        winningSquares = [0, 3, 6];
        winningActivites();
      }
      if (list.contains(1) && list.contains(4) && list.contains(7)) {
        winningSquares = [1, 4, 7];
        winningActivites();
      }
      if (list.contains(2) && list.contains(5) && list.contains(8)) {
        winningSquares = [2, 5, 8];
        winningActivites();
      }
      if (list.contains(0) && list.contains(4) && list.contains(8)) {
        winningSquares = [0, 4, 8];
        winningActivites();
      }
      if (list.contains(2) && list.contains(4) && list.contains(6)) {
        winningSquares = [2, 4, 6];
        winningActivites();
      }
    }

    if (!listOfGame.contains('') && winningSquares.isEmpty) {
      draws++;
      gameOver = true;
    }

    return;
  }

  void switchBetweenXO(int index) {
    if (playerXOrO == true && listOfGame[index] == '') {
      listOfGame[index] = "O";
      player1.add(index);
      checkWinning(player1);
    } else if (listOfGame[index] == '') {
      listOfGame[index] = "X";
      player2.add(index);
      checkWinning(player2);
    }
  }
}

