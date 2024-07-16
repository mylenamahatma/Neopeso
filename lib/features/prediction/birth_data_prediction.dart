import 'package:flutter/material.dart';
import 'package:neopeso/features/prediction/results_page.dart';

class BirthDataPrediction extends StatelessWidget {
  const BirthDataPrediction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: FormBirthDataPrediction(),
    );
  }
}

class FormBirthDataPrediction extends StatefulWidget {
  const FormBirthDataPrediction({super.key});

  @override
  State<FormBirthDataPrediction> createState() =>
      _FormBirthDataPredictionState();
}

class _FormBirthDataPredictionState extends State<FormBirthDataPrediction> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int partosAnteriores = 0;
  int cesarias = 0;
  int partosNormais = 0;
  int filhosVivos = 0;
  int natimortos = 0;

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
                          'Para finalizar, precisamos de informações de partos anteriores.',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Container(
                          width: double.infinity,
                          height: 8,
                          color: Colors.green,
                        ),
                        const SizedBox(height: 24.0),
                        _buildCounterRow(
                          'Quantidade de partos anteriores',
                          partosAnteriores,
                          (value) => setState(() => partosAnteriores = value),
                        ),
                        const SizedBox(height: 24.0),
                        _buildCounterRow(
                          'Quantidade de cesáreas',
                          cesarias,
                          (value) => setState(() => cesarias = value),
                        ),
                        const SizedBox(height: 24.0),
                        _buildCounterRow(
                          'Quantidade de partos normais',
                          partosNormais,
                          (value) => setState(() => partosNormais = value),
                        ),
                        const SizedBox(height: 24.0),
                        _buildCounterRow(
                          'Quantidade de filhos vivos',
                          filhosVivos,
                          (value) => setState(() => filhosVivos = value),
                        ),
                        const SizedBox(height: 24.0),
                        _buildCounterRow(
                          'Quantidade de natimortos',
                          natimortos,
                          (value) => setState(() => natimortos = value),
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
                                      builder: (context) => const ResultsPage(),
                                    ),
                                  );
                                } else {
                                  
                                }
                              },
                              child: const Text('Enviar'),
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

  Widget _buildCounterRow(String label, int value, Function(int) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4.0),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Row(
            children: [
              Text(
                '$value',
                style: const TextStyle(fontSize: 16.0),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  if (value > 0) {
                    onChanged(value - 1);
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  onChanged(value + 1);
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
