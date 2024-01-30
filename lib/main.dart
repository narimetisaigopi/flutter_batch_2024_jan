import 'package:flutter/material.dart';
import 'package:flutter_batch_2024_jan/row_column_stack_screen.dart';
import 'package:flutter_batch_2024_jan/screens/dashboard_screen.dart';
import 'package:flutter_batch_2024_jan/screens/home_screen.dart';
import 'package:flutter_batch_2024_jan/screens/images_gallery.dart';
import 'package:flutter_batch_2024_jan/screens/login_screen.dart';
import 'package:flutter_batch_2024_jan/screens/registration_screen.dart';
import 'package:flutter_batch_2024_jan/screens/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

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
        textTheme: GoogleFonts.aDLaMDisplayTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
        // fontFamily: 'SingleDay'
      ),
      // home: HomeScreen(),
      home: SplashScreen(),
    );
  }
}
