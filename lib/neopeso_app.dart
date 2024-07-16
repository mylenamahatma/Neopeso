import 'package:flutter/material.dart';
import 'package:neopeso/features/paciente/cadastro_paciente.dart';
import 'package:neopeso/features/app/homepage.dart';
import 'package:neopeso/features/app/login.dart';
import 'package:neopeso/features/app/onboarding.dart';
import 'package:neopeso/features/cadastro_profissional/cadastro_profissional.dart';
import 'package:neopeso/features/prediction/personal_data_prediction.dart';

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
        '/PersonalDataPrediction': (context) => const PersonalDataPrediction(),
        '/cadastrarPaciente': (context) => const CadastroPaciente()
      },
    );
  }
}
