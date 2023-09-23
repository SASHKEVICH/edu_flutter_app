import 'package:edu_flutter_app/widgets/name_app_bar.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});
  
  @override
  State<StatefulWidget> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _weightFieldController = TextEditingController();
  final _speedFieldController = TextEditingController();

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
            _Constants.defualtSpacing,
            Form(
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _weightFieldController,
                    decoration: const InputDecoration(
                      hintText: _Constants.weightInputDecorationText
                    ),
                    validator: (newWeight) {
                      if (newWeight == null) { return ''; }

                      var weight = int.parse(newWeight);
                      if (weight < 0) {
                        return _Constants.weightValidatingErrorText;
                      }

                      return null;
                    },
                    onTapOutside: (event) {
                      _dismissKeyboard(context, event);
                    },
                  ),
                  _Constants.defualtSpacing,
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _speedFieldController,
                    decoration: const InputDecoration(
                      hintText: _Constants.speedInputDecorationText
                    ),
                    validator: (newSpeed) {
                      if (newSpeed == null) { return ''; }

                      var speed = int.parse(newSpeed);
                      if (speed < 0) {
                        return _Constants.speedValidatingErrorText;
                      }

                      return null;
                    },
                    onTapOutside: (event) {
                      _dismissKeyboard(context, event);
                    },
                  ),
                ],
              )
            ),
            _Constants.defualtSpacing,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent[100], // Background color
                foregroundColor: Colors.black
              ),
              child: const Text(_Constants.calculateButtonTitle),
              onPressed: () {
                print(_weightFieldController.text);
                print(_speedFieldController.text);
              },
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
}

class _Constants {
  static const String screenTitle = "Калькулятор кинетической энергии";
  static const EdgeInsets screenPaddingInsets = EdgeInsets.all(30);

  static const String weightValidatingErrorText = "Введите положительное число";
  static const String speedValidatingErrorText = "Введите положительное число";

  static const String weightInputDecorationText = "Введите массу тела";
  static const String speedInputDecorationText = "Введите скорость тела";

  static const String calculateButtonTitle = "Посчитать";

  static const SizedBox defualtSpacing = SizedBox(height: 50,);
}