import 'package:f_movie/data/detail_info.dart';
import 'package:f_movie/data/movie_list_item.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkUtil {
  final _apiKey = "api_key=2d40e399b0f2a4082fa534579a47050f";
  final _baseUrl = "https://api.themoviedb.org/3";
  final _languageInfo = "language=ko-KR";

  Future<List<MovieListItem>> fetchMovieList() async {
    String url = "$_baseUrl/movie/popular?$_apiKey&$_languageInfo&page=1";
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

  Future<DetailInfo> fetchMovieDetail(int movieId) async {
    String url = "$_baseUrl/movie/$movieId?$_apiKey&$_languageInfo";
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode == 200) {
      return DetailInfo.fromJson(jsonDecode(response.body));
    } else {
      return throw Exception('failed to load movie detail');
    }
  }
}