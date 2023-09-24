import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:edu_flutter_app/widgets/name_app_bar.dart';
import 'package:edu_flutter_app/scenes/cubit/calculator_screen_cubit.dart';
import 'package:edu_flutter_app/scenes/cubit/calculator_screen_state.dart';
import 'package:edu_flutter_app/scenes/calculator/calculator_input_screen/calculator_input_screen.dart';
import 'package:edu_flutter_app/scenes/calculator/calculator_results_screen/calculator_results_screen.dart';


class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<StatefulWidget> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NameAppBar(),
      body: BlocBuilder<CalculatorScreenCubit, CalculatorScreenState>(
        builder: (context, state) {
          if (state is InputState) {
            return const CalculatorInputScreen();
          } else if (state is ResultsState) {
            return CalculatorResultsScreen(energyResult: state.energyResult,);
          } else { 
            return Container();
          }
        }
      )
    );
  }
}