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
  final String backdropPath;

  Movie({
    this.userId,
    this.id,
    this.title,
    this.releaseDate,
    this.posterPath,
    this.backdropPath,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      releaseDate: json['release_date'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
    );
  }
}

class MovieDetail {
  final int id;
  final String title;
  final String releaseDate;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final String status;
  final String link;
  final double rating;
  final List<Genre> genres;

  MovieDetail({
    this.id,
    this.title,
    this.releaseDate,
    this.posterPath,
    this.backdropPath,
    this.overview,
    this.genres,
    this.link,
    this.status,
    this.rating,
  });

  factory MovieDetail.fromJson(Map<String, dynamic> json) {
    Iterable list = json['genres'];
    List<Genre> genres = list.map((i) => Genre.fromJson(i)).toList();
    return MovieDetail(
      id: json['id'],
      title: json['title'],
      genres: genres,
      overview: json['overview'],
      status: json['status'],
      rating: json['vote_average'],
      releaseDate: json['release_date'],
      link: json['homepage'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
    );
  }
}

class Genre {
  final String name;

  Genre({
    this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      name: json['name'],
    );
  }
}
