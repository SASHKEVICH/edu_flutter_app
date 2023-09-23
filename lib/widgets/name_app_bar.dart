import 'package:flutter/material.dart';

class NameAppBar extends AppBar {
  NameAppBar({super.key})
    : super (
      backgroundColor: Colors.redAccent[100],
      title: const Text (
        "Бекренев Александр Алексеевич"
      )
    );
}