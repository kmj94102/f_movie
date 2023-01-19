import 'package:f_movie/data/movie_list_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkUtil {
  final _apiKey = "2d40e399b0f2a4082fa534579a47050f";

  Future<List<MovieListItem>> fetchMovieList() async {
    String url = "https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&language=ko-KR&page=1";
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {
      List<dynamic> results = jsonDecode(response.body)['results'];
      List<MovieListItem> list = List.empty(growable: true);
      for (var result in results) {
        list.add(MovieListItem.fromJson(result));
      }
      return list;
    } else {
      return throw Exception('Failed to load movie list');
    }
  }
}