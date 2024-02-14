import 'package:flutter/material.dart';
import 'package:flutter_batch_2024_jan/controllers/my_getx_controller.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class GetxScreen extends StatefulWidget {
  const GetxScreen({super.key});

  @override
  State<GetxScreen> createState() => _GetxScreenState();
}

class _GetxScreenState extends State<GetxScreen> {
  MyGetxController myGetxController = Get.put(MyGetxController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Getx"),
      ),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                // ScaffoldMessenger.of(context)
                //     .showSnackBar(SnackBar(content: Text("I am snackbar")));
                Get.showSnackbar(const GetSnackBar(
                  message: "I am ",
                ));
              },
              child: Text("Show Snackbar")),
          ElevatedButton(
              onPressed: () {
                Get.defaultDialog(title: "Default");
              },
              child: Text("Show Dialog")),
          ElevatedButton(
              onPressed: () {
                Get.changeTheme(ThemeData.dark());
              },
              child: Text("Change to dark theme")),
          ElevatedButton(
              onPressed: () {
                Get.changeTheme(ThemeData.light());
              },
              child: Text("Change to light theme")),
          GetBuilder<MyGetxController>(builder: (myGetxController) {
            return Text(
              myGetxController.count.toString(),
              style: TextStyle(fontSize: 100),
            );
          }),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    myGetxController.increaseCount();
                  },
                  child: Text("Increase")),
              ElevatedButton(
                  onPressed: () {
                    myGetxController.decrementCount();
                  },
                  child: Text("Decrease")),
            ],
          )
        ],
      ),
    );
  }
}
