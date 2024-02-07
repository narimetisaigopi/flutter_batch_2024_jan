import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_batch_2024_jan/screens/video_details_screen.dart';
import 'package:flutter_batch_2024_jan/utilities/utillities.dart';

// ignore: must_be_immutable
class VideosScreen extends StatelessWidget {
  List<String> frameworksList = [
    "jQuery",
    "Express",
    "Angular",
    "Next.js",
    "ASP.Net"
  ];
  List<String> frameworksImagesList = [
    "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Angular_full_color_logo.svg/2048px-Angular_full_color_logo.svg.png",
    "https://i.ytimg.com/vi/Ng2ZWCWNmoU/maxresdefault.jpg",
    "https://i.ytimg.com/vi/Ng2ZWCWNmoU/maxresdefault.jpg",
    "https://i.ytimg.com/vi/Ng2ZWCWNmoU/maxresdefault.jpg",
    "https://i.ytimg.com/vi/Ng2ZWCWNmoU/maxresdefault.jpg"
  ];

  VideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("isMobileScreen : ${Utilities().isMobileScreen(context)}");
    
    
    return Scaffold(
        appBar: kIsWeb | Platform.isWindows
            ? null
            : AppBar(
                // title: Platform.isAndroid ? Text("My List") : null,
                title: Text("My List"),
              ),
        body:
            //Utilities().isMobileScreen(context) ? ListView.builder(
            //     itemCount: frameworksList.length,
            //     itemBuilder: (ctx, index) {
            //       return Card(
            //         child: ListTile(
            //           onTap: () {
            //             onTap(context, index);
            //           },
            //           leading: CircleAvatar(
            //             backgroundImage: CachedNetworkImageProvider(
            //                 frameworksImagesList[index]),
            //           ),
            //           title: Text(frameworksList[index]),
            //           subtitle: Text(
            //             '''Click here for more about ${frameworksList[index]} Click here for more about ${frameworksList[index]} Click here for more about ${frameworksList[index]}''',
            //             textAlign: TextAlign.start,
            //             maxLines: 1,
            //             overflow: TextOverflow.ellipsis,
            //           ),
            //           trailing: const Icon(Icons.settings),
            //         ),
            //       );
            //     })
            // :
            GridView.builder(
                itemCount: frameworksImagesList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio:
                        Utilities().isMobileScreen(context) ? 1.5 : 1,
                    crossAxisCount:
                        Utilities().isMobileScreen(context) ? 1 : 3),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      onTap(context, index);
                    },
                    child: Card(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundImage: CachedNetworkImageProvider(
                                frameworksImagesList[index]),
                          ),
                          Text(
                            frameworksList[index],
                            style: TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                  );
                }));
  }

  onTap(BuildContext context, int index) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => VideoDetailsScreen(
                  title: frameworksList[index],
                  description: frameworksList[index],
                  image: frameworksImagesList[index],
                )));
  }
}
