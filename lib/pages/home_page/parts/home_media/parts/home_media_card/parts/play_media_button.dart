import 'package:flutter/material.dart';

class PlayMediaButton extends StatelessWidget {
  const PlayMediaButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.black38,
      child: Icon(Icons.play_arrow, size: 16, color: Colors.white),
    );
  }
}
