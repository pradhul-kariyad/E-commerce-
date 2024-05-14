import 'package:flutter/material.dart';

class ThemeIconProvider extends ChangeNotifier {
  bool isSelected = true;
  IconData favorite = Icons.light_mode_outlined;
  void changeIcon() {
    isSelected = !isSelected;
    favorite = isSelected ? Icons.light_mode_outlined : Icons.dark_mode_sharp;
    notifyListeners();
  }
}

class ThemeNameChangeProvider extends ChangeNotifier {
  bool isSelected = true;
  String name = 'Light mode';
  void changeName() {
    isSelected = !isSelected;
    name = isSelected ? 'Light mode' : 'Dark mode';
    notifyListeners();
  }
}
