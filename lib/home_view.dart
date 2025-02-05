import 'package:flutter/material.dart';
import 'package:tic_tac_game/logic/game_logic.dart';
import 'package:tic_tac_game/widgets/game_board.dart';
import 'package:tic_tac_game/widgets/game_controls.dart';
import 'package:tic_tac_game/widgets/player_info.dart';

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
  String result = '';
  Game game = Game();

  void resetGame() {
    setState(() {
      Player.playerO.clear();
      Player.playerX.clear();
      activePlayer = 'X';
      gameOver = false;
      isSwitched = false;
      turn = 0;
      result = '';
    });
  }

  void onTapped(int index) async {
    if ((Player.playerX.isEmpty || !Player.playerX.contains(index)) &&
        (Player.playerO.isEmpty || !Player.playerO.contains(index))) {
      game.playGame(index, activePlayer);
      updateState();
      if (!isSwitched && !gameOver && turn != 9) {
        await game.autoPlay(activePlayer);
        updateState();
      }
    }
  }

  void updateState() {
    setState(() {
      activePlayer = (activePlayer == 'X') ? 'O' : 'X';
      turn++;
      String winnerPlayer = game.checkWinner();
      if (winnerPlayer != '') {
        gameOver = true;
        result = "$winnerPlayer is The Winner";
      } else if (!gameOver && turn == 9) {
        result = "It's a Draw";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00061a),
      body: SafeArea(
        child: Column(
          children: [
            ...firstBlock(),
            const SizedBox(height: 30,),
            GameBoard(onTapped: onTapped),
            ...lastBlock(),
          ],
        ),
      ),
    );
  }

  List <Widget> firstBlock() {
    return [
      GameControls(
        isSwitched: isSwitched,
        onSwitchChanged: (value) => setState(() => isSwitched = value),
      ),
      PlayerInfo(activePlayer: activePlayer),
    ];
  }

  List <Widget> lastBlock() {
    return [
      Text(
        result,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 40,
        ),
        textAlign: TextAlign.center,
      ),
      ElevatedButton(
        onPressed: resetGame,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff4169e8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Text(
          "Repeat the game",
          style: TextStyle(color: Colors.white, fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    ];
  }
}
