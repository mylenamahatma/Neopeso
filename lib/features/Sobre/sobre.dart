import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:neopeso/common/constants/neopeso_colors.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sobre o App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Sobre(),
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}

class Sobre extends StatelessWidget {
  const Sobre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeopesoColors.white,
      appBar: AppBar(
        backgroundColor: NeopesoColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Sobre o App',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              'assets/images/simbolo1.png',
              height: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 60,
                ),
                const SizedBox(height: 16),
                const SizedBox(height: 15),
                Text(
                  'A interface do aplicativo NeoPeso foi desenvolvida pelos estudantes de graduação do curso de Designer Gráfico da Universidade Federal de Pernambuco (UFPE) Campus Caruaru, João Victor Monteiro Vieira e Jessyellen Emanuelley de Lima, sob a orientação da professora Dr. Luciana Lopes Freire. As primeiras telas na parte de desenvolvimento front-end do aplicativo foram criadas pelos alunos do curso de Engenharia de Software da Universidade de Pernambuco (UPE) Campus Garanhuns: Beatriz Leite, João Neto, Mateus Vasconcelos e Mylena Mahatma sob orientação do Professor Elisson Rocha. A interface para a previsão de LBW foi criada em colaboração com esses talentosos membros da UFPE e os estudantes de pós-graduação da UPE que fazem parte do grupo de pesquisa DOTLABBRAZIL, especificamente envolvidos no projeto de análise de desempenhos dos modelos para a predição de LBW. O resultado final é uma ferramenta robusta e intuitiva, projetada exclusivamente para profissionais de saúde.',
                  style: GoogleFonts.montserrat(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
