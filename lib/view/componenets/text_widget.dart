import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key, required this.text, this.color = Colors.white});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 18,
        color: color,
        shadows: const [
          Shadow(
            color: Colors.black,
            offset: Offset(0, 2),
          )
        ],
      ),
    );
  }
}
