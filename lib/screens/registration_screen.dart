import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  void initState() {
    print("initState called");
    // calls only once

    // api data fetching, runtime permission, locations, etc
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // call mutlple times
    print("didChangeDependencies called");
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("build called");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant RegistrationScreen oldWidget) {
    print("didUpdateWidget called");
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print("dispose called");
    // close all the resource
    // TODO: implement dispose
    super.dispose();
  }
}
