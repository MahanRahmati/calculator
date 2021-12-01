import 'package:flutter/material.dart';

import '/helpers/functions.dart';
import '/strings.dart';
import '/styles.dart';

class CalculatorButton extends StatelessWidget {
  final String string;
  final Color? color;
  final VoidCallback? function;

  const CalculatorButton({
    Key? key,
    required this.string,
    this.color,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Styles.hltrb,
      child: ElevatedButton(
        child: Text(
          string,
          style: TextStyle(color: color ?? textColor(context)),
        ),
        onPressed: function,
      ),
    );
  }
}

class FunctionButton extends StatelessWidget {
  final String string;
  final Color? color;
  final VoidCallback? function;

  const FunctionButton({
    Key? key,
    required this.string,
    this.color,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        string,
        style: TextStyle(color: color ?? Styles.dividerColor),
      ),
      onPressed: function,
    );
  }
}

class DeleteButton extends StatelessWidget {
  final VoidCallback? function;

  const DeleteButton({
    Key? key,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Styles.hltrb,
      child: ElevatedButton(
        child: const Icon(
          Icons.backspace_outlined,
          color: Styles.secondaryColor1,
        ),
        onPressed: function,
      ),
    );
  }
}

class EqualButton extends StatelessWidget {
  final VoidCallback? function;

  const EqualButton({Key? key, required this.function}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Styles.hltrb,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: Styles.primaryTextColorDark,
          primary: Styles.secondaryColor1,
        ),
        child: const Text(Strings.eq),
        onPressed: function,
      ),
    );
  }
}
