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
          return ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: InkWell(
               onTap:() =>  gameOver ? null : () => onTapped(index),



              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xff001456),
                 borderRadius: BorderRadius.circular(20),
                 // border: Border.all(color: Colors.grey),
                ),
                child: Center(
                  child: Text(
                    "x",
                   // game.board[index],
                    style: TextStyle(color: Colors.blue, fontSize: 52),
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

  onTapped(int index) {}
  //game.playGame(index) {}
}
