import 'package:edu_flutter_app/domain/kinetic_calculator.dart';

class KineticCalculatorService {
  final KineticCalculator _calculator = KineticCalculator.shared;

  double? calculate(String weight, String speed) {
    var parsedWeight = double.tryParse(weight);
    var parsedSpeed = double.tryParse(speed);

    if (parsedWeight == null || parsedSpeed == null) {
      return null;
    }

    return _calculator.calculate(parsedWeight, parsedSpeed);
  }
}