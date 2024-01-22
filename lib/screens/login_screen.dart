import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite,
            size: 30,
          ),
          IconButton(
              onPressed: () {
                print("Liked the post: 3");
              },
              icon: Icon(
                Icons.thumb_up,
                size: 30,
              )),
          Text("Hello, welcome to app"),
          TextButton(
              onPressed: () {
                print("I am going to forgot screen");
              },
              child: Text(
                "Forget password?",
                style: TextStyle(),
              )),
          InkWell(
            onTap: () {
              print("I am tapped");
            },
            onDoubleTap: () {
              print("I am double tapped");
            },
            onLongPress: () {
              print("I am long tapped");
            },
            child: Icon(
              Icons.add_reaction,
              size: 60,
            ),
          ),
          InkWell(
            onTap: () {
              print("container tapped");
            },
            child: Container(
              height: 100,
              width: 100,
              color: Colors.green,
            ),
          ),
          InkWell(
              onTap: () {
                print("InkWell");
              },
              child: Text(
                "InkWell -- 2",
                style: TextStyle(fontSize: 30),
              )),
          GestureDetector(
              onTap: () {
                print("GestureDetector");
              },
              child: Text(
                "GestureDetector",
                style: TextStyle(fontSize: 30),
              )),
          ElevatedButton(
              onPressed: () {
                print("Clicked on Registration");
              },
              style: ButtonStyle(
                  // padding: MaterialStateProperty.all(EdgeInsets.zero),
                  padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                  backgroundColor: MaterialStateProperty.all(Colors.yellow)),
              child: Text(
                "Registration",
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
    );
  }

  // addNumber() {}
}
