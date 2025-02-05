import 'package:flutter/material.dart';

class GameControls extends StatelessWidget {
  final bool isSwitched;
  final Function(bool) onSwitchChanged;

  const GameControls({super.key, required this.isSwitched, required this.onSwitchChanged});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      title: const Text(
        "Turn on/off two-player mode",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
      value: isSwitched,
      onChanged: onSwitchChanged,
    );
  }
}
