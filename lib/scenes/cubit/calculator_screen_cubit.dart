import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:edu_flutter_app/domain/kinetic_calculator/kinetic_calculator_service.dart';
import 'package:edu_flutter_app/scenes/cubit/calculator_screen_state.dart';

class CalculatorCubit extends Cubit<CalculatorScreenState> {
  CalculatorCubit({required this.kineticService}) 
    : super(CalculatorScreenInputState(weight: null, speed: null, doesUserAgreementAccepted: false));

  final KineticCalculatorService kineticService;

  void setKineticEnergyResult(String weight, String speed) {
    var energyResult = kineticService.calculate(weight, speed) ?? 0;
    emit(CalculatorScreenResultsState(energyResult: energyResult));
  }
}