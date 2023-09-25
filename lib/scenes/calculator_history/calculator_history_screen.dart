import 'package:edu_flutter_app/domain/models/calculation_history_record.dart';
import 'package:flutter/material.dart';

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
    );
  }
}