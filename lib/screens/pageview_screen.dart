import 'package:flutter/material.dart';

class PageViewScreen extends StatelessWidget {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pageview Layout"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            pageController.nextPage(
                duration: Duration(seconds: 3), curve: Curves.easeInExpo);
            // pageController.jumpTo(1);
          },
          child: Icon(Icons.skip_next)),
      body: PageView(
        onPageChanged: (value) {
          print("onPageChanged ${value}");
        },
        controller: pageController,
        scrollDirection: Axis.vertical,
        children: [
          myPage(0),
          myPage(1),
          myPage(2),
          myPage(3),
        ],
      ),
    );
  }

  Widget myPage(int index) {
    return Center(
        child: Text(
      "Page $index",
      style: const TextStyle(fontSize: 40),
    ));
  }
}
