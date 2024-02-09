// {
//     "id": 1,
//     "movie": "The Shawshank Redemption",
//     "rating": 9.2,
//     "image": "images/shawshank.jpg",
//     "imdb_url": "https://www.imdb.com/title/tt0111161/"
//   },
class MovieModel {
  // 1st step: create variables for params
  int id = 0;
  String movie;
  double rating;
  String image;
  String imdb_url;
  // 2nd: create constructor
  MovieModel({
    this.id = 0,
    this.movie = "",
    this.rating = 0.0,
    this.image = "",
    this.imdb_url = "",
  });
  // 3rd: factory method for parsing and returning class object
  factory MovieModel.fromJSON(Map map) {
    return MovieModel(
        id: map['id'] ?? 0,
        movie: map['movie'] ?? "",
        rating: double.parse("${map['rating']}") ?? 0.0,
        image: map['image'] ?? "",
        imdb_url: map['imdb_url'] ?? "");
  }
}
