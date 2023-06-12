import 'package:dartz/dartz.dart';
import 'package:movies_app/core/errors/exceptions.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/utlis/internet_connection_checker.dart';
import 'package:movies_app/features/movies/data/data_sources/remote_data_sorce.dart';
import 'package:movies_app/features/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/features/movies/domain/repositories/movies_repo.dart';
import 'package:movies_app/features/movies/domain/use_cases/get_movie_details_use_case.dart';

import '../../domain/entities/movie.dart';
import '../data_sources/local_data_source.dart';

class MovieRepoImp implements MoviesRepo {
  final MoviesRemoteDataSource _moviesRemoteDataSource;
  // final MoviesLocalDataSource _moviesLocalDataSource;
  // InternetConnection internetConnection;
  MovieRepoImp(this._moviesRemoteDataSource);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await _moviesRemoteDataSource.getNowPlayingMovies();
    try {
      return Right(result );
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    
    try {
      final result = await _moviesRemoteDataSource.getPopularMovies();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await _moviesRemoteDataSource.getTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getUpcomingMovies() async {
    final result = await _moviesRemoteDataSource.getUpcomingMovies();
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(MovieDetailsParameters parameters) async{
    final result = await _moviesRemoteDataSource.getMovieDetails(parameters);
    try {
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.errorMessageModel.statusMessage));
    }
  }
}
