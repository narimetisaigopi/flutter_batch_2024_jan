import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_batch_2024_jan/main.dart';
import 'package:flutter_batch_2024_jan/screens/api/movies_list_screen.dart';
import 'package:flutter_batch_2024_jan/screens/api/todo_api_screen.dart';
import 'package:flutter_batch_2024_jan/screens/change_langauge_screen.dart';
import 'package:flutter_batch_2024_jan/screens/dashboard/dashhome_screen.dart';
import 'package:flutter_batch_2024_jan/screens/dashboard/subscription_screen.dart';
import 'package:flutter_batch_2024_jan/screens/dashboard/videos_screen.dart';
import 'package:flutter_batch_2024_jan/screens/home_screen.dart';
import 'package:flutter_batch_2024_jan/screens/layout_builder_screen.dart';
import 'package:flutter_batch_2024_jan/screens/pageview_screen.dart';
import 'package:flutter_batch_2024_jan/screens/profile_screen.dart';
import 'package:flutter_batch_2024_jan/screens/provider_screens/shopping_items.dart';
import 'package:flutter_batch_2024_jan/screens/razorpay_subscription.dart';
import 'package:flutter_batch_2024_jan/screens/splash_screen.dart';
import 'package:flutter_batch_2024_jan/screens/tabview_layout.dart';
import 'package:flutter_batch_2024_jan/utilities/shared_preferance_utils.dart';
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
    // DashHomeScreen(),
    LayoutBuilderScreen(),
    VideosScreen(),
    SubscriptionScreen(),
    ProfileScreen(),
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String loggedInMobileNumber = "";

  @override
  void initState() {
    bool? data = sharedPreferences.getBool("isUserLogin");
    loggedInMobileNumber = sharedPreferences.getString("mobile") ?? "";
    print("data ${data}");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.setLocale(Locale(SharedPreferanceUtils().getLanguage()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          // // custom drawer icon: ref: https://stackoverflow.com/questions/47435231/open-drawer-on-clicking-appbar
          // leading: InkWell(
          //     onTap: () {
          //       _scaffoldKey.currentState!.openDrawer();
          //     },
          //     child: Icon(Icons.home)),
          backgroundColor: Colors.teal,
          // title: const Text("Dashboard Screen"),
          title: Text("Hello, $loggedInMobileNumber"),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (builder) => ChangeLanguageScreen()));
              },
              child: const Icon(
                Icons.language,
                color: Colors.white,
              ),
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
                                onPressed: () async {
                                  // await sharedPreferences.setString(
                                  //     "mobile", "");
                                  // await sharedPreferences.setBool(
                                  //     "isUserLogin", false);
                                  await sharedPreferences.clear();
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              title: "Subscription",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (ctx) => RazorpaySubscription()));
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
              title: "TODO API",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => TodoAPIScreen()));
              },
            ),
            DrawerItemWidget(
              title: "Provider",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => ShoppingItems()));
              },
            ),
            DrawerItemWidget(
              title: "Movies APIS",
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => MoviesListScreen()));
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
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "home".tr()),
            BottomNavigationBarItem(
                icon: Icon(Icons.play_circle_rounded), label: "videos".tr()),
            BottomNavigationBarItem(
                icon: Icon(Icons.subscriptions_sharp),
                label: "subscriptions".tr()),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "profile".tr()),
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
      ),
    );
  }
}
