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
      // body: Icon(
      //   Icons.face,
      //   size: 160,
      // ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "9999",
            style:
                TextStyle(fontSize: 30, decoration: TextDecoration.lineThrough),
          ),
          Text(
            "9999",
            style: TextStyle(fontSize: 30, decoration: TextDecoration.overline),
          ),
          Center(
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.pink,
                  boxShadow: [BoxShadow(color: Colors.green, spreadRadius: 3)],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                      color: const Color.fromARGB(255, 117, 25, 25), width: 4, style: BorderStyle.solid)),
              // child: const Icon(
              //   Icons.access_alarms,
              //   size: 32,
              // ),
              alignment: Alignment.center,
              child: Text(
                "I am container",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    letterSpacing: 0,
                    wordSpacing: 0,
                    decoration: TextDecoration.lineThrough,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Container(
            height: 180,
            width: 180,
            margin: EdgeInsets.all(8), // all sides equal margin
            color: Colors.teal,
          ),
          Container(
            height: 180,
            width: 180,
            color: Colors.yellow,
          )
        ],
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
