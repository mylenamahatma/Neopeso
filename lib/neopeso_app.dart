import 'package:flutter/material.dart';
import 'package:neopeso/features/login.dart';
import 'package:neopeso/features/onboarding/onboarding.dart';
import 'package:neopeso/features/CadastroProfissional/CadastroProfissional.dart';

class NeopesoApp extends StatelessWidget {
  const NeopesoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Onboarding(),
        '/cadastroProfissional': (context) => const CadastroProfissional(),
        '/login': (context) => const Login()
      },
    );
  }
}
