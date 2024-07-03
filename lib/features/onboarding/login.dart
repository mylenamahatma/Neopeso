import 'package:flutter/material.dart';
import 'package:neopeso/common/constants/neopeso_colors.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NeopesoColors.white,
      body: FormLogin()
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        padding: EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 50,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/logo.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            SizedBox(height: 32.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.3, 0),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Acesso',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                    minimumSize: Size(MediaQuery.of(context).size.width * 0.3, 0), // Ajuste a largura mínima do botão
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Cadastro',
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32.0),
            Form(
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
                  SizedBox(height: 4.0),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Digite seu email',
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  const Text(
                    'Senha',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Digite sua senha',
                      contentPadding: EdgeInsets.all(10.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 12.0),
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: const Text(
                      'Esqueci minha senha',
                      style: TextStyle(
                        fontSize: 15.0,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 24.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF00A271),
                      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                      minimumSize: Size(double.infinity, 55),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {

                      }
                    },
                    child: Text(
                      'Entrar',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: Text(
                        'Não tem uma conta? Cadastre-se.',
                        style: TextStyle(
                          fontSize: 16.0,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                      minimumSize: Size(double.infinity, 55),
                      elevation: 4
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Acesse com o Google",
                          style: TextStyle(
                            fontSize: 16, 
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        ),
                        SizedBox(width: 12),
                        Image.asset(
                          'assets/images/logo_google.png',
                          height: 30,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
