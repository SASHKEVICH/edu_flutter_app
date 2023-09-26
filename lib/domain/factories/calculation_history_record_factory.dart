import 'package:edu_flutter_app/domain/models/calculator/calculation_history_record.dart';

class CaclulationHistoryRecordFactory {
  static CalculationHistoryRecord make(double weight, double speed, double kineticEnergy) {
    return (weight: weight, speed: speed, kineticEnergy: kineticEnergy);
  }
}