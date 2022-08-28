import 'package:effective_work/viewmodel/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'consts/main_consts.dart';
import 'view/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Effective Work',
        debugShowCheckedModeBanner: false,
        theme: _productThemeData(),
        home: const HomePage(),
      ),
    );
  }

  ThemeData _productThemeData() {
    return ThemeData(
        primaryColor: MaterialColorForApp.myWhite,
        textTheme: TextTheme(
            displayLarge: HomePageConsts.displayLarge),
        appBarTheme: AppBarTheme(
            color: MainConsts.appBarColor,
            titleTextStyle: AppBarTextStyle.textStyle),
      );
  }
}
