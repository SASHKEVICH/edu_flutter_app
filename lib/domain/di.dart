import 'package:edu_flutter_app/domain/database/db_service.dart';
import 'package:edu_flutter_app/domain/kinetic_calculator/kinetic_calculator_service.dart';

class Di {
  final KineticCalculatorService _kineticCalculatorService = KineticCalculatorService();
  final DBService _dbService = DBService();

  KineticCalculatorService getKineticCalculatorService() {
    return _kineticCalculatorService;
  }

  DBService getDbService() {
    return _dbService;
  }
}