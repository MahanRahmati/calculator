import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class Styles {
  // Colors
  static const Color secondaryColor1 = Color(0xFF1EA7FF);
  static const Color primaryTextColorLight = Colors.black;
  static const Color primaryTextColorDark = Colors.white;
  static const Color scaffoldBackgroundColorLight = Colors.white;
  static const Color scaffoldBackgroundColorDark = Colors.black;
  static const Color elevatedButtonBackgroundColorLight = Colors.white;
  static const Color buttonBackgroundColorLight = Color(0xFFF2F2F2);
  static const Color elevatedButtonBackgroundColorDark = Colors.black;
  static const Color buttonBackgroundColorDark = Color(0xFF2B2B2B);
  static const Color dividerColor = Color(0xFF808080);

  // Durations
  static const Duration basicDuration = Duration(milliseconds: 400);

  // Curves
  static const Curve basicCurve = Curves.easeOutQuint;

  // Doubles
  static const double padding = 10;
  static const double halfPadding = padding / 2;
  static const double buttonHeight = 60;

  // Paddings
  static const EdgeInsets ltrb = EdgeInsets.all(padding);
  static const EdgeInsets hltrb = EdgeInsets.all(halfPadding);

  // RoundedRectangleBorder
  static RoundedRectangleBorder rounded = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(200.0),
  );
  static const RoundedRectangleBorder topLR = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(padding * 2),
      topRight: Radius.circular(padding * 2),
    ),
  );
}
