

class TvShowResponse {
  final int page;
  final int totalResults;
  final int totalPages;
  final List<TvShow> results;

  TvShowResponse({this.page, this.totalResults, this.totalPages, this.results});

  factory TvShowResponse.fromJson(Map<dynamic, dynamic> json) {
    Iterable list = json['results'];
    List<TvShow> shows = list.map((i) => 
           TvShow.fromJson(i)).toList();
    return TvShowResponse(
      page: json['page'],
      totalResults: json['total_results'],
      totalPages: json['total_pages'],
      results: shows,
    );
  }
}


class TvShow {
  final int userId;
  final int id;
  final String title;
  final String releaseDate;
  final String posterPath;

  TvShow({this.userId, this.id, this.title, this.releaseDate, this.posterPath});

  factory TvShow.fromJson(Map<String, dynamic> json) {
    return TvShow(
      userId: json['userId'],
      id: json['id'],
      title: json['name'], 
      releaseDate: json['first_air_date'], 
      posterPath: json['poster_path'], 
    );
  }
}
