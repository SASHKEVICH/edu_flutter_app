import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:edu_flutter_app/scenes/calculator/cubit/calculator_screen_cubit.dart';

class CalculatorResultsScreen extends StatefulWidget {
  const CalculatorResultsScreen({super.key, required this.energyResult});

  final double energyResult;
  
  @override
  State<StatefulWidget> createState() => _CalculatorResultsScreenState();
}

class _CalculatorResultsScreenState extends State<CalculatorResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_Constants.appBarTitle),
        backgroundColor: Colors.redAccent[100],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: _onBackButtonPressed,
        ),
      ),
      body: Container(
        padding: _Constants.screenPaddingInsets,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(_Constants.screenTitle),
            _Constants.defaultSpacing,
            Text("${_Constants.resultsDescription} ${widget.energyResult}, ${_Constants.formulaText}"),
          ]
        ),
      )
    );
  }

  void _onBackButtonPressed() {
    BlocProvider.of<CalculatorScreenCubit>(context).setInputState();
  }
}

class _Constants {
  static const String appBarTitle = 'Бекренев А.А.';

  static const EdgeInsets screenPaddingInsets = EdgeInsets.all(30);

  static const String screenTitle = 'Результат';
  static const String resultsDescription = 'Кинетическая энергия = ';
  static const String formulaText = 'm * v^2 / 2';

  static const SizedBox defaultSpacing = SizedBox(height: 40,);
}
