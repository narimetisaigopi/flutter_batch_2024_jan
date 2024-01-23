import 'package:flutter/material.dart';

class RowColumnStackScreen extends StatelessWidget {
  const RowColumnStackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("RowColumnStackScreen"),
        ),
        // child -> single object (singular)
        // children -> multiple object (plural)

        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              Text("Row"),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.green,
                  ),
                  // Icon(Icons.favorite),
                  // Spacer(),
                  // const SizedBox(
                  //   width: 10,
                  // ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.purple,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.orange,
                  ),
                ],
              ),
              Text("Column"),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.green,
                  ),
                  const SizedBox(
                    width: 10,
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.purple,
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    color: Colors.orange,
                  ),
                ],
              ),
              Text("Stack Widget"),
              Stack(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    color: Colors.deepPurple,
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Container(
                      width: 50,
                      height: 50,
                      color: Colors.teal,
                    ),
                  )
                ],
              )
            ],
          ),
        ));
  }
}
