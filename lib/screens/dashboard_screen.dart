import 'package:flutter/material.dart';
import 'package:flutter_batch_2024_jan/screens/dashboard/dashhome_screen.dart';
import 'package:flutter_batch_2024_jan/screens/dashboard/subscription_screen.dart';
import 'package:flutter_batch_2024_jan/screens/dashboard/videos_screen.dart';
import 'package:flutter_batch_2024_jan/screens/home_screen.dart';
import 'package:flutter_batch_2024_jan/screens/pageview_screen.dart';
import 'package:flutter_batch_2024_jan/screens/profile_screen.dart';
import 'package:flutter_batch_2024_jan/screens/splash_screen.dart';
import 'package:flutter_batch_2024_jan/screens/tabview_layout.dart';
import 'package:flutter_batch_2024_jan/widgets/drawer_item_widget.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = "/DashboardScreen";
  String email;
  String name;

  DashboardScreen({required this.email, this.name = ""});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 1;

  List dashboardScreens = [
    DashHomeScreen(),
    VideosScreen(),
    SubscriptionScreen(),
    ProfileScreen(),
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        // // custom drawer icon: ref: https://stackoverflow.com/questions/47435231/open-drawer-on-clicking-appbar
        // leading: InkWell(
        //     onTap: () {
        //       _scaffoldKey.currentState!.openDrawer();
        //     },
        //     child: Icon(Icons.home)),
        backgroundColor: Colors.teal,
        title: const Text("Dashboard Screen"),
        actions: [
          const Icon(
            Icons.search_outlined,
            color: Colors.white,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                  // isDismissible: false,
                  // enableDrag: false,
                  context: context,
                  builder: (ctx) {
                    return Container(
                      height: 250,
                      child: Column(
                        children: [
                          const Text("Filter Data"),
                          const ListTile(
                            leading: CircleAvatar(),
                            title: Text("Filter By Name"),
                          ),
                          const ListTile(
                            leading: CircleAvatar(),
                            title: Text("Filter By Price"),
                          ),
                          const ListTile(
                            leading: CircleAvatar(),
                            title: Text("Filter By Age"),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Close"))
                        ],
                      ),
                    );
                  });
            },
            child: Icon(
              Icons.filter_alt,
              color: Colors.white,
            ),
          ),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return AlertDialog(
                        title: Text("Logout"),
                        content: Text("Do you really want to logout?"),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("No")),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => SplashScreen()),
                                    (route) => false);
                              },
                              child: Text("Yes")),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Not so"))
                        ],
                      );
                    });
              },
              icon: const Icon(
                Icons.logout_outlined,
                color: Colors.red,
              ))
        ],
      ),
      drawer: Drawer(
        // width: 300,
        backgroundColor: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: double.infinity,
            child: DrawerHeader(
              decoration: BoxDecoration(color: Colors.green),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 34,
                    child: Text("F&D"),
                  ),
                  Text("Flutter & Dart"),
                ],
              ),
            ),
          ),
          DrawerItemWidget(
            title: "Home",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => DashHomeScreen()));
            },
          ),
          DrawerItemWidget(
            title: "Tab Layout",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => TabViewLayout()));
            },
          ),
          DrawerItemWidget(
            title: "PageView Layout",
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => PageViewScreen()));
            },
          ),
          DrawerItemWidget(
            title: "Logout",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ]),
      ),
      // endDrawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (position) {
          print("position ${position}");
          currentIndex = position;
          setState(() {});
        },
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_rounded), label: "Videos"),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions_sharp), label: "Subscptions"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: dashboardScreens[currentIndex],
      // body: Column(children: [
      //   Text("Logged in as ${widget.email}"),
      //   // ElevatedButton(
      //   //     onPressed: () {
      //   //       Navigator.pop(context);
      //   //     },
      //   //     child: Text("Go Back"))
      //   // ElevatedButton(
      //   //     onPressed: () {
      //   //       // Navigator.of(context).pushAndRemoveUntil(
      //   //       //     MaterialPageRoute(builder: (ctx) => SplashScreen()),
      //   //       //     (route) => false);
      //   //       Navigator.pushAndRemoveUntil(
      //   //           context,
      //   //           MaterialPageRoute(builder: (ctx) => SplashScreen()),
      //   //           (route) => false);
      //   //     },
      //   //     child: Text("Logout"))
      // ]),
    );
  }
}
