import 'package:flutter/material.dart';

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
      home: MyHomeScreen(),
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // parent widget for every screen
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: Icon(
          Icons.home,
          color: Colors.white,
        ),
        // leading: Text("Go Home"),
        //backgroundColor: Color(0xff02FAFA), // custom color
        title: Text("I am title"),
        actions: [Icon(Icons.login), Icon(Icons.home)],
      ),
      body: Icon(
        Icons.face,
        size: 160,
      ),
      // drawer: Drawer(),
      // endDrawer: Drawer(),
      // floatingActionButton: Icon(
      //   Icons.linked_camera,
      //   color: Colors.red,
      // ),
      // fab
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("fab clicked");
        },
        backgroundColor: Colors.red,
        child: Icon(
          Icons.favorite,
          color: Colors.white,
          size: 32,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
            icon: Icon(Icons.verified_user), label: "Profile"),
      ]),
    );
  }
}
