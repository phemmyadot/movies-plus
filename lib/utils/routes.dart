

import 'package:moviesplus/screens/movies/entry_screen.dart';
import 'package:moviesplus/screens/movies/widgets/details.dart';
import 'package:moviesplus/screens/tv_shows/entry_screen.dart';
import 'package:moviesplus/screens/tv_shows/widgets/details.dart';

final routes = {
  MoviesEntryScreen.routeName: (ctx) => MoviesEntryScreen(),
  TvShowsEntryScreen.routeName: (ctx) => TvShowsEntryScreen(),
  MovieDetails.routeName: (ctx) => MovieDetails(),
  TvShowDetails.routeName: (ctx) => TvShowDetails(),
};
