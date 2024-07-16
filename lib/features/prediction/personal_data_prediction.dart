import 'package:flutter/material.dart';
import 'preganancy_data_prediction.dart';

class PersonalDataPrediction extends StatelessWidget {
  const PersonalDataPrediction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: FormPersonalDataPrediction(),
    );
  }
}

class FormPersonalDataPrediction extends StatefulWidget {
  const FormPersonalDataPrediction({super.key});

  @override
  State<FormPersonalDataPrediction> createState() =>
      _FormPersonalDataPredictionState();
}

class _FormPersonalDataPredictionState
    extends State<FormPersonalDataPrediction> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? estadoCivil;
  String? ocupacao;
  String? idade;
  String? corRaca;
  String? escolaridade;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
                          'Primeiro, forneça algumas informações sobre a paciente...',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.2833,
                              height: 8.0,
                              color: Colors.orange,
                            ),
                            Expanded(
                              child: Container(
                                height: 8.0,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24.0),
                        const Text(
                          'Estado Civil',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            hintText: 'Selecionar opção',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          items: <String>[
                            'Solteira',
                            'Casada',
                            'Viúva',
                            'Separada/Divorciada',
                            'União Estável',
                            'Não Informado'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              estadoCivil = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Selecionar opção';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24.0),
                        const Text(
                          'Ocupação',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            hintText: 'Selecionar opção',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          items: <String>[
                            'Advogada',
                            'Assistente Administrativa',
                            'Autônoma',
                            'Cabelereira',
                            'Costureira',
                            'Dona de casa',
                            'Dona de comércio varegista',
                            'Enfermeira',
                            'Estudante',
                            'Farmacêutica',
                            'Manicure',
                            'Operadora de Caixa',
                            'Professora',
                            'Trabalhadora Rural',
                            'Recepcionista',
                            'Serviços domésticos',
                            'Outro'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              ocupacao = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Selecionar opção';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24.0),
                        const Text(
                          'Idade',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: 'Valor Numérico',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onChanged: (newValue) {
                            setState(() {
                              idade = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor, insira uma idade';
                            }
                            if (int.tryParse(value) == null) {
                              return 'Por favor, insira um número válido';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24.0),
                        const Text(
                          'Cor/Raça',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            hintText: 'Selecionar opção',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          items: <String>[
                            'Branca',
                            'Negra',
                            'Parda',
                            'Amarela',
                            'Indígena'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              corRaca = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Selecionar opção';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24.0),
                        const Text(
                          'Escolaridade',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4.0),
                        DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            hintText: 'Selecionar opção',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 10.0),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          items: <String>[
                            'Analfabeta',
                            'Primário I Incompleto',
                            'Primário I Completo',
                            'Ensino Fundamental I Incompleto',
                            'Ensino Fundamental I Completo',
                            'Ensino Fundamental II Incompleto',
                            'Ensino Fundamental II Completo',
                            'Ensino Médio Incompleto',
                            'Ensino Médio Completo',
                            'Graduação Incompleta',
                            'Graduação Completa',
                            'Não informado',
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            setState(() {
                              escolaridade = newValue;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Selecionar opção';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 24.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.white,
                                side: const BorderSide(color: Color(0xFF295066)),
                                foregroundColor: const Color(0xFF295066),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Voltar'),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF295066),
                                foregroundColor: Colors.white,
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const PreganancyDataPrediction(),
                                    ),
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
