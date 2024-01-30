import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_batch_2024_jan/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    print("Timer started");
    Timer(Duration(seconds: 2), () {
      print("Timer completed");
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (ctx) => LoginScreen()), (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: CachedNetworkImage(
                height: 150,
                imageUrl:
                    "https://t4.ftcdn.net/jpg/02/78/54/29/360_F_278542923_rKZvE6M5pkL457HrQPxKi9JBuvzDIDnz.jpg"),
          ),
          const Text(
            "Welcome App",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
