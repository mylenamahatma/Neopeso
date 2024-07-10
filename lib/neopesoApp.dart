import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'features/patient/cadastro_paciente_dados_pessoais.dart';
import 'features/patient/cadastro_paciente_gestacao.dart';
import 'features/patient/cadastro_paciente_informacoes_partos.dart';


void main() {
  runApp(
  DevicePreview(enabled: true, builder: (context) => const NeopesoApp()));
}

class NeopesoApp extends StatelessWidget {
  const NeopesoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Paciente',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CadastroPacienteDadosPessoais(),
      routes: {
        '/cadastro_paciente_1': (context) => const CadastroPacienteDadosPessoais(),
        '/cadastro_paciente_2': (context) => const CadastroPacienteGestacaoDados(),
        '/cadastro_paciente_3': (context) => const CadastroPacientePartosDados(),
      },
    );
  }
}
