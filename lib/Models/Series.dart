class Series {
  bool? adult;
  String? backdropPath;
  int? id;
  String? name;
  String? originalLanguage;
  String? title;
  String? overview;
  String? posterPath;
  String? mediaType;
  List<int>? genreIds;
  double? popularity;
  String? releaseDate;
  double? voteAverage;
  int? voteCount;
  List<String>? originCountry;

  Series(
      {this.adult,
        this.backdropPath,
        this.id,
        this.name,
        this.originalLanguage,
        this.title,
        this.overview,
        this.posterPath,
        this.mediaType,
        this.genreIds,
        this.popularity,
        this.releaseDate,
        this.voteAverage,
        this.voteCount,
        this.originCountry});

  Series.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    name = json['name'];
    originalLanguage = json['original_language'];
    title = json['original_name'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    genreIds = json['genre_ids'].cast<int>();
    popularity = json['popularity'];
    releaseDate = json['first_air_date'];
    voteAverage = json['vote_average'].toDouble();
    voteCount = json['vote_count'];
    originCountry = json['origin_country'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['id'] = this.id;
    data['name'] = this.name;
    data['original_language'] = this.originalLanguage;
    data['original_name'] = this.title;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['media_type'] = this.mediaType;
    data['genre_ids'] = this.genreIds;
    data['popularity'] = this.popularity;
    data['first_air_date'] = this.releaseDate;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    data['origin_country'] = this.originCountry;
    return data;
  }
}
