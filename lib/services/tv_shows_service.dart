import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moviesplus/models/tv_show_model.dart';

Future<TvShowResponse> fetchPopularTvShows() async {
  final response = await http.get(
      'https://api.themoviedb.org/3/tv/popular?api_key=3c9086e443d538d7168dc3af18f638e2&language=en-US&page=1');

  if (response.statusCode == 200) {
    return TvShowResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Tv Show');
  }
}

Future<TvShowResponse> fetchTopRatedTvShows() async {
  final response = await http.get(
      'https://api.themoviedb.org/3/tv/top_rated?api_key=3c9086e443d538d7168dc3af18f638e2&language=en-US&page=1');
  if (response.statusCode == 200) {
    return TvShowResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Tv Show');
  }
}

Future<TvShowResponse> fetchUpcomingTvShows() async {
  final response = await http.get(
      'https://api.themoviedb.org/3/tv/airing_today?api_key=3c9086e443d538d7168dc3af18f638e2&language=en-US&page=1');
  if (response.statusCode == 200) {
    return TvShowResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Tv Show');
  }
}

Future<TvShowResponse> searchTvShows(query) async {
  final response = await http.get(
      'https://api.themoviedb.org/3/search/tv?api_key=3c9086e443d538d7168dc3af18f638e2&page=1&query=$query');
  if (response.statusCode == 200) {
    return TvShowResponse.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Tv Show');
  }
}


Future<TvShowDetail> fetchTvShow(id) async {
  final response = await http.get(
      'https://api.themoviedb.org/3/tv/$id?api_key=3c9086e443d538d7168dc3af18f638e2&language=en-US');
  if (response.statusCode == 200) {
    return TvShowDetail.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load Tv Show');
  }
}