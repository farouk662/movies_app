part of 'movies_cubit.dart';

@immutable
abstract class MoviesState {}

class MoviesInitial extends MoviesState {}

class GetPopularMoviesSuccessState extends MoviesState {
  final List<Movie> movies;

  GetPopularMoviesSuccessState(this.movies);
}

class GetPopularMoviesLoadingState extends MoviesState {}

class GetPopularMoviesErrorState extends MoviesState {
  final String message;

  GetPopularMoviesErrorState(this.message);
}

class GetUpcomingMoviesSuccessState extends MoviesState {
  final List<Movie> movies;

  GetUpcomingMoviesSuccessState(this.movies);
}

class GetUpcomingMoviesLoadingState extends MoviesState {}

class GetUpcomingMoviesErrorState extends MoviesState {
  final String message;

  GetUpcomingMoviesErrorState(this.message);

}

  class GetTopRatedMoviesSuccessState extends MoviesState {
  final List<Movie> movies;

  GetTopRatedMoviesSuccessState(this.movies);
  }

  class GetTopRatedMoviesLoadingState extends MoviesState {}

  class GetTopRatedMoviesErrorState extends MoviesState {
  final String message;

  GetTopRatedMoviesErrorState(this.message);
  }


class GetNowPlayingMoviesSuccessState extends MoviesState {
  final List<Movie> movies;

  GetNowPlayingMoviesSuccessState(this.movies);
}

class GetNowPlayingMoviesLoadingState extends MoviesState {}

class GetNowPlayingMoviesErrorState extends MoviesState {
  final String message;

  GetNowPlayingMoviesErrorState(this.message);
}

