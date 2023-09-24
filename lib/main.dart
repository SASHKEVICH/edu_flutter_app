import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:edu_flutter_app/domain/di.dart';
import 'package:edu_flutter_app/scenes/calculator/calculator_history_screen/calculator_history_screen.dart';
import 'package:edu_flutter_app/scenes/calculator/calculator_page.dart';
import 'package:edu_flutter_app/scenes/cubit/calculator_screen_cubit.dart';

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
      routes: {
        Routes.initialRoute: (context) => _getCalculatorPageBlocProvider(),
        Routes.calculatorHistoryScreenRoute: (context) => const CalculatorHistoryScreen()
      },
      initialRoute: Routes.initialRoute,
    );
  }

  Widget _getCalculatorPageBlocProvider() {
    return BlocProvider<CalculatorScreenCubit>(
      create: (context) => CalculatorScreenCubit(
        kineticService: _di.getKineticCalculatorService()
      ),
      child: const CalculatorPage(),
    ); 
  }
}

class Routes {
  static const initialRoute = '/';
  static const calculatorHistoryScreenRoute = '/history';
}
