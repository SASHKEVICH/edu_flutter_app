import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:edu_flutter_app/scenes/calculator_history/calculator_history_screen.dart';
import 'package:edu_flutter_app/scenes/calculator_history/cubit/calculator_history_screen_cubit.dart';
import 'package:edu_flutter_app/scenes/calculator_history/cubit/calculator_history_screen_state.dart';

class CalculatorHistoryPage extends StatefulWidget {
  const CalculatorHistoryPage({super.key});

  @override
  State<StatefulWidget> createState() => _CalculatorHistoryPageState();
}

class _CalculatorHistoryPageState extends State<CalculatorHistoryPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      BlocProvider.of<CalculatorHistoryScreenCubit>(context).loadHistory();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CalculatorHistoryScreenCubit, CalculatorHistoryScreenState>(
        builder: (context, state) {
          if (state is InitState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LoadedState) {
            return CalculatorHistoryScreen(records: state.records);
          } else { 
            return Container();
          }
        },
      )
    );
  }
}