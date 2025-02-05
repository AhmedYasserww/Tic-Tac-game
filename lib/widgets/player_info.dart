import 'package:flutter/material.dart';

class PlayerInfo extends StatelessWidget {
  final String activePlayer;

  const PlayerInfo({super.key, required this.activePlayer});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Player  $activePlayer  turn',
      style: const TextStyle(
        color: Colors.white,
        fontSize: 40,
      ),
    );
  }
}
