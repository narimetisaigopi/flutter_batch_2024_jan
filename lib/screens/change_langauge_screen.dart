import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_batch_2024_jan/screens/splash_screen.dart';

class ChangeLanguageScreen extends StatelessWidget {
  const ChangeLanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Languge"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Text("hello").tr(),
          TextButton(
              onPressed: () {
                context.setLocale(Locale("en"));
                print(context.locale.toString());
                // Navigator.pushAndRemoveUntil(
                //     context,
                //     MaterialPageRoute(builder: (builder) => SplashScreen()),
                //     (route) => false);
              },
              child: Text("English")),
          TextButton(
            onPressed: () {
              context.setLocale(Locale("te"));
              print(context.locale.toString());
              // Navigator.pushAndRemoveUntil(
              //     context,
              //     MaterialPageRoute(builder: (builder) => SplashScreen()),
              //     (route) => false);
            },
            child: Text("Telugu"),
          ),
          TextButton(
              onPressed: () {
                context.setLocale(Locale("hi"));
                print(context.locale.toString());
                // Navigator.pushAndRemoveUntil(
                //     context,
                //     MaterialPageRoute(builder: (builder) => SplashScreen()),
                //     (route) => false);
              },
              child: Text("Hindi"))
        ],
      ),
    );
  }
}
