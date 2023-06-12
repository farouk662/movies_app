import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final String image;
  final String title;
  final String date;
  final String overview;
  final double voteAverage;
  final int id;
  final List<int> genreIds;

  const Movie(
      {required this.overview,
      required this.date,
      required this.genreIds,
      required this.id,
      required this.image,
      required this.title,
      required this.voteAverage});

  @override
  List<Object?> get props =>
      [title, image, id, genreIds, date, voteAverage, overview];
}
