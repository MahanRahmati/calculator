import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'styles.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    colorScheme: ThemeData.dark().colorScheme.copyWith(
          secondary: Styles.secondaryColor1,
        ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: Styles.primaryTextColorDark),
      titleTextStyle: TextStyle(color: Styles.primaryTextColorDark),
    ),
    applyElevationOverlayColor: true,
    scaffoldBackgroundColor: Styles.scaffoldBackgroundColorDark,
    dividerColor: Styles.dividerColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        onPrimary: Styles.primaryTextColorDark,
        primary: Styles.elevatedButtonBackgroundColorDark,
        shape: Styles.rounded,
      ).merge(
        ButtonStyle(
          elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) return 0;
              return 0;
            },
          ),
        ),
      ),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(color: Styles.primaryTextColorDark),
      bodyText1: TextStyle(fontSize: 18.0, color: Styles.primaryTextColorDark),
      bodyText2: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
        color: Styles.primaryTextColorDark,
      ),
      overline: TextStyle(fontSize: 16.0, color: Styles.secondaryColor1),
      subtitle1: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.w700,
        color: Styles.primaryTextColorDark,
      ),
      subtitle2: TextStyle(fontSize: 16.0, color: Styles.secondaryColor1),
      button: TextStyle(fontSize: 19.5),
      caption: TextStyle(fontSize: 14.0),
    ),
  );

  static final lightTheme = ThemeData(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    colorScheme: ThemeData.light().colorScheme.copyWith(
          secondary: Styles.secondaryColor1,
        ),
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(color: Styles.primaryTextColorLight),
      titleTextStyle: TextStyle(color: Styles.primaryTextColorLight),
    ),
    scaffoldBackgroundColor: Styles.scaffoldBackgroundColorLight,
    dividerColor: Styles.dividerColor,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        onPrimary: Styles.primaryTextColorLight,
        primary: Styles.elevatedButtonBackgroundColorLight,
        shape: Styles.rounded,
      ).merge(
        ButtonStyle(
          elevation: MaterialStateProperty.resolveWith<double>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.pressed)) return 0;
              return 0;
            },
          ),
        ),
      ),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(color: Styles.primaryTextColorLight),
      bodyText1: TextStyle(fontSize: 18.0, color: Styles.primaryTextColorLight),
      bodyText2: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
        color: Styles.primaryTextColorLight,
      ),
      overline: TextStyle(fontSize: 16.0, color: Styles.secondaryColor1),
      subtitle1: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.w700,
        color: Styles.primaryTextColorLight,
      ),
      subtitle2: TextStyle(fontSize: 16.0, color: Styles.secondaryColor1),
      button: TextStyle(fontSize: 19.5),
      caption: TextStyle(fontSize: 14.0),
    ),
  );
}
