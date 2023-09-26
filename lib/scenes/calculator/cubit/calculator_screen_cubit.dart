import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:edu_flutter_app/domain/services/kinetic_calculator_service/kinetic_calculator_service.dart';
import 'package:edu_flutter_app/scenes/calculator/cubit/calculator_screen_state.dart';
import 'package:edu_flutter_app/domain/database/db_service.dart';
import 'package:edu_flutter_app/domain/factories/calculation_history_record_factory.dart';
import 'package:edu_flutter_app/domain/factories/calculation_input_factory.dart';

class CalculatorScreenCubit extends Cubit<CalculatorScreenState> {
  CalculatorScreenCubit({
    required this.kineticService,
    required this.dbService
  })
    : super(InputState(weight: null, speed: null, doesUserAgreementAccepted: false));

  final KineticCalculatorService kineticService;
  final DBService dbService;

  void setInputState() {
    emit(InputState(weight: null, speed: null, doesUserAgreementAccepted: false));
  }

  void setKineticEnergyResult(String weight, String speed) async {
    var input = CalculationInputFactory.make(weight, speed);

    if (input == null) { return; }

    var energyResult = kineticService.calculate(input.weight, input.speed);
    var record = CaclulationHistoryRecordFactory.make(input.weight, input.speed, energyResult);

    await dbService.addCalculationHistoryRecord(record);
    emit(ResultsState(energyResult: energyResult));
  }
}