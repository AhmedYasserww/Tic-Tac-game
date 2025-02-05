
import 'dart:math';

class Player {
static const x = 'X';
static const o = 'O';
static const empty = '';
static List<int>playerX =[];
static List<int>playerO =[];
}

extension ContainsAll on List {
  bool containsAll(int x , int y , int z){
    return (contains(x) && contains(y) && contains(z));
  }
}
class Game {
  void playGame(int index, String activePlayer) {
    if(activePlayer =='X'){
     Player.playerX.add(index);
    }
    else{
      Player.playerO.add(index);
    }
  }
  checkWinner(){
    String winner = '';
    if(Player.playerX.containsAll(0,1,2)){
      return winner;
    }

  }
  Future<void> autoPlay(activePlayer)async{
    int index = 0;
    List<int>emptyCells = [];
    for(int i=0;i<9;i++){
      if(!Player.playerX.contains(i) && !Player.playerO.contains(i)){
        emptyCells.add(i);
      }
    }
    Random random = Random();
    int randomIndex = random.nextInt(emptyCells.length);
    index = emptyCells[randomIndex];
    playGame(index, activePlayer);
  }

}