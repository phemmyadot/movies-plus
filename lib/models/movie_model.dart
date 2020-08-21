class MovieResponse {
  final int page;
  final int totalResults;
  final int totalPages;
  final List<Movie> results;

  MovieResponse({this.page, this.totalResults, this.totalPages, this.results});

  factory MovieResponse.fromJson(Map<dynamic, dynamic> json) {
    Iterable list = json['results'];
    List<Movie> movies = list.map((i) => Movie.fromJson(i)).toList();
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

class MovieDetail {
  final int id;
  final String title;
  final String releaseDate;
  final String posterPath;

  MovieDetail(
      {this.id, this.title, this.releaseDate, this.posterPath});

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    return MovieDetail(
      id: json['id'],
      title: json['title'],
      releaseDate: json['release_date'],
      posterPath: json['poster_path'],
    );
  }
}


class MovieVideoResponse {
  final int id;
  final List<MovieVideo> results;

  MovieVideoResponse({this.id, this.results});

  factory MovieVideoResponse.fromJson(Map<dynamic, dynamic> json) {
    Iterable list = json['results'];
    List<MovieVideo> videos = list.map((i) => MovieVideo.fromJson(i)).toList();
    return MovieVideoResponse(
      id: json['id'],
      results: videos,
    );
  }
}
class MovieVideo {
  final String id;
  final String site;
  final String type;
  final String key;

  MovieVideo(
      {this.id, this.site, this.type, this.key});

  factory MovieVideo.fromJson(Map<String, dynamic> json) {
    return MovieVideo(
      id: json['id'],
      site: json['site'],
      type: json['type'],
      key: json['key'],
    );
  }
}
