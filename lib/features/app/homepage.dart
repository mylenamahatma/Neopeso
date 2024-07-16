import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neopeso/common/constants/neopeso_colors.dart';
import 'package:neopeso/entities/Prediction.dart';
import 'package:neopeso/entities/patient.dart';
import 'package:neopeso/common/barra_lateral.dart';
import 'package:neopeso/features/app/sobre.dart';
import '../paciente/pacient_page.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  void _onCardTap(BuildContext context, Patient patient) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PacientPage(patient: patient),
      ),
    );
  }

  List<Widget> _buildPatientCards(BuildContext context, double screenWidth) {
    final List<Patient> patients = [
      Patient(
        name: 'Juana Pereira da Silva',
        cpf: '098-134-986-76',
        predictions: [
          Prediction(date: DateTime.now(), value: 1.0),
          Prediction(
              date: DateTime.now().add(const Duration(days: 1)), value: 2.0),
        ],
      ),
      Patient(
        name: 'Carmem Lucia Teixeira',
        cpf: '498-134-666-34',
        predictions: [
          Prediction(date: DateTime.now(), value: 3.0),
          Prediction(
              date: DateTime.now().add(const Duration(days: 1)), value: 4.0),
        ],
      ),
    ];

    List<Widget> cards = [];
    cards.add(const SizedBox(height: 16));

    for (var patient in patients) {
      cards.add(
        SizedBox(
          height: 100,
          width: screenWidth - 80,
          child: Card(
            child: InkWell(
              onTap: () => _onCardTap(context, patient),
              child: ListTile(
                title: Text(
                  patient.name,
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                subtitle: Text(
                  patient.cpf,
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      cards.add(const SizedBox(height: 16));
    }

    return cards;
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
                Navigator.pushNamed(context, '/cadastrarPaciente');
              },
              icon: const Icon(Icons.add, color: NeopesoColors.white),
              label: Text(
                'Novo(a) Paciente',
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
        title: Row(
          children: <Widget>[
            const CircleAvatar(
              radius: 17,
              backgroundImage: AssetImage('assets/images/medica.png'),
            ),
            const SizedBox(width: 8),
            Text(
              "Olá, Carla",
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.question_mark_rounded),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Sobre()));
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
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: _buildPatientCards(context, screenWidth),
                ),
              ),
              _buildBottomButton(context),
            ],
          ),
        ],
      ),
    );
  }
}
