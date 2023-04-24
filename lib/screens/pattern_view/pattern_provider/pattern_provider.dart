import 'package:flutter/material.dart';

class PatternProvider extends ChangeNotifier{
  double i = 0.0;
  int number = 0;

  void change(double value){
    i = value;
    notifyListeners();
  }
}