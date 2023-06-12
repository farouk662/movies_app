import 'package:dartz/dartz.dart';
import 'package:movies_app/features/movies/data/models/movie_model.dart';

import '../../domain/entities/movie.dart';

abstract class MoviesLocalDataSource{
  Future<List<MovieModel>> getCachedPopularMovies();
  Future<Unit> cacheMovies(List<MovieModel> movies);
}