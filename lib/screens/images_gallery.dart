import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImagesGalleryScreen extends StatelessWidget {
  const ImagesGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        // decoration: const BoxDecoration(
        //     image: DecorationImage(
        //         fit: BoxFit.cover,
        //         image: AssetImage("assets/images/images.jpeg"))),
        child: Column(
          children: [
            // Image.asset(name), // local file that is assets
            // Image.network(name), // image url
            // Image.file(name), // file object
            // Image.memory(name), // file bytes
            Image.asset(
              "assets/images/bg_image.jpg",
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            // Image.asset(
            //   "assets/images/aws_services.png",
            //   width: double.infinity,
            //   height: 300,
            //   fit: BoxFit.fitHeight,
            // ),
            SizedBox(
              height: 20,
            ),
            // NetworkImage
            // Image.network(
            //   "https://w0.peakpx.com/wallpaper/60/636/HD-wallpaper-tree-green-natural-nature-trees-thumbnail.jpg",
            //   height: 200,
            //   width: double.infinity,
            //   fit: BoxFit.cover,
            // ),
            CachedNetworkImage(
              imageUrl:
                  "https://w0.peakpx.com/wallpaper/60/636/HD-wallpaper-tree-green-natural-nature-trees-thumbnail.jpg",
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) {
                return Center(child: Text("Image not found"));
              },
              placeholder: (context, url) {
                // return Center(child: Text("Image Loading"));
                return Center(child: CircularProgressIndicator());
              },
            ),
            const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.blue,
                backgroundImage: CachedNetworkImageProvider(
                    "https://w0.peakpx.com/wallpaper/60/636/HD-wallpaper-tree-green-natural-nature-trees-thumbnail.jpg"))
          ],
        ),
      ),
    );
  }
}
