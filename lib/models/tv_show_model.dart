

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


class TvShowDetail {
  final int id;
  final String name;
  final String releaseDate;
  final String lastAirDate;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final String status;
  final String link;
  final Episode lastEpisode;
  final Episode nextEpisode;
  final double rating;
  final List<Genre> genres;
  final List<Season> seasons;

  TvShowDetail({
    this.id,
    this.name,
    this.releaseDate,
    this.posterPath,
    this.backdropPath,
    this.overview,
    this.genres,
    this.link,
    this.status,
    this.rating,
    this.lastAirDate,
    this.seasons,
    this.lastEpisode,
    this.nextEpisode,
  });

  factory TvShowDetail.fromJson(Map<String, dynamic> json) {
    Iterable list = json['genres'];
    Iterable list2 = json['seasons'];
    Episode next = json['next_episode_to_air'] != null ? Episode.fromJson(json['next_episode_to_air']) : null;
    Episode last = json['last_episode_to_air'] != null ? Episode.fromJson(json['last_episode_to_air']) : null;
    List<Genre> genres = list.map((i) => Genre.fromJson(i)).toList();
    List<Season> seasons = list2.map((i) => Season.fromJson(i)).toList();
    return TvShowDetail(
      id: json['id'],
      name: json['name'],
      genres: genres,
      overview: json['overview'],
      status: json['status'],
      rating: json['vote_average'],
      releaseDate: json['first_air_date'],
      lastAirDate: json['last_air_date'],
      link: json['homepage'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      lastEpisode: last,
      nextEpisode: next,
      seasons: seasons
    );
  }
}

class Genre {
  // final int id;
  final String name;

  Genre({
    // this.id,
    this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      name: json['name'],
    );
  }
}

class Season {
  final String name;
  final String date;
  final String overview;
  final int episodeCount;
  final int id;
  final int seasonNumber;

  Season({
    this.name,
    this.date,
    this.episodeCount,
    this.id,
    this.overview,
    this.seasonNumber,
  });

  factory Season.fromJson(Map<String, dynamic> json) {
    return Season(
      name: json['name'],
      date: json['air_date'],
      episodeCount: json['episode_count'],
      id: json['id'],
      overview: json['overview'],
      seasonNumber: json['season_number'],
    );
  }
}

class Episode {
  final String name;
  final int number;
  final String date;

  Episode({
    this.name,
    this.number,
    this.date,
  });

  factory Episode.fromJson(Map<String, dynamic> json) {
    return Episode(
      name: json['name'],
      number: json['episode_number'],
      date: json['air_date'],
    );
  }
}
