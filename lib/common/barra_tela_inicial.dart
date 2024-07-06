import 'package:flutter/material.dart';
import 'package:neopeso/common/constants/neopeso_colors.dart';

class BarraTelaInicial extends StatelessWidget {
  const BarraTelaInicial({super.key});

  @override
  Widget build(BuildContext context) {
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
                backgroundColor: Colors.lightBlueAccent,
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                minimumSize: Size(MediaQuery.of(context).size.width * 0.3, 0),
                elevation: 4
              ),
              onPressed: () {},
              child: const Text(
                'Acesso',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
            OutlinedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: NeopesoColors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                minimumSize: Size(MediaQuery.of(context).size.width * 0.3, 0),
                side: const BorderSide(width: 1.0, color: Colors.black)
              ),
              onPressed: () {},
              child: const Text(
                'Cadastro',
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ],
        ),
        const SizedBox(height: 40.0),
      ],
    );
  }
}
