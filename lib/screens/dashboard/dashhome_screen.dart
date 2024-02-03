import 'package:flutter/material.dart';

class DashHomeScreen extends StatelessWidget {
  const DashHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: ListView(
        //   children: [
        //     myContainer(
        //       index: 0,
        //     ),
        //     myContainer(index: 1, color: Colors.white),
        //     myContainer(
        //       index: 2,
        //     ),
        //   ],
        // ),
        //     body: ListView.builder(
        //   itemCount: 99,
        //   itemBuilder: (context, index) {
        //     return myContainer(index: index);
        //   },
        // )
        body: Scrollbar(
        thickness: 10,
      child: ListView.separated(
        itemCount: 99,
        itemBuilder: (context, index) {
          return myContainer(index: index);
        },
        separatorBuilder: (BuildContext context, int index) {
          // return Divider(
          //   height: 10,
          //   color: Colors.red,
          // );
          return Container(
            color: index % 2 == 0 ? Colors.red : Colors.yellow,
            height: 8,
            width: double.infinity,
          );
        },
      ),
    ));
  }

  Widget myContainer({required int index, Color color = Colors.green}) {
    return Container(
      color: color,
      height: 300,
      width: double.infinity,
      child: Center(
          child: Text(
        "$index",
        style: const TextStyle(fontSize: 120),
      )),
    );
  }
}
