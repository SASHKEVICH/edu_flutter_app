import 'package:flutter/material.dart';

import 'package:edu_flutter_app/domain/models/calculator/calculation_history_record.dart';

class CalculatorHistoryScreen extends StatefulWidget {
  const CalculatorHistoryScreen({super.key, required this.records});

  final List<CalculationHistoryRecord> records;

  @override
  State<StatefulWidget> createState() => _CalculatorHistoryScreenState();
}

class _CalculatorHistoryScreenState extends State<CalculatorHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("История"),
        backgroundColor: Colors.redAccent[100],
      ),
      body: ListView.builder(
        itemCount: widget.records.length,
        itemBuilder: (BuildContext context, int index) {
          var record = widget.records[index];
          return ListTile(
            leading: Text("${record.weight} кг."),
            title: Text("${record.speed} м/с."),
            trailing: Text("${record.kineticEnergy}"),
          );
        }
      )
    );
  }
}