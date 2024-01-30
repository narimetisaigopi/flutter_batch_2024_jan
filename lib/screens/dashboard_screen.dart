import 'package:flutter/material.dart';
import 'package:flutter_batch_2024_jan/screens/splash_screen.dart';

class DashboardScreen extends StatelessWidget {
  String email;
  String name;
  DashboardScreen({required this.email, this.name = ""});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard Screen"),
      ),
      body: Column(children: [
        Text("Logged in as $email"),
        // ElevatedButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     child: Text("Go Back"))
        ElevatedButton(
            onPressed: () {
              // Navigator.of(context).pushAndRemoveUntil(
              //     MaterialPageRoute(builder: (ctx) => SplashScreen()),
              //     (route) => false);
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (ctx) => SplashScreen()),
                  (route) => false);
            },
            child: Text("Logout"))
      ]),
    );
  }
}
