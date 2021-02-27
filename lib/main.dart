import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff141526),
        scaffoldBackgroundColor: Color(0xff141526),
      ),
      home: AnimatedSplashScreen(
        splash: Image.asset('lib/images/a.png'),
        nextScreen: InputPage(),
        splashTransition: SplashTransition.rotationTransition,
        duration: 3000,
      ),
    );
  }
}
