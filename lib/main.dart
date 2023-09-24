import 'package:edu_flutter_app/domain/di.dart';
import 'package:edu_flutter_app/scenes/calculator/calculator_page.dart';
import 'package:edu_flutter_app/scenes/cubit/calculator_screen_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final Di _di = Di();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider<CalculatorScreenCubit>(
        create: (context) => CalculatorScreenCubit(
          kineticService: _di.getKineticCalculatorService()
        ),
        child: const CalculatorPage(),
      ),
    );
  }
}
