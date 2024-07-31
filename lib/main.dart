import 'package:flutter/material.dart';
import 'package:tap_to_trip/presentation/landing_screen/landing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tap To Trip',
      theme: ThemeData(),
      home: const LandingScreen(),
    );
  }
}
