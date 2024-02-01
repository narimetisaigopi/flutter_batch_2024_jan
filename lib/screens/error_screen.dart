import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String name;
  const ErrorScreen({super.key, this.name = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Center(child: Text("Invalid ${this.name}, please check your route")),
    );
  }
}
