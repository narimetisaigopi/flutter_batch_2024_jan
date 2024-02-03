import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Disable touch for itself and its subtree
          IgnorePointer(
            ignoring: true,
            child: TextButton(
                onPressed: () {
                  print("i am clciked");
                },
                child: Text("View videos(IgnorePointer)")),
          ),
          //Only disable touch for subtree but allows to its childerns
          AbsorbPointer(
            absorbing: false,
            child: TextButton(
                onPressed: () {
                  print("i am clciked");
                },
                child: Text("View videos(AbsorbPointer)")),
          ),
          const Placeholder(
            fallbackWidth: 100,
            fallbackHeight: 100,
            // child: Text("Comming Soon"),
          )
        ],
      ),
    );
  }
}
