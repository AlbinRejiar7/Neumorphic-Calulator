import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import '../constants/constants.dart';

class CalcProvider with ChangeNotifier {
  String question = '';
  String answer = '';
  void displayText(int index) {
    question += MyConstants.buttons[index];
    notifyListeners();
  }

  void deleteFunction() {
    if (question.isNotEmpty) {
      question = question.substring(0, question.length - 1);
      notifyListeners();
    }
  }

  void clearFunction() {
    question = '';
    answer = '';
    notifyListeners();
  }

  void equalPressed() {
    Parser p = Parser();
    Expression exp = p.parse(question);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
    notifyListeners();
  }
}
