import 'package:edu_flutter_app/domain/models/calculation_history_record.dart';

abstract class CalculatorHistoryScreenState {}

class InitState extends CalculatorHistoryScreenState {

}

class LoadedState extends CalculatorHistoryScreenState {
  final List<CalculationHistoryRecord> records;

  LoadedState({required this.records});
}
