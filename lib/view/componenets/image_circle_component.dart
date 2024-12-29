import 'package:flutter/material.dart';

class ImageCircleComponent extends StatelessWidget {
  final String placeholder;

  const ImageCircleComponent({
    super.key,
    this.placeholder = 'assets/images/person.png',
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.asset(
        placeholder,
        fit: BoxFit.cover,
      ),
    );
  }
}
