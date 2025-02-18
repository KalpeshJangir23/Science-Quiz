import 'package:flutter/material.dart';
import 'package:quiz_science_app/screens/splash_screen.dart';
import 'package:quiz_science_app/theme/app_theme.dart';

//https://api.jsonserve.com/Uw5CrX
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.darkTheme,
      home: SplashScreen(),
    );
  }
}
