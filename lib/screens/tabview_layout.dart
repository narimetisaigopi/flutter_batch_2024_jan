import 'package:flutter/material.dart';

class TabViewLayout extends StatefulWidget {
  const TabViewLayout({super.key});

  @override
  State<TabViewLayout> createState() => _TabViewLayoutState();
}

class _TabViewLayoutState extends State<TabViewLayout>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      print("tabController position ${tabController.index}");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        // DefaultTabController(
        //   length: 3,
        //   child:
        Scaffold(
      appBar: AppBar(
        title: const Text("My Tab Layout"),
        bottom: TabBar(
            onTap: (index) {
              print("tapped on $index");
            },
            controller: tabController,
            isScrollable: false,
            tabs: [
              Tab(
                text: "Flight",
                // icon: Icon(Icons.flight),
              ),
              Tab(
                text: "Train",
                // icon: Icon(Icons.directions_train),
              ),
              Tab(
                text: "Car",
                // icon: Icon(Icons.directions_car),
              ),
              // Tab(
              //   text: "Flight",
              //   // icon: Icon(Icons.flight),
              // ),
              // Tab(
              //   text: "Train",
              //   // icon: Icon(Icons.directions_train),
              // ),
              // Tab(
              //   text: "Car",
              //   // icon: Icon(Icons.directions_car),
              // ),
            ]),
      ),
      body: TabBarView(controller: tabController, children: [
        Column(
          children: [
            Icon(
              Icons.flight,
              size: 300,
            ),
            TextButton(
                onPressed: () {
                  tabController.animateTo(2);
                },
                child: Text("Go Next"))
          ],
        ),
        Icon(
          Icons.directions_train,
          size: 300,
        ),
        Icon(
          Icons.directions_car,
          size: 300,
        ),
      ]),
    );
    // );
  }
}
