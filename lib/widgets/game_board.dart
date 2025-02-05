import 'package:flutter/material.dart';
import 'package:tic_tac_game/logic/game_logic.dart';

class GameBoard extends StatelessWidget {
  final Function(int) onTapped;

  const GameBoard({super.key, required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.count(
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        padding: const EdgeInsets.all(20),
        crossAxisCount: 3,
        children: List.generate(9, (index) {
          return InkWell(
            onTap: () => onTapped(index),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xff001456),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  Player.playerX.contains(index)
                      ? "X"
                      : Player.playerO.contains(index)
                      ? "O"
                      : " ",
                  style: TextStyle(
                    color: Player.playerX.contains(index)
                        ? Colors.blue
                        : Colors.pink,
                    fontSize: 52,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
