import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utlis/base_use_case.dart';
import 'package:movies_app/features/movies/domain/use_cases/get_popular_movies_use_case.dart';

import '../../domain/entities/movie.dart';
import '../../domain/use_cases/get_now_playing_movies_use_case.dart';
import '../../domain/use_cases/get_top_rated_movies_use_case.dart';
import '../../domain/use_cases/get_upcoming_movies_use_case.dart';

part 'movies_state.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit(this._getPopularUseCase, this._getTopRatedUseCase,
      this._getUpComingUseCase, this._getNowPlayingUseCase)
      : super(MoviesInitial());
  final GetPopularUseCase _getPopularUseCase;
  final GetTopRatedUseCase _getTopRatedUseCase;
  final GetUpComingUseCase _getUpComingUseCase;
  final GetNowPlayingUseCase _getNowPlayingUseCase;

  static MoviesCubit get(context) => BlocProvider.of(context);
  List<Movie> upcomingMovies = [];
  List<Movie> topRatedMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> nowPlayingMovies = [];

  Future<void> getPopularMovies() async {
    emit(GetPopularMoviesLoadingState());
    var result = await _getPopularUseCase(const NoParameter());
    result.fold((l) {
      emit(GetPopularMoviesErrorState(l.message));
    }, (r) {
      // r.map((e) => popularMovies.add(e));
      for (var i in r) {
        popularMovies.add(i);
      }
      emit(GetPopularMoviesSuccessState(r));
    });
  }

  Future<void> getUpcomingMovies() async {
    emit(GetUpcomingMoviesLoadingState());
    var result = await _getUpComingUseCase(const NoParameter());
    result.fold((l) {
      emit(GetUpcomingMoviesErrorState(l.message));
    }, (r) {
      for (var element in r) {
        upcomingMovies.add(element);
      }

      emit(GetUpcomingMoviesSuccessState(r));
    });
  }

  Future<void> getTopRatedMovies() async {
    emit(GetTopRatedMoviesLoadingState());
    var result = await _getTopRatedUseCase(const NoParameter());
    result.fold((l) {
      emit(GetTopRatedMoviesErrorState(l.message));
    }, (r) {
      topRatedMovies = r;

      emit(GetTopRatedMoviesSuccessState(r));
    });
  }

  Future<void> getNowPlayingMovies() async {
    emit(GetPopularMoviesLoadingState());
    var result = await _getNowPlayingUseCase(const NoParameter());
    result.fold((l) {
      emit(GetNowPlayingMoviesErrorState(l.message));
    }, (r) {
      r.map((e) => nowPlayingMovies.add(e));

      emit(GetNowPlayingMoviesSuccessState(r));
    });
  }
}
