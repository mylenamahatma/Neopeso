import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:neopeso/common/barra_tela_inicial.dart';
import 'package:neopeso/common/constants/neopeso_colors.dart';
import 'package:neopeso/common/popup_erro.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: NeopesoColors.white,
      body: FormLogin(),
    );
  }
}

class FormLogin extends StatefulWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? msgErro;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
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
                          'E-mail',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        TextFormField(
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(height: 0),
                            hintText: 'Digite seu email',
                            contentPadding: const EdgeInsets.all(10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "";
                            }
                            if (!EmailValidator.validate(value.toString())) {
                              msgErro = "E-mail inválido.";
                              return "";
                            }
                            msgErro == null;
                            return null;
                          },
                        ),
                        const SizedBox(height: 24.0),
                        const Text(
                          'Senha',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        TextFormField(
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(height: 0),
                            hintText: 'Digite sua senha',
                            contentPadding: const EdgeInsets.all(10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                          ),
                          obscureText: _obscureText, // Define se a senha está obscurecida ou não
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "";
                            } else {
                              if (value != "1234") {
                                msgErro = "Senha inválida.";
                                return "";
                              }
                            }
                            msgErro = null;
                            return null;
                          },
                        ),
                        const SizedBox(height: 12.0),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Esqueci minha senha',
                            style: TextStyle(
                              fontSize: 15.0,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: NeopesoColors.green,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32.0, vertical: 16.0),
                            minimumSize: const Size(double.infinity, 55),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushNamed(context, '/home');
                            } else {
                              if (msgErro != null) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) => PopupErro(
                                    msgErro: msgErro!,
                                  ),
                                );
                              }
                            }
                          },
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                            ),
                          ),
                        const SizedBox(height: 24),
                        const Divider(),
                        const SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32.0, vertical: 16.0),
                            minimumSize: const Size(double.infinity, 55),
                            elevation: 4,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "Acesse com o Google",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              const SizedBox(width: 12),
                              Image.asset(
                                'assets/images/logo_google.png',
                                height: 30,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32.0, vertical: 16.0),
                            minimumSize: const Size(double.infinity, 55),
                            elevation: 4,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                "Acesse com o Apple ID",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              const SizedBox(width: 12),
                              Image.asset(
                                'assets/images/logo_apple.png',
                                height: 30,
                              ),
                            ],
                          ),
                        ),
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
