import 'package:flutter/material.dart';
import 'package:neopeso/common/constants/neopeso_colors.dart';

class PopupErro extends StatelessWidget {
  final String msgErro;

  const PopupErro({super.key, required this.msgErro});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AlertDialog(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        title: Center(
          child: Text(
            msgErro,
            textAlign: TextAlign.center, // Alinha o texto centralmente
          ),
        ),
        actions: <Widget>[
          ButtonBar(
            alignment: MainAxisAlignment
                .center, // Centraliza os botões horizontalmente
            children: <Widget>[
              ElevatedButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A271),
                  padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16), // Ajuste o padding conforme necessário
                  minimumSize: Size(120, 0), // Largura mínima do botão
                ),
                child: const Text(
                  'OK',
                  style: TextStyle(
                      fontSize: 16,
                      color: NeopesoColors.white), // Tamanho do texto do botão
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
