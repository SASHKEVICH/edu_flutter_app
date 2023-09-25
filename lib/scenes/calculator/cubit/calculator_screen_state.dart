abstract class CalculatorScreenState {}

class InputState extends CalculatorScreenState {
  final String? weight;
  final String? speed;
  final bool doesUserAgreementAccepted;

  InputState({required this.weight, required this.speed, required this.doesUserAgreementAccepted});
}

class ResultsState extends CalculatorScreenState {
  final double energyResult;

  ResultsState({required this.energyResult});
}