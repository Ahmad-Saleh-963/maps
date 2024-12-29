import 'package:flutter/material.dart';
import 'package:sport/library/utils/colors.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsApp.yalow,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: ColorsApp.border, width: 2),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
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
                      color: Colors.blue[900],
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "No fuss, no ads, for only 5 TL a year",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            // حشوة النص في المربع
            decoration: BoxDecoration(
              color: Colors.teal, // لون الخلفية
              borderRadius: BorderRadius.circular(8), // زوايا مستديرة
            ),
            child: const Text(
              "TL 5", // النص داخل المربع
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
