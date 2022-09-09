import 'package:flutter/material.dart';
import 'package:flutter_clean_code/presentation/resources/routes_manager.dart';
import 'package:flutter_clean_code/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp._internal(); //private named constructor

  //single instance -- singleton
  static const MyApp instance = MyApp._internal();

  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: getApplicationTheme(),
    );
  }
}
