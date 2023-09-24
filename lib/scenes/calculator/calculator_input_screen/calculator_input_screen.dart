import 'package:flutter/material.dart';

import 'package:edu_flutter_app/scenes/cubit/calculator_screen_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorInputScreen extends StatefulWidget {
  const CalculatorInputScreen({super.key});
  
  @override
  State<StatefulWidget> createState() => CalculatorInputScreenState();
}

class CalculatorInputScreenState extends State<CalculatorInputScreen> {
  final _formKey = GlobalKey<FormState>();

  final _weightFieldController = TextEditingController();
  final _speedFieldController = TextEditingController();

  bool _isUserAgreementAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: _Constants.screenPaddingInsets,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            const Text(_Constants.screenTitle),
            _Constants.defaultSpacing,
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _weightFieldController,
                    decoration: const InputDecoration(
                      hintText: _Constants.weightInputDecorationText
                    ),
                    validator: (newWeight) {
                      if (newWeight == null) { return ''; }

                      var weight = double.tryParse(newWeight);
                      if (weight == null || weight < 0) {
                        return _Constants.weightValidatingErrorText;
                      }
                      return null;
                    },
                    onTapOutside: (event) {
                      _dismissKeyboard(context, event);
                    },
                  ),
                  _Constants.defaultSpacing,
                  TextFormField(
                    keyboardType: TextInputType.text,
                    controller: _speedFieldController,
                    decoration: const InputDecoration(
                      hintText: _Constants.speedInputDecorationText
                    ),
                    validator: (newSpeed) {
                      if (newSpeed == null) { return ''; }

                      var speed = double.tryParse(newSpeed);
                      if (speed == null || speed < 0) {
                        return _Constants.speedValidatingErrorText;
                      }
                      return null;
                    },
                    onTapOutside: (event) {
                      _dismissKeyboard(context, event);
                    },
                  ),
                  _Constants.defaultSpacing,
                  CheckboxListTile(
                    value: _isUserAgreementAccepted, 
                    title: const Text(_Constants.userAgreementText),
                    onChanged: (value) => setState(() => _isUserAgreementAccepted = value!)
                  )
                ],
              )
            ),
            _Constants.defaultSpacing,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent[100], // Background color
                foregroundColor: Colors.black
              ),
              onPressed: _onCalculateButtonPressed,
              child: const Text(_Constants.calculateButtonTitle),
            ),
          ]
        ),
      )
    );
  }

  void _dismissKeyboard(BuildContext context, PointerDownEvent event) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  void _onCalculateButtonPressed() {
    var isFormValid = _formKey.currentState?.validate();
    if ((isFormValid != null && isFormValid == false) || _isUserAgreementAccepted == false) { return; }

    var weight = _weightFieldController.text;
    var speed = _speedFieldController.text;

    BlocProvider.of<CalculatorScreenCubit>(context).setKineticEnergyResult(weight, speed);
  }
}

class _Constants {
  static const String screenTitle = "Калькулятор кинетической энергии";
  static const EdgeInsets screenPaddingInsets = EdgeInsets.all(30);

  static const String userAgreementText = 'Согласие на обработку персональных данных';

  static const String weightValidatingErrorText = "Введите корректное число";
  static const String speedValidatingErrorText = "Введите корректное число";

  static const String weightInputDecorationText = "Введите массу тела";
  static const String speedInputDecorationText = "Введите скорость тела";

  static const String calculateButtonTitle = "Посчитать";

  static const SizedBox defaultSpacing = SizedBox(height: 50,);
}