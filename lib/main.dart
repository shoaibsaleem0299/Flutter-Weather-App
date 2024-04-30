import 'package:flutter/material.dart';
import 'package:weather_app/screens/first_view/first_view.dart';
// import 'package:weather_app/screens/home_view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstView(),
    );
  }
}
