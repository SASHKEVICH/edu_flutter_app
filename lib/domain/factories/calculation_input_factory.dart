import 'package:edu_flutter_app/domain/models/calculator/calculation_input.dart';

class CalculationInputFactory {
  static CalculationInput? make(String weight, String speed) {
    var parsedWeight = double.tryParse(weight);
    var parsedSpeed = double.tryParse(speed);

    if (parsedWeight == null || parsedSpeed == null) {
      return null;
    }

    return (weight: parsedWeight, speed: parsedSpeed);
  }
}