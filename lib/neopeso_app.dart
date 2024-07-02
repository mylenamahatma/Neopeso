import 'package:flutter/material.dart';
import 'package:neopeso/features/onboarding/onboarding.dart';

class NeopesoApp extends StatelessWidget {
  const NeopesoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Onboarding(),
    );
  }
}