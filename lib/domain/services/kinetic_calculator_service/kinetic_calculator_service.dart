import 'package:edu_flutter_app/domain/services/kinetic_calculator_service/kinetic_calculator.dart';

class KineticCalculatorService {
  final KineticCalculator _calculator = KineticCalculator.shared;

  double calculate(double weight, double speed) {
    return _calculator.calculate(weight, speed);
  }
}