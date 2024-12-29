import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingComponent extends StatefulWidget {
  const LoadingComponent({super.key, this.width = 80, this.height = 80,this.flex = 1});

  final double height;
  final double width;
  final int flex;

  @override
  State<LoadingComponent> createState() => _LoadingComponentState();
}

class _LoadingComponentState extends State<LoadingComponent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: Center(
        child: Lottie.asset(
          "assets/lottie/loading.json",
          height: widget.height,
          width: widget.width,
        ),
      ),
    );
  }
}
