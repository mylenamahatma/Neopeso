import 'package:flutter/material.dart';

class BarraLateral extends StatelessWidget {
  const BarraLateral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        toolbarHeight: 100.0,
      ),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.65,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: const Text(
                "Carla",
                style: TextStyle(
                  color: Colors.black, // Mudando a cor do texto para preto
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              accountEmail: const Text(
                "Enfermeira Obstétrica",
                style: TextStyle(
                  color: Colors.black, // Mudando a cor do texto para preto
                  fontSize: 14.0,
                ),
              ),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: AssetImage(
                    'assets/images/medica.png'), // Coloque a imagem correta aqui
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Sobre o App'),
              onTap: () {
                // Navegar para a página de Sobre o App
              },
            ),
            ListTile(
              leading: const Icon(Icons.group),
              title: const Text('Equipe'),
              onTap: () {
                // Navegar para a página da Equipe
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Colaboradores'),
              onTap: () {
                // Navegar para a página de Colaboradores
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Configurações'),
              onTap: () {
                // Navegar para a página de Configurações
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Ajuda'),
              onTap: () {
                // Navegar para a página de Ajuda
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Desconectar'),
              onTap: () {
                // Lógica para desconectar
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Tela Principal'),
      ),
    );
  }
}
