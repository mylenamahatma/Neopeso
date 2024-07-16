import 'package:flutter/material.dart';

class BarraLateral extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const BarraLateral({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.65,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text(
              "Carla",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              "Enfermeira Obstétrica",
              style: TextStyle(
                color: Colors.black,
                fontSize: 14.0,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/medica.png'),
            ),
            decoration: BoxDecoration(
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
              Navigator.pushNamed(context, '/login');
            },
          ),
        ],
      ),
    );
  }
}
