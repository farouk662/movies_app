import 'package:dio/dio.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/features/movies/data/models/movie_detail_model.dart';
import 'package:movies_app/features/movies/data/models/movie_model.dart';
import 'package:movies_app/features/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/features/movies/domain/use_cases/get_movie_details_use_case.dart';

import '../../../../core/errors/err_message_model.dart';
import '../../../../core/errors/exceptions.dart';

abstract class MoviesRemoteDataSource {
  Future<List<MovieModel>> getPopularMovies();

  Future<List<MovieModel>> getUpcomingMovies();

  Future<List<MovieModel>> getTopRatedMovies();

  Future<List<MovieModel>> getNowPlayingMovies();
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);
}

class MoviesRemoteDataSourceIMP extends MoviesRemoteDataSource {
  @override
  Future<List<MovieModel>> getPopularMovies() async {
    var response = await Dio().get(ApiConstance.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    var response = await Dio().get(ApiConstance.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    var response = await Dio().get(ApiConstance.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
        (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getUpcomingMovies() async{
    var response = await Dio().get(ApiConstance.upComingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List).map(
            (e) => MovieModel.fromJson(e),
      ));
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }


  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters) async{
    var response = await Dio().get(ApiConstance.movieDetailsPath(parameters.id));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

}
