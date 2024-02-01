import 'package:flutter/material.dart';
import 'package:flutter_batch_2024_jan/screens/dashboard_screen.dart';
import 'package:flutter_batch_2024_jan/screens/registration_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController phoneTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
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
                  style: GoogleFonts.inter(fontSize: 12).copyWith(fontSize: 30),
                )),
            GestureDetector(
                onTap: () {
                  print("GestureDetector");
                },
                child: Text(
                  "GestureDetector",
                  style: TextStyle(fontSize: 30, fontFamily: "SingleDay"),
                )),

            const Align(
                alignment: Alignment.topLeft,
                child: Text("Enter Phone Number")),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: phoneTextEditingController,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                obscureText: false,
                enabled: true,
                decoration: const InputDecoration(
                    hintStyle: TextStyle(color: Colors.black),
                    hintText: "Enter Phone Number",
                    labelText: "Phone Number",
                    prefixIcon: Icon(Icons.phone_android),
                    prefixIconColor: Colors.black,
                    suffix: Icon(Icons.close),
                    focusColor: Colors.green,
                    counterStyle: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                    // counterText: "", if you dont want show count below inputfield
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)))),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  print("Clicked on Registration");
                  // Navigator.of(context).pushAndRemoveUntil(
                  //     MaterialPageRoute(
                  //         builder: (ctx) => DashboardScreen(
                  //               email: phoneTextEditingController.text,
                  //             )),
                  //     (route) => false);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      DashboardScreen.routeName, (route) => false,
                      arguments: [phoneTextEditingController.text, "Sai"]);
                },
                style: ButtonStyle(
                    // padding: MaterialStateProperty.all(EdgeInsets.zero),
                    padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                    backgroundColor: MaterialStateProperty.all(Colors.yellow)),
                child: const Text(
                  "Login",
                  style: TextStyle(color: Colors.black),
                )),

            TextButton(
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (ctx) => RegistrationScreen()));

                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (ctx) => RegistrationScreen()));
                },
                child: Text("Don't you have account?"))
            // const Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: TextField(
            //     minLines: 3,
            //     maxLines: 5,
            //     decoration: InputDecoration(
            //         hintStyle: TextStyle(color: Colors.black),
            //         hintText: "Enter Bio Data",
            //         labelText: "Bio Data",
            //         counterStyle: TextStyle(
            //           color: Colors.green,
            //           fontWeight: FontWeight.bold,
            //         ),
            //         // counterText: "", if you dont want show count below inputfield
            //         border: OutlineInputBorder()),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  // addNumber() {}
}
