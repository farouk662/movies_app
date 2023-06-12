import 'package:dartz/dartz.dart';
import 'package:movies_app/features/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/features/movies/domain/use_cases/get_movie_details_use_case.dart';

import '../../../../core/errors/failure.dart';
import '../entities/movie.dart';


abstract class MoviesRepo{
  Future<Either<Failure,List<Movie>>> getPopularMovies();
  Future<Either<Failure,List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure,List<Movie>>> getTopRatedMovies();
  Future<Either<Failure,List<Movie>>> getUpcomingMovies();
  Future<Either<Failure,MovieDetail>> getMovieDetails(MovieDetailsParameters parameters);
}