import 'package:dartz/dartz.dart';
import 'package:movies_app/core/utlis/base_use_case.dart';
import 'package:movies_app/features/movies/domain/repositories/movies_repo.dart';

import '../../../../core/errors/failure.dart';
import '../entities/movie.dart';


class GetTopRatedUseCase extends BaseUseCase<List<Movie>,NoParameter>{
  final MoviesRepo _moviesRepo;

  GetTopRatedUseCase(this._moviesRepo);

  @override
  Future<Either<Failure,List<Movie>>> call(NoParameter parameter)async{
    return await _moviesRepo.getTopRatedMovies();
  }
}