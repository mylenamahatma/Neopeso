import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neopeso/common/constants/neopeso_colors.dart';
import 'package:neopeso/common/barra_lateral.dart';
import 'package:neopeso/features/app/homepage.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  Widget _buildResultCard(
      BuildContext context, double screenWidth, double screenHeight) {
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
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: NeopesoColors.green,
                width: 4,
              ),
            ),
            child: Center(
              child: Text(
                '75%',
                style: GoogleFonts.montserrat(
                  fontSize: 36,
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
                  fontSize: 22, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            height: 52,
            width: 245,
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: NeopesoColors.white,
        elevation: 1.0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
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
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Homepage()));
            },
          )
        ],
      ),
      drawer: BarraLateral(scaffoldKey: _scaffoldKey),
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
              const Spacer(),
              _buildResultCard(context, screenWidth, screenHeight),
              const Spacer(),
              _buildBottomButton(context),
            ],
          ),
        ],
      ),
    );
  }
}
