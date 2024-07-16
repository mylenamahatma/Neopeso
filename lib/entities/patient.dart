import 'Prediction.dart';

class Patient {
  final String name;
  final String cpf;
  final List<Prediction> predictions;

  Patient({required this.name, required this.cpf, required this.predictions});
}
