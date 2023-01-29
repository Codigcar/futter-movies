import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/credits_response.dart';
import 'package:peliculas/models/index.dart';
import 'package:peliculas/models/search_response.dart';

class MoviesProvider extends ChangeNotifier {
  final _apiKey = 'c5f05ce60b0143810180dbb335284aef';
  final _baseUrl = 'api.themoviedb.org';
  final _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> moviesCast = {};

  int _popularPage = 0;

  MoviesProvider() {
    print('Movies Provider initialized');

    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });

    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {
    // var url = Uri.https(_baseUrl, '/3/movie/now_playing', {
    //   'api_key': _apiKey,
    //   'language': _language,
    //   'page': '1',
    // });

    // final response = await http.get(url);
    final response = await _getJsonData('/3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(response);
    // final Map<String, dynamic> decodedData = json.decode(response.body);
    // print('getOnDisplayMovies: ${response.body}');
    onDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async {
    // var url = Uri.https(_baseUrl, '/3/movie/now_playing', {
    //   'api_key': _apiKey,
    //   'language': _language,
    //   'page': '1',
    // });

    // final response = await http.get(url);
    _popularPage++;
    final response = await _getJsonData('/3/movie/now_playing', _popularPage);
    final popularResponse = PopularResponse.fromJson(response);
    popularMovies = [...popularMovies, ...popularResponse.results];
    // print(popularMovies[0].id);
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;

    final jsonData = await this._getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);
    moviesCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovies(String query) async {
    final url = Uri.https(_baseUrl, '3/search/movie',
        {'api_key': _apiKey, 'language': _language, 'query': query});

    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson(response.body);
    return searchResponse.results;
  }
}
