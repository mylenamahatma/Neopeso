import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neopeso/common/constants/neopeso_colors.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  void _onCardTap(BuildContext context, String cardTitle) {
    // Navegar para a página do paciente (será implementada futuramente)
    // Navigator.push(context, MaterialPageRoute(builder: (context) => PacientePage(cardTitle)));
  }

  List<Widget> _buildPatientCards(BuildContext context, double screenWidth) {
    // Exemplo de lista de pacientes, que virá depois pelo banco
    final List<Map<String, String>> patients = [
      {'title': 'Juana Pereira da Silva', 'subtitle': '098-134-986-76'},
      {'title': 'Carmem Lucia Teixeira', 'subtitle': '498-134-666-34'},
    ];

    List<Widget> cards = [];
    cards.add(const SizedBox(height: 16)); // Espaço inicial entre a AppBar e os cards

    for (var patient in patients) {
      cards.add(
        SizedBox(
          height: 100,
          width: screenWidth - 80,
          child: Card(
            child: InkWell(
              onTap: () => _onCardTap(context, patient['title']!),
              child: ListTile(
                title: Text(
                  patient['title']!,
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                subtitle: Text(
                  patient['subtitle']!,
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
      cards.add(const SizedBox(height: 16)); // Espaço entre os cards
    }

    return cards;
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

    return Scaffold(
      appBar: AppBar(
        backgroundColor: NeopesoColors.white,
        elevation: 1.0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
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
            onPressed: () {},
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
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: _buildPatientCards(context, screenWidth),
                ),
              ),
              _buildBottomButton(),
            ],
          ),
        ],
      ),
    );
  }
}