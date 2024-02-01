import 'package:flutter/material.dart';
import 'package:flutter_batch_2024_jan/screens/dashboard_screen.dart';
import 'package:flutter_batch_2024_jan/screens/error_screen.dart';
import 'package:flutter_batch_2024_jan/screens/login_screen.dart';
import 'package:flutter_batch_2024_jan/screens/splash_screen.dart';

var onGenerateRoute = (RouteSettings settings) {
  if (settings.name == "/") {
    return MaterialPageRoute(builder: (builder) => const SplashScreen());
  } else if (settings.name == "/loginScreen") {
    return MaterialPageRoute(builder: (builder) => LoginScreen());
  } else if (settings.name == DashboardScreen.routeName) {
    return MaterialPageRoute(
        builder: (builder) => DashboardScreen(
              email: (settings.arguments as List)[0].toString(),
            ));
  }

  return MaterialPageRoute(
      builder: (builder) => ErrorScreen(
            name: settings.name ?? "",
          ));
};
