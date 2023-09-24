abstract class CalculatorScreenState {}

class CalculatorScreenInputState extends CalculatorScreenState {
  final String? weight;
  final String? speed;
  final bool doesUserAgreementAccepted;

  CalculatorScreenInputState({required this.weight, required this.speed, required this.doesUserAgreementAccepted});
}

class CalculatorScreenResultsState extends CalculatorScreenState {
  final double energyResult;

  CalculatorScreenResultsState({required this.energyResult});
}