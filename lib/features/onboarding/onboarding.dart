import 'package:flutter/material.dart';
import 'dart:async';
import 'package:neopeso/common/constants/neopeso_colors.dart';
import 'package:neopeso/common/constants/neopeso_text_styles.dart';
import '../login.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  OnboardingState createState() => OnboardingState();
}

class OnboardingState extends State<Onboarding> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2, milliseconds: 500), () {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const Login(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
      );
    });
  }

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
              )),
          Expanded(
              child: Column(
            children: [
              Text("AI Empowered Application for",
                  style: NeopesoTextStyles.onboardingTextFont
                      .copyWith(color: NeopesoColors.green)),
              Text("Management of Neonatal Weight",
                  style: NeopesoTextStyles.onboardingTextFont
                      .copyWith(color: NeopesoColors.green))
            ],
          ))
        ],
      ),
    );
  }
}