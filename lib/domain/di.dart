import 'package:edu_flutter_app/domain/kinetic_calculator/kinetic_calculator_service.dart';

class Di {
  final KineticCalculatorService _kineticCalculatorService = KineticCalculatorService();

  KineticCalculatorService getKineticCalculatorService() {
    return _kineticCalculatorService;
  }
}