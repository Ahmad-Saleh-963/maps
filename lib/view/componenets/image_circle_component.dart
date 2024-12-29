import 'package:flutter/material.dart';

class ImageCircleComponent extends StatelessWidget {
  final String placeholder;

  const ImageCircleComponent({
    super.key,
    this.placeholder = 'assets/images/person.png',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(placeholder),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
