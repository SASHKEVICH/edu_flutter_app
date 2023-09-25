import 'package:flutter/material.dart';

class CalculatorHistoryScreen extends StatefulWidget {
  const CalculatorHistoryScreen({super.key});

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