

class MovieResponse {
  final int page;
  final int totalResults;
  final int totalPages;
  final List<Movie> results;

  MovieResponse({this.page, this.totalResults, this.totalPages, this.results});

  factory MovieResponse.fromJson(Map<dynamic, dynamic> json) {
    Iterable list = json['results'];
    List<Movie> movies = list.map((i) => 
           Movie.fromJson(i)).toList();
    return MovieResponse(
      page: json['page'],
      totalResults: json['total_results'],
      totalPages: json['total_pages'],
      results: movies,
    );
  }
}


class Movie {
  final int userId;
  final int id;
  final String title;
  final String releaseDate;
  final String posterPath;

  Movie({this.userId, this.id, this.title, this.releaseDate, this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      userId: json['userId'],
      id: json['id'],
      title: json['title'], 
      releaseDate: json['release_date'], 
      posterPath: json['poster_path'], 
    );
  }
}
