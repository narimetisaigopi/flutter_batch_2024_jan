import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class VideoDetailsScreen extends StatelessWidget {
  final String title, description, image;
  const VideoDetailsScreen(
      {super.key, this.title = "", this.description = "", this.image = ""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          Card(
            child: CachedNetworkImage(
              imageUrl: image,
              height: 300,
              width: double.infinity,
            ),
          ),
          Text(description)
        ],
      ),
    );
  }
}
