class MovieModel{
  final int id;
  final String title;
  final String nameTvShow;
  final String poster;
  final dynamic average;
  final String description;
  final String date;
  final String dateTvShow;
  final String actors;
  final String genres;

  MovieModel({
    this.id,
    this.title,
    this.nameTvShow,
    this.poster,
    this.average,
    this.description,
    this.date,
    this.dateTvShow,
    this.actors,
    this.genres,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json){
    return MovieModel(
      id: json['id'] as int,
      title: json['original_title'] as String,
      nameTvShow : json['original_name'] as String,
      poster: json['poster_path'] as String,
      average: json['vote_average'] as dynamic,
      description: json['overview'] as String,
      date: json['release_date'] as String,
      dateTvShow: json['first_air_date'] as String,
      actors: json['name'] as String,
      genres: json['name'] as String,
    );
  }
}

