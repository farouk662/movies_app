import 'package:movies_app/features/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.overview,
      required super.date,
      required super.genreIds,
      required super.id,
      required super.image,
      required super.title,
      required super.voteAverage});

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        overview: json['overview'],
        date: json['release_date'],
        genreIds: List<int>.from(json['genre_ids'].map((e)=>e)),
        id: json['id'],
        image: json['poster_path'],
        title: json['overview'],
        voteAverage: json['vote_average'].toDouble());
  }
}
