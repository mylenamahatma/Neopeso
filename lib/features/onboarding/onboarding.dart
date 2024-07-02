import 'package:flutter/material.dart';
import 'package:neopeso/common/constants/neopeso_colors.dart';
import 'package:neopeso/common/constants/neopeso_text_styles.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: NeopesoColors.white,
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/Group 23.png",
                width: screenWidth * 0.7,
              ),
            )
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  "AI Empowered Application for",
                  style: NeopesoTextStyles.onboardingTextFont.copyWith(color: NeopesoColors.green)
                ),
                Text(
                  "Management of Neonatal Weight",
                  style: NeopesoTextStyles.onboardingTextFont.copyWith(color: NeopesoColors.green)
                )
              ],
            )
          )
        ],
      ),
    );
  }

}