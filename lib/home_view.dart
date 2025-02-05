import 'package:flutter/material.dart';

import 'logic/game_logic.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String activePlayer = 'X';
  bool gameOver = false;
  bool isSwitched = false;
  int turn = 0;
  String result ='X is Win';
  Game game = Game();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00061a),
body: SafeArea(
  child: Column(
    children: [
 SwitchListTile.adaptive(
   title: const Text("Turn on/off two player mode",style: TextStyle(color: Colors.white,
     fontSize: 20,),
     textAlign: TextAlign.center,),
     value:isSwitched,
     onChanged: (value){
  setState(() {
    isSwitched = value;
  });
 }),
      Text(
        'Player  $activePlayer  turn',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 40,
        ),
      ),
      Expanded(
          child: GridView.count(
           // childAspectRatio: 1,
              crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          padding: const EdgeInsets.all(20),
                  crossAxisCount: 3,
                  children: List.generate(9, (index) {
          return InkWell(
            // onTap:() =>  gameOver ? null : () => onTapped(index),
              onTap:() =>onTapped(index),


            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff001456),
               borderRadius: BorderRadius.circular(20),
               // border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Text(
                  Player.playerX.contains(index) ? "X" :
                  Player.playerO.contains(index) ? "0" :
                  " ",
                 // game.board[index],
                  style:
                   TextStyle(
                      color:  Player.playerX.contains(index) ? Colors.blue :
                      Colors.pink, fontSize: 52
                  ),
                ),
              ),
            ),
          );
                  }),
                )),
      Text(
        result,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 40,
        ),
        textAlign: TextAlign.center,
      ),
      MaterialButton(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)),),
        color: const Color(0xff4169e8),
        onPressed: (){
          setState(() {
            Player.playerO.clear();
            Player.playerX.clear();
             activePlayer = 'X';
             gameOver = false;
            isSwitched = false;
            turn = 0;
            result ='';
          });
        },
        child:const Text("Repeat the game",
          style: TextStyle(color: Colors.white,fontSize: 20),textAlign: TextAlign.center,),
      )
    ],
  ),
),
    );
  }

  onTapped(int index) async{

    if((Player.playerX.isEmpty || !Player.playerX.contains(index)) &&
        (Player.playerO.isEmpty || !Player.playerO.contains(index))){
      game.playGame(index, activePlayer);
      updateState();
      if(!isSwitched && !gameOver){
        await game.autoPlay(activePlayer);
        updateState();
      }

    }

  }

  void updateState() {
     setState(() {
      activePlayer = (activePlayer == 'X') ? 'O' : 'X';
    });
  }
  //game.playGame(index) {}
}
