class DetailInfo {
  final String? overview;
  final String? posterPath;
  final String? title;
  final List<String> genres;

  DetailInfo({this.overview, this.posterPath, this.title, required this.genres});

  factory DetailInfo.fromJson(Map<String, dynamic> json) {
    List<dynamic> genresResult = json['genres'];
    List<String> genresInfo = List.empty(growable: true);
    for(var info in genresResult) {
      genresInfo.add(info['name']);
    }

    return DetailInfo(
        overview: json['overview'],
        posterPath: 'https://image.tmdb.org/t/p/original/${json['poster_path']}',
        title: json['title'],
        genres: genresInfo
    );
  }
}
