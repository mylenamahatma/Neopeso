import 'package:flutter/material.dart';
import 'cadastro_paciente_informacoes_partos.dart';

class CadastroPacienteGestacaoDados extends StatelessWidget {
  const CadastroPacienteGestacaoDados({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const FormCadastroPacienteGestacaoDados(),
    );
  }
}

class FormCadastroPacienteGestacaoDados extends StatefulWidget {
  const FormCadastroPacienteGestacaoDados({Key? key}) : super(key: key);

  @override
  State<FormCadastroPacienteGestacaoDados> createState() => _FormCadastroPacienteGestacaoDadosState();
}

class _FormCadastroPacienteGestacaoDadosState extends State<FormCadastroPacienteGestacaoDados> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? anomalia;
  String? mesGestacao;
  String? paridade;
  String? sexoBebe;
  String? tipoGravidez;

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
              _buildAppBar(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 8.0),
                        const Text(
                          'Agora, nos informe alguns dados sobre a gestação...',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.85 * 0.66666,
                              height: 8,
                              color: Colors.blue,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.85 * 0.33334,
                              height: 8,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        const SizedBox(height: 24.0),
                        const Text(
                          'Anomalia',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          items: <String>['Sim', 'Não', 'Não sabe informar']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              anomalia = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, selecione uma opção';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24.0),
                        const Text(
                          'Mês de gestação de início do pré-natal',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          items: List.generate(9, (index) {
                            return DropdownMenuItem<String>(
                              value: (index + 1).toString(),
                              child: Text('Mês ${index + 1}'),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              mesGestacao = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, selecione uma opção';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24.0),
                        const Text(
                          'Paridade',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          items: <String>['Multipara', 'Nulípara']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              paridade = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, selecione uma opção';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24.0),
                        const Text(
                          'Sexo do bebê',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          items: <String>['Masculino', 'Feminino', 'Não sabe informar']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              sexoBebe = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, selecione uma opção';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24.0),
                        const Text(
                          'Tipo de gravidez',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          items: <String>['Única', 'Gemelar', 'Múltipla', 'Não sabe informar']
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              tipoGravidez = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, selecione uma opção';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Voltar'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const CadastroPacientePartosDados()),
                                  );
                                } else {
                                  // Handle validation errors here
                                }
                              },
                              child: const Text('Próximo'),
                            ),
                          ],
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

  Widget _buildAppBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const Text(
          'Informações do paciente',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 40.0),
      ],
    );
  }
}
