import 'dart:convert';

import 'package:api_practice/models/popmovies_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseURL = "https://movies-api.nomadcoders.workers.dev";
  static const String popular = "popular";

  static Future<List<PopMoviesModel>> getPopMovies() async {
    List<PopMoviesModel> popmovieInstances = [];
    final url = Uri.parse('$baseURL/$popular');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final List<dynamic> popmovies =
          responseData['results']; // Use 'results' key
      // for (var popmovie in popmovies) {
      //   // Now 'popmovie' is an individual movie in the list
      //   print(popmovie['title']); // Access specific fields, e.g., 'title'
      // }
      // final List<dyna mic> popmovies = jsonDecode(response.body);
      for (var popmovie in popmovies) {
        popmovieInstances.add(
          PopMoviesModel.fromJson(popmovie),
        );
        // final popularmovies = PopMoviesModel.fromJson(popmovie);
        // print(popularmovies.title);
      }
      return popmovieInstances;
    }
    throw Error();
  }
}
