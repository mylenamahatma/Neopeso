import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:neopeso/common/constants/neopeso_colors.dart';
import 'package:neopeso/entities/patient.dart';

class PacientPage extends StatelessWidget {
  final Patient patient;

  const PacientPage({super.key, required this.patient});

  String _formatDate(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }

  List<Widget> _buildPredictionsCards(BuildContext context, double screenWidth) {
    List<Widget> cards = [];
    cards.add(const SizedBox(height: 16)); // Espaço inicial entre a AppBar e os cards

    for (var prediction in patient.predictions) {
      cards.add(
        SizedBox(
          height: 100,
          width: screenWidth - 80,
          child: Card(
            child: ListTile(
              title: Text(
                'Data: ${_formatDate(prediction.date)}',
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              subtitle: Text(
                'Valor: ${prediction.value}',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      );
      cards.add(const SizedBox(height: 16)); // Espaço entre os cards
    }

    return cards;
  }

  Widget _buildBottomButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 32),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 52,
            width: 280,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/PersonalDataPrediction');
              },
              icon: const Icon(Icons.add, color: NeopesoColors.white),
              label: Text(
                'Nova Predição',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ).copyWith(
                  color: NeopesoColors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: NeopesoColors.green,
              ),
            ),
          ),
          const SizedBox(height: 16), // Espaço entre os botões
          SizedBox(
            height: 52,
            width: 280,
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.analytics_outlined, color: NeopesoColors.white),
              label: Text(
                'Comparar Predições',
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ).copyWith(
                  color: NeopesoColors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: NeopesoColors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(patient.name),
        backgroundColor: Theme.of(context).cardColor,
        elevation: 1.0,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  NeopesoColors.white,
                  NeopesoColors.lightGreen,
                ],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: _buildPredictionsCards(context, screenWidth),
                ),
              ),
              _buildBottomButtons(context),
            ],
          ),
        ],
      ),
    );
  }
}
