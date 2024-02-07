import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_batch_2024_jan/navigations/app_routes.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // start the program
  runApp(EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('hi'),
        Locale('te'),
        Locale('ta')
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp())); // this will attach the screen
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // it is parent for whole app
      title: 'App Name',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        theme: ThemeData(
        textTheme: GoogleFonts.aDLaMDisplayTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
        // fontFamily: 'SingleDay'
      ),
        initialRoute: '/',
        // routes: {
        //   '/': (context) => RegistrationScreen(),
        //   '/loginScreen': (context) => LoginScreen()
        // },
        onGenerateRoute: onGenerateRoute
        // home: SplashScreen(),
    );
  }
}
