import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:edu_flutter_app/domain/database/db_service.dart';
import 'package:edu_flutter_app/scenes/calculator_history/cubit/calculator_history_screen_state.dart';

class CalculatorHistoryScreenCubit extends Cubit<CalculatorHistoryScreenState> {
  CalculatorHistoryScreenCubit({required this.dbService}) 
    : super(InitState());

  final DBService dbService;

  void loadHistory() async {
    final records = await dbService.getAllCalculationHistoryRecords();
    emit(LoadedState(records: records));
  }
}