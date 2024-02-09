import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_batch_2024_jan/main.dart';
import 'package:flutter_batch_2024_jan/screens/splash_screen.dart';
import 'package:flutter_batch_2024_jan/utilities/shared_preferance_utils.dart';

class ChangeLanguageScreen extends StatelessWidget {
  SharedPreferanceUtils sharedPreferanceUtils = SharedPreferanceUtils();

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
                sharedPreferanceUtils.setLanguage("en");
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
              sharedPreferanceUtils.setLanguage("te");
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
                sharedPreferanceUtils.setLanguage("hi");
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
