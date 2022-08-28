import 'package:flutter/material.dart';

// main frame consts
class MainConsts {
  static String appBarTitle = "Pomo";
  static Color appBarTitleColor = const Color(0XFFEFEFEF);
  static Color appBarColor = const Color(0XFF205375);
  static Color scaffoldBackgroundColor = Colors.white;
  static double appBarTextSize = 32;
  static Color dividerColor = Colors.grey;
  static double dividerThickness = 1;
  static Color liquidRefreshColor = const Color(0XFFB1D0E0);
}

class MaterialColorForApp {
  static MaterialColor myWhite = const MaterialColor(0XFFEFEFEF, {
    50: Color(0XFFEFEFEF),
    100: Color(0XFFEFEFEF),
  });
}

// appbar text style consts
class AppBarTextStyle {
  static TextStyle textStyle = TextStyle(
      color: MainConsts.appBarTitleColor, fontSize: MainConsts.appBarTextSize);
}

// homepage consts
class HomePageConsts {
  static TextStyle displayLarge = const TextStyle(
      color: Color(0XFF205375), fontSize: 25, fontWeight: FontWeight.bold);
  static Color startPomoColor = const Color(0XFFF66B0E);
  static String readyTitle = 'Ready For Deep Dive?';
  static String focusTitle = 'Focus On It!';
}

// buttons properties
class Buttons {
  static String startButtonText = 'Start';
  static String stopButtonText = 'Break';
  static Color passiceButtonColor = const Color(0XFFF66B0E);
  static Color activeButtonColor = const Color(0XFF205375);
}

// circular counter consts
class CircularCounterConsts {
  static Color progressColor = const Color(0XFF205375);
  static Color fillColor =  Colors.grey;
}
