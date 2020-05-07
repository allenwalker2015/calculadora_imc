import 'dart:math';

class CalculatorBrain {
  int height;
  int weight;
  double _bmi;
  CalculatorBrain({this.weight, this.height});
  String calculate() {
    _bmi = weight * 0.453592 / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Sobrepeso';
    } else if (_bmi > 18.5)
      return 'Normal';
    else
      return 'Peso muy bajo';
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'Sobrepeso';
    } else if (_bmi > 18.5)
      return 'Normal';
    else
      return 'Peso muy bajo';
  }
}
