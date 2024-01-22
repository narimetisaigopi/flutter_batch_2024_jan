import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
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
          Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Text(
              "9999",
              style:
                  TextStyle(fontSize: 30, decoration: TextDecoration.overline),
            ),
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
                      color: const Color.fromARGB(255, 117, 25, 25),
                      width: 4,
                      style: BorderStyle.solid)),
              // child: const Icon(
              //   Icons.access_alarms,
              //   size: 32,
              // ),
              alignment: Alignment.center,
              child: const Text(
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
          Row(
            children: [
              Container(
                height: 180,
                width: 180,
                // margin: EdgeInsets.zero, // for making zero
                // ** margin: const EdgeInsets.all(8), // equal to all sides
                // margin: EdgeInsets.fromLTRB(8, 24, 12, 10), // when u can give all sides
                // ** margin: EdgeInsets.only(left: 8, right: 20, top: 2, bottom: 18), // give whichever side you want
                margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal:
                        4), // vertical == top and bottom and horizontal == left and right
                color: Colors.teal,
              ),
              Container(
                height: 180,
                width: 180,
                color: Colors.red,
              ),
            ],
          ),
          Container(
            height: 180,
            width: 180,
            color: Colors.yellow,
            // alignment: Alignment.center,
            margin: EdgeInsets.all(12),
            //padding: EdgeInsets.only(left: 18, bottom: 30),
            //padding: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.zero,
            child: Center(
              child: Text(
                "Flutter Classes",
                style: TextStyle(fontSize: 30),
              ),
            ),
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
