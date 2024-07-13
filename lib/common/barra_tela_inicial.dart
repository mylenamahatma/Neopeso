import 'package:flutter/material.dart';
import 'package:neopeso/common/constants/neopeso_colors.dart';

class BarraTelaInicial extends StatelessWidget {
  const BarraTelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;

    bool isCadastroRoute = currentRoute == '/cadastroProfissional';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/logo.png"),
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 32.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isCadastroRoute ? NeopesoColors.white : Colors.lightBlueAccent,
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                minimumSize: Size(MediaQuery.of(context).size.width * 0.3, 0),
                elevation: 4,
                side: isCadastroRoute ? const BorderSide(width: 1.0, color: Colors.black) :  BorderSide.none,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text(
                'Acesso',
                style: TextStyle(
                  color: isCadastroRoute ? Colors.black : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            OutlinedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: isCadastroRoute ? Colors.lightBlueAccent : NeopesoColors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                minimumSize: Size(MediaQuery.of(context).size.width * 0.3, 0),
                side: isCadastroRoute ? BorderSide.none : const BorderSide(width: 1.0, color: Colors.black),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/cadastroProfissional');
              },
              child: Text(
                'Cadastro',
                style: TextStyle(
                  color: isCadastroRoute ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40.0),
      ],
    );
  }
}
