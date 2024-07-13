import 'package:flutter/material.dart';
import 'package:neopeso/features/homepage/homepage.dart';
import 'package:neopeso/features/login.dart';
import 'package:neopeso/features/onboarding/onboarding.dart';
import 'package:neopeso/features/CadastroProfissional/cadastro_profissional.dart';
import 'package:neopeso/features/prediction_form/personal_data_prediction.dart';


class NeopesoApp extends StatelessWidget {
  const NeopesoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const Onboarding(),
        '/cadastroProfissional': (context) => const CadastroProfissional(),
        '/login': (context) => const Login(),
        '/home': (context) => const Homepage(),
        '/PersonalDataPrediction': (context) => const PersonalDataPrediction()
      },
    );
  }
}
