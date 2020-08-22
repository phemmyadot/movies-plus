import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moviesplus/models/movie_model.dart';

Future<MovieResponse> fetchPopularMovies() async {
  final response = await http.get(
      'https://api.themoviedb.org/3/movie/popular?api_key=3c9086e443d538d7168dc3af18f638e2&language=en-US&page=1');

  if (response.statusCode == 200) {
    return MovieResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Movie');
  }
}

Future<MovieResponse> fetchTopRatedMovies() async {
  final response = await http.get(
      'https://api.themoviedb.org/3/movie/top_rated?api_key=3c9086e443d538d7168dc3af18f638e2&language=en-US&page=1');
  if (response.statusCode == 200) {
    return MovieResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Movie');
  }
}

Future<MovieResponse> fetchUpcomingMovies() async {
  final response = await http.get(
      'https://api.themoviedb.org/3/movie/upcoming?api_key=3c9086e443d538d7168dc3af18f638e2&language=en-US&page=1');
  if (response.statusCode == 200) {
    return MovieResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Movie');
  }
}

Future<MovieResponse> searchMovies(query) async {
  final response = await http.get(
      'https://api.themoviedb.org/3/search/movie?api_key=3c9086e443d538d7168dc3af18f638e2&language=en-US&query=$query&page=1');
  if (response.statusCode == 200) {
    return MovieResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Movie');
  }
}

Future<MovieDetail> fetchMovie(id) async {
  final response = await http.get(
      'https://api.themoviedb.org/3/movie/$id?api_key=3c9086e443d538d7168dc3af18f638e2&language=en-US');
  if (response.statusCode == 200) {
    return MovieDetail.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Movie');
  }
}