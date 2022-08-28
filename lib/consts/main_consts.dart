import 'package:flutter/material.dart';

// main frame consts
class MainConsts {
  static String appBarTitle = "Pomo";
  static Color appBarTitleColor = const Color(0XFFEFEFEF);
  static Color appBarColor = const Color(0XFF205375);
  static Color scaffoldBackgroundColor = Colors.white;
  static MaterialColor scaffoldColor = Colors.grey;
  static double appBarTextSize = 32;
  static Color dividerColor = Colors.grey;
  static double dividerThickness = 1;
  static Color liquidRefreshColor = const Color(0XFFB1D0E0);
}

class AppBarTextStyle {
  static TextStyle textStyle = TextStyle(
      color: MainConsts.appBarTitleColor, fontSize: MainConsts.appBarTextSize);
}

class HomePageConsts {
  static TextStyle displayLarge = const TextStyle(
      color: Color(0XFF205375), fontSize: 25, fontWeight: FontWeight.bold);
  static Color buttonColor = const Color(0XFFF66B0E);
}
