import 'package:flutter/material.dart';

class ClickOption extends ChangeNotifier {
  bool show = false;

  void toTrue() {
    show = true;
    notifyListeners();
  }

  void toFalse() {
    show = false;
    notifyListeners();
  }
}
