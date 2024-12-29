import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sport/library/utils/colors.dart';

class EmptyComponent extends StatefulWidget {
  const EmptyComponent(
      {super.key, this.width = 100, this.height = 100, this.title,this.flex = 1});

  final double height;
  final double width;
  final String? title;
  final int flex;

  @override
  State<EmptyComponent> createState() => _EmptyComponentState();
}

class _EmptyComponentState extends State<EmptyComponent> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset(
            "assets/lottie/empty.json",
            height: widget.height,
            width: widget.width,
          ),
          if (widget.title != null)
            Text(
              widget.title ?? '',
              style: TextStyle(
                color: ColorsApp.primaryColor,
              ),
            ),
        ],
      ),
    );
  }
}
