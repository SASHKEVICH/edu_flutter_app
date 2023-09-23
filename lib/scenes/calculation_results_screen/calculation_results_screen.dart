import 'package:flutter/material.dart';

import 'package:edu_flutter_app/domain/kinetic_calculator_service.dart';
import 'package:edu_flutter_app/widgets/name_app_bar.dart';

class CalculationResultsScreen extends StatefulWidget {
  const CalculationResultsScreen({super.key, required this.weight, required this.speed});

  final String weight;
  final String speed;
  
  @override
  State<StatefulWidget> createState() => _CalculationResultsScreenState();
}

class _CalculationResultsScreenState extends State<CalculationResultsScreen> {
  final KineticCalculatorService _kineticService = KineticCalculatorService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NameAppBar(),
      body: Container(
        padding: _Constants.screenPaddingInsets,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(_Constants.screenTitle),
            _Constants.defaultSpacing,
            Text("${_Constants.resultsDescription} ${_getKineticEnergyResult()}, ${_Constants.formulaText}"),
          ]
        ),
      )
    );
  }

  double _getKineticEnergyResult() {
    return _kineticService.calculate(widget.weight, widget.speed) ?? 0;
  }
}

class _Constants {
  static const EdgeInsets screenPaddingInsets = EdgeInsets.all(30);

  static const String screenTitle = 'Результат';
  static const String resultsDescription = 'Кинетическая энергия = ';
  static const String formulaText = 'm * v^2 / 2';

  static const SizedBox defaultSpacing = SizedBox(height: 40,);
}
