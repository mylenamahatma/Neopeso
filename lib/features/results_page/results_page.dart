import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neopeso/features/homepage/homepage.dart';
import '../../common/constants/neopeso_colors.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  Widget _buildResultCard(BuildContext context, double screenWidth, double screenHeight) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      height: screenHeight * 0.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Esta gestação tem:',
              style: GoogleFonts.montserrat(
                fontSize: 24,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          Container(
            width: 150,  // Aumenta a largura do círculo
            height: 150, // Aumenta a altura do círculo
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: NeopesoColors.green,
                width: 4,
              ),
            ),
            child: Center(
              // Placeholder for the animation
              child: Text(
                '75%',
                style: GoogleFonts.montserrat(
                  fontSize: 36, // Aumenta o tamanho da fonte
                  fontWeight: FontWeight.bold,
                  color: NeopesoColors.green,
                ),
              ),
            ),
          ),
          const Spacer(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              'probabilidade de peso grande ao nascer',
              style: GoogleFonts.montserrat(
                fontSize: 22,
                fontWeight: FontWeight.w600
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            height: 52,
            width: 245,
            child: ElevatedButton.icon(
              onPressed: () {},
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: NeopesoColors.white,
        elevation: 1.0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text(
          'Resultados',
          style: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const Homepage()));
            },
          )
        ],
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
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Opacity(
                opacity: 0.8,
                child: Image.asset(
                  'assets/images/Group 613.png',
                  width: screenWidth - 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              const Spacer(), // Adiciona espaço flexível acima do card
              _buildResultCard(context, screenWidth, screenHeight),
              const Spacer(), // Adiciona espaço flexível abaixo do card
              _buildBottomButton(),
            ],
          ),
        ],
      ),
    );
  }
}
