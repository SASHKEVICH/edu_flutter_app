abstract class CalculatorScreenState {}

class InputState extends CalculatorScreenState {
  final String? weight;
  final String? speed;
  final bool doesUserAgreementAccepted;

  InputState({required this.weight, required this.speed, required this.doesUserAgreementAccepted});
}

class CalculatorScreenResultsState extends CalculatorScreenState {
  final double energyResult;

  CalculatorScreenResultsState({required this.energyResult});
}