import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_batch_2024_jan/main.dart';
import 'package:flutter_batch_2024_jan/screens/dashboard_screen.dart';
import 'package:flutter_batch_2024_jan/screens/login_screen.dart';
import 'package:flutter_batch_2024_jan/utilities/shared_preferance_utils.dart';

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
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (builder) => LoginScreen()));
      // Navigator.pushNamed(context, "routeName", arguments: []);
      // bool? isUserLoginData = sharedPreferences.getBool("isUserLogin");
      // print("isUserLoginData $isUserLoginData");
      if (SharedPreferanceUtils().isUserLoggedIn()) {
        // user already logged
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (ctx) => DashboardScreen(
                      email: '',
                    )),
            (route) => false);
      } else {
        // user is not logged in
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (ctx) => LoginScreen()),
            (route) => false);
      }

      // Navigator.of(context).pushNamedAndRemoveUntil(
      //     DashboardScreen.routeName, (route) => false,
      //     arguments: [""]);
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
