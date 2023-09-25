import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:edu_flutter_app/domain/kinetic_calculator/kinetic_calculator_service.dart';
import 'package:edu_flutter_app/scenes/calculator/cubit/calculator_screen_state.dart';

class CalculatorScreenCubit extends Cubit<CalculatorScreenState> {
  CalculatorScreenCubit({required this.kineticService}) 
    : super(InputState(weight: null, speed: null, doesUserAgreementAccepted: false));

  final KineticCalculatorService kineticService;

  void setKineticEnergyResult(String weight, String speed) {
    var energyResult = kineticService.calculate(weight, speed) ?? 0;
    emit(ResultsState(energyResult: energyResult));
  }
}