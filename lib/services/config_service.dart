import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moviesplus/models/config_model.dart';

Future<ConfigurationResponse> fetchConfigurations() async {
  final response = await http.get(
      'https://api.themoviedb.org/3/configuration?api_key=3c9086e443d538d7168dc3af18f638e2');

  if (response.statusCode == 200) {
    return ConfigurationResponse.fromJson(json.decode(response.body)['images']);
  } else {
    throw Exception('Failed to load Movie');
  }
}
 