import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TodoAPIScreen extends StatefulWidget {
  const TodoAPIScreen({super.key});

  @override
  State<TodoAPIScreen> createState() => _TodoAPIScreenState();
}

class _TodoAPIScreenState extends State<TodoAPIScreen> {
  String data = "NA";
  bool isLoading = false;

  List todoList = [];

  getDataWithSynchronus() {
    // asynchrounus
    http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"))
        .then((value) {
      print(value.statusCode);
      print(value.body);
      data = value.body;
      setState(() {});
    }).onError((error, stackTrace) {});
  }

  getDataWithAsynchronous() async {
    setState(() {
      isLoading = true;
    });
    http.Response response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    // http.Response response2 = await http.post(
    //     Uri.parse("https://jsonplaceholder.typicode.com/posts"),
    //     headers: {"accessToken": ""},
    //     body: {"name": "sai", "sa": "asas"});
    // post response 201 ==> created
    if (response.statusCode == 200) {
      data = response.body;
      // jsonDecode(source) => string to object, for parsing data which we are getting server
      // jsonEncode(object) // => object to string , for sending data to server
      todoList = jsonDecode(data) as List;
      setState(() {});
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // getDataWithSynchronus();
    getDataWithAsynchronous();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Todo"),
          backgroundColor: Colors.teal,
        ),
        body: isLoading
            ? const Center(child: CircularProgressIndicator())
            // : Text(todoList.length.toString()),
            : ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  Map map = todoList[index] as Map;
                  return Card(
                      child: ListTile(
                    leading: CircleAvatar(
                      child: Text(map["id"].toString()),
                    ),
                    title: Text(map["title"].toString()),
                    subtitle: Text(
                      map["body"].toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ));
                }));
  }
}
