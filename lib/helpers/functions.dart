import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import '/styles.dart';
import '/helpers/secure_storage.dart';

Future fetchData(context) async {
  await SecureStorage.getHistory(context);
}

double deviceHeight(context) =>
    MediaQuery.of(context).size.height -
    MediaQuery.of(context).padding.top -
    kToolbarHeight;

Color buttonColor(context) {
  return MediaQuery.of(context).platformBrightness == Brightness.dark
      ? Styles.buttonBackgroundColorDark
      : Styles.buttonBackgroundColorLight;
}

Color textColor(context) {
  return MediaQuery.of(context).platformBrightness == Brightness.dark
      ? Styles.primaryTextColorDark
      : Styles.primaryTextColorLight;
}

double degToRad(double deg) {
  return deg * (3.1415926535897932 / 180);
}

double radToDeg(double rad) {
  return rad * (180 / 3.1415926535897932);
}

String evaluate(List<String> inputList) {
  String input = '';
  int l = 0;
  int r = 0;
  for (String item in inputList) {
    input += item;
    for (int i = 0; i < item.length; i++) {
      if (input[i] == '(') l++;
      if (input[i] == ')') r++;
    }
  }
  input = input.replaceAll('[', '');
  input = input.replaceAll(']', '');
  input = input.replaceAll(',', '');
  input = input.replaceAll(' ', '');

  if (l > r) {
    for (int i = 0; i < l - r; i++) {
      input += ')';
    }
  }

  Parser p = Parser();
  Expression exp = p.parse(input);
  ContextModel cm = ContextModel();
  double eval = exp.evaluate(EvaluationType.REAL, cm);
  return (eval.toString().replaceAll(RegExp(r"([.]*0)(?!.*\d)"), ""));
}

String stringMaker(List<String> inputList) {
  String input = '';
  for (String item in inputList) {
    input += item;
  }
  input = input.replaceAll('[', '');
  input = input.replaceAll(']', '');
  input = input.replaceAll(',', '');
  input = input.replaceAll(' ', '');
  input = input.replaceAll('/', '÷');
  input = input.replaceAll('*', '×');
  input = input.replaceAll('arcsin(', 'sin\u207B\u00B9(');
  input = input.replaceAll('arccos(', 'cos\u207B\u00B9(');
  input = input.replaceAll('arctan(', 'tan\u207B\u00B9(');
  input = input.replaceAll('3.1415926535897932', 'π');
  input = input.replaceAll('2.718281828459045', 'e');
  return (input);
}

showBottomSheetWidget(Widget child, BuildContext ctx) async {
  return await showModalBottomSheet<dynamic>(
    shape: Styles.topLR,
    isScrollControlled: true,
    context: ctx,
    builder: (ctx) => Wrap(children: [child]),
  );
}
