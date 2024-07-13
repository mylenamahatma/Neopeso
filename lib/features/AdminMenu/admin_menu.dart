import 'package:flutter/material.dart';

class AdminMenu extends StatelessWidget {
  const AdminMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 16),
                  // Logo and name of Neopeso
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: 80,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'Administrador',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Funções Administrativas',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Menu de opções administrativas
                  ListTile(
                    leading: const Icon(Icons.people),
                    title: const Text('Gerenciar Usuários'),
                    onTap: () {
                      // Navegar para a tela de Gerenciar Usuários
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.bar_chart),
                    title: const Text('Relatórios'),
                    onTap: () {
                      // Navegar para a tela de Relatórios
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Configurações'),
                    onTap: () {
                      // Navegar para a tela de Configurações
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.security),
                    title: const Text('Permissões'),
                    onTap: () {
                      // Navegar para a tela de Configurações de Permissões
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.help),
                    title: const Text('Ajuda'),
                    onTap: () {
                      // Navegar para a tela de Ajuda
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text('Desconectar'),
                    onTap: () {
                      // Lógica para desconectar o usuário
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
