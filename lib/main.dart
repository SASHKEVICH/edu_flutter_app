import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:edu_flutter_app/domain/di.dart';
import 'package:edu_flutter_app/scenes/calculator/calculator_page.dart';
import 'package:edu_flutter_app/scenes/calculator/cubit/calculator_screen_cubit.dart';
import 'package:edu_flutter_app/scenes/calculator_history/calculator_history_page.dart';
import 'package:edu_flutter_app/scenes/calculator_history/cubit/calculator_history_screen_cubit.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
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
        Routes.initialRoute: (context) => _getCalculatorPage(),
        Routes.calculatorHistoryScreenRoute: (context) => _getCalculatorHistoryPage()
      },
      initialRoute: Routes.initialRoute,
    );
  }

  Widget _getCalculatorPage() {
    return BlocProvider<CalculatorScreenCubit>(
      create: (context) => CalculatorScreenCubit(
        kineticService: _di.getKineticCalculatorService(),
        dbService: _di.getDbService()
      ),
      child: const CalculatorPage(),
    ); 
  }

  Widget _getCalculatorHistoryPage() {
    return BlocProvider<CalculatorHistoryScreenCubit>(
      create: (context) => CalculatorHistoryScreenCubit(
        dbService: _di.getDbService()
      ),
      child: const CalculatorHistoryPage()
    );
  }
}

class Routes {
  static const initialRoute = '/';
  static const calculatorHistoryScreenRoute = '/history';
}
