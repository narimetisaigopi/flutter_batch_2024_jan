import 'package:flutter/material.dart';
import 'package:flutter_batch_2024_jan/screens/video_details_screen.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 8, crossAxisCount: 2, childAspectRatio: 1),
            itemBuilder: (ctx, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => VideoDetailsScreen(
                                title: "Grid Item $index",
                              )));
                },
                child: Card(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.home),
                    Text("item $index"),
                  ],
                )),
              );
            })
    );
  }
}
