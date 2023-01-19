class MovieListItem {
  final String? posterPath;
  final String? title;
  final int? id;
  final num? voteAverage;

  MovieListItem({
    this.posterPath,
    this.title,
    this.id,
    this.voteAverage
  });

  factory MovieListItem.fromJson(Map<String, dynamic> json) {
    return MovieListItem(
      posterPath: json['poster_path'],
      title: json['title'],
      id: json['id'],
      voteAverage: json['vote_average'],
    );
  }

  Map<String, dynamic> toJson() => {
    "poster_path": posterPath,
    "title": title,
    "id": id,
    "vote_average": voteAverage
  };

  String getPosterImage() {
    return "https://image.tmdb.org/t/p/original/$posterPath";
  }
}