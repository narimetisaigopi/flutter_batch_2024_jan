import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  Color myContainerColor = Colors.green;
  int count = 0;
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
        title: Text("Counter Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // count = count + 1;
          // count += 1;

          setState(() {
            count++; // increment
          });
          print("count is $count");
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 32,
            child: Text(
              "$count",
              style: TextStyle(fontSize: 32),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 100,
            height: 100,
            color: myContainerColor,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  myContainerColor = Colors.yellow;
                  print("color changed to yellow");
                });
              },
              child: Text("Change Color to yellow")),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  myContainerColor = Colors.red;
                });
                print("color changed to red");
              },
              child: Text("Change Color to red")),
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(covariant CounterScreen oldWidget) {
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
