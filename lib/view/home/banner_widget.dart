import 'package:flutter/material.dart';
import 'package:sport/library/utils/colors.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorsApp.yalow,
            border: Border.all(color: ColorsApp.border, width: 2),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Row(
            children: [
              Image.asset("assets/images/winner.png", width: 40),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Go Pro (No Ads)",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorsApp.buttons,
                      shadows: const [
                        Shadow(
                          color: Colors.white,
                          offset: Offset(0, 1),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                    Text(
                    "No fuss, no ads, for only 5 TL a year",
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorsApp.buttons,
                      shadows:  [
                        Shadow(
                          color: Colors.white,
                          offset: Offset(0, 1),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              height: 75,
              color: ColorsApp.primaryColor,
              child: const Center(
                child: Text(
                  "TL 5",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
        ),
      ],
    );
  }
}
