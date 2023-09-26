import 'package:edu_flutter_app/domain/DAL/database/db_service.dart';
import 'package:edu_flutter_app/domain/services/kinetic_calculator_service/kinetic_calculator_service.dart';
import 'package:edu_flutter_app/domain/services/nasa_photos_service/nasa_photos_service.dart';

class Di {
  final KineticCalculatorService _kineticCalculatorService = KineticCalculatorService();
  final DBService _dbService = DBService();
  final NasaPhotosService _photosService = NasaPhotosService();

  KineticCalculatorService getKineticCalculatorService() {
    return _kineticCalculatorService;
  }

  DBService getDbService() {
    return _dbService;
  }

  NasaPhotosService getNasaPhotosService() {
    return _photosService;
  }
}