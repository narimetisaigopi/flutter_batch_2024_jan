import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_batch_2024_jan/constants.dart';
import 'package:flutter_batch_2024_jan/models/movie_model.dart';
import 'package:flutter_batch_2024_jan/networks/movies_apis.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class MoviesListScreen extends StatefulWidget {
  const MoviesListScreen({super.key});

  @override
  State<MoviesListScreen> createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  List<MovieModel> moviesList = [];
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IMDB Top 10 movies"),
      ),
      body: FutureBuilder(
          future: MoviesApi().getMoviesData(),
          builder: (context, snapshot) {
            // when data received
            if (snapshot.hasData) {
              if (snapshot.data != null && snapshot.data!.isNotEmpty) {
                //data state
                List<MovieModel> list = snapshot.data ?? [];
                return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: ((context, index) {
                      MovieModel movieModel = list[index];
                      return movieCard(movieModel);
                    }));
              } else {
                // handle here empty state
              }
            }
            // when got an error
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            // for loading state
            return const Center(child: CircularProgressIndicator());
          }),
      // body: ListView.builder(
      //     itemCount: moviesList.length,
      //     itemBuilder: ((context, index) {
      //       MovieModel movieModel = moviesList[index];
      //       return movieCard(movieModel);
      //     })),
    );
  }

  getData() async {
    http.Response response = await http.get(Uri.parse(Constants.moviesApi));
    if (response.statusCode == 200) {
      List moviesData = jsonDecode(response.body);
      moviesList = moviesData.map((e) => MovieModel.fromJSON(e)).toList();
      // it works same as above map
      // for (var item in moviesData) {
      //   MovieModel movieModel = MovieModel.fromJSON(item);
      //   moviesList.add(movieModel);
      // }
    }
    setState(() {});
  }

  Widget movieCard(MovieModel movieModel) {
    return Card(
        child: Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: CachedNetworkImage(
                        imageUrl: "${Constants.website}/${movieModel.image}",
                        width: 50,
                        height: 50,
                        errorWidget: (context, url, error) => const Icon(
                          Icons.image,
                          size: 32,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 8,
                      child: Row(
                        children: [
                          Expanded(flex: 9, child: Text(movieModel.movie)),
                          const Spacer(),
                          Expanded(
                              flex: 1,
                              child: Text(movieModel.rating.toString())),
                        ],
                      ),
                    ),
                  ],
                ),
                TextButton(
                    onPressed: () {
                      launchUrl(Uri.parse(movieModel.imdb_url),
                          mode: LaunchMode.externalApplication);
                      // final Uri emailLaunchUri = Uri(
                      //   scheme: 'mailto',
                      //   path: 'smith@example.com',
                      //   query: "hello",
                      // );

                      // launchUrl(emailLaunchUri);

                      // final Uri emailLaunchUri = Uri(
                      //   scheme: 'tel',
                      //   path: '959119191',
                      // );

                      // launchUrl(emailLaunchUri);
                    },
                    child: Text("View in IMDB"))
              ],
            )));
  }
}
