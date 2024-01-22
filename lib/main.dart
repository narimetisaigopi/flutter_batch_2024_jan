import 'package:flutter/material.dart';
import 'package:flutter_batch_2024_jan/screens/home_screen.dart';
import 'package:flutter_batch_2024_jan/screens/login_screen.dart';

void main() {
  // start the program
  runApp(const MyApp()); // this will attach the screen
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // it is parent for whole app
      title: 'App Name',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      // home: HomeScreen(),
      home: LoginScreen(),
    );
  }
}
