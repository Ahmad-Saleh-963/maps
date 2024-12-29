import 'package:flutter/material.dart';

class ImageCircleComponent extends StatelessWidget {
  final String placeholder;
  final double radius;

  const ImageCircleComponent({
    super.key,
    required this.radius,
    this.placeholder = 'assets/images/person.png',
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        placeholder,
        height: radius * 2,
        width: radius * 2,
        fit: BoxFit.cover,
      ),
    );
  }
}
