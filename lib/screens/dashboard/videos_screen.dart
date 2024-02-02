import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_batch_2024_jan/screens/video_details_screen.dart';

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
    return Scaffold(
        body: ListView.builder(
            itemCount: frameworksList.length,
            itemBuilder: (ctx, index) {
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => VideoDetailsScreen(
                                  title: frameworksList[index],
                                  description: frameworksList[index],
                                  image: frameworksImagesList[index],
                                )));
                  },
                  leading: CircleAvatar(
                    backgroundImage:
                        CachedNetworkImageProvider(frameworksImagesList[index]),
                  ),
                  title: Text(frameworksList[index]),
                  subtitle: Text(
                    '''Click here for more about ${frameworksList[index]} Click here for more about ${frameworksList[index]} Click here for more about ${frameworksList[index]}''',
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  trailing: const Icon(Icons.settings),
                ),
              );
            }));
  }
}
