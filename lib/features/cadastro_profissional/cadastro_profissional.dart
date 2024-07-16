import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:neopeso/common/barra_tela_inicial.dart';
import 'package:neopeso/common/constants/neopeso_colors.dart';

class CadastroProfissional extends StatelessWidget {
  const CadastroProfissional({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: NeopesoColors.white,
      body: FormCadastroProfissional(),
    );
  }
}

class FormCadastroProfissional extends StatefulWidget {
  const FormCadastroProfissional({super.key});

  @override
  State<FormCadastroProfissional> createState() =>
      _FormCadastroProfissionalState();
}

class _FormCadastroProfissionalState extends State<FormCadastroProfissional> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  String? msgErro;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _registerProfessional() {
    if (_formKey.currentState!.validate()) {
      print("Name: ${_nameController.text}");
      print("Email: ${_emailController.text}");
      print("Password: ${_passwordController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BarraTelaInicial(),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text(
                          'Nome',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: 'Digite seu nome',
                            contentPadding: const EdgeInsets.all(10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira o nome completo';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'E-mail',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Digite seu e-mail',
                            contentPadding: const EdgeInsets.all(10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira o endereço de email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'Senha',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: 'Digite sua senha',
                            contentPadding: const EdgeInsets.all(10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                          ),
                          obscureText: _obscurePassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, crie uma senha';
                            }
                            if (value.length < 6) {
                              return 'A senha deve ter pelo menos 6 caracteres';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 16.0),
                        const Text(
                          'Confirmar senha',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        TextFormField(
                          controller: _confirmPasswordController,
                          decoration: InputDecoration(
                            hintText: 'Confirme sua senha',
                            contentPadding: const EdgeInsets.all(10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _obscureConfirmPassword =
                                      !_obscureConfirmPassword;
                                });
                              },
                            ),
                          ),
                          obscureText: _obscureConfirmPassword,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, confirme a senha';
                            }
                            if (value != _passwordController.text) {
                              return 'As senhas não coincidem';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24.0),
                        SizedBox(
                          child: ElevatedButton(
                            onPressed: _registerProfessional,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: NeopesoColors.green,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32.0,
                                vertical: 16.0,
                              ),
                              elevation: 4,
                              minimumSize: const Size(double.infinity, 55),
                            ),
                            child: const Text(
                              'Entrar',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        const Divider(),
                        const SizedBox(height: 12.0),
                        const Center(
                          child: Text(
                            'Ou cadastre-se com:',
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32.0, vertical: 16.0),
                                  elevation: 4,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/images/logo_google.png',
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32.0, vertical: 16.0),
                                  elevation: 4,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/images/logo_apple.png',
                                      height: 30,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
