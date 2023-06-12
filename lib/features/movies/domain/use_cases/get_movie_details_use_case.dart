import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/errors/failure.dart';
import 'package:movies_app/core/utlis/base_use_case.dart';
import 'package:movies_app/features/movies/domain/entities/movie.dart';
import 'package:movies_app/features/movies/domain/entities/movie_detail.dart';

import '../repositories/movies_repo.dart';

class GetMovieDetailsUseCase
    extends BaseUseCase<MovieDetail, MovieDetailsParameters> {
  final MoviesRepo _moviesRepo;

  GetMovieDetailsUseCase(this._moviesRepo);

  @override
  Future<Either<Failure, MovieDetail>> call(
      MovieDetailsParameters parameter) async {
    return await _moviesRepo.getMovieDetails(parameter);
  }
}

class MovieDetailsParameters extends Equatable {
  final int id;

  const MovieDetailsParameters({required this.id});

//this class make me can add parameters in use case without error in other use case

  @override
  List<Object?> get props => [id];
}
