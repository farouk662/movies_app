import 'package:get_it/get_it.dart';
import 'package:movies_app/features/movies/data/repositories/repo_Imp.dart';
import 'package:movies_app/features/movies/domain/use_cases/get_popular_movies_use_case.dart';
import 'package:movies_app/features/movies/presentation/movies_cubit/movies_cubit.dart';

import '../../features/movies/data/data_sources/remote_data_sorce.dart';
import '../../features/movies/domain/use_cases/get_now_playing_movies_use_case.dart';
import '../../features/movies/domain/use_cases/get_top_rated_movies_use_case.dart';
import '../../features/movies/domain/use_cases/get_upcoming_movies_use_case.dart';
final getIt = GetIt.instance;
class ServiceLocator {

//MoviesCubit(GetPopularUseCase(MovieRepoImp(MoviesRemoteDataSourceIMP())))
  static void setup() {
    getIt.registerLazySingleton(() => MoviesRemoteDataSourceIMP());
    // getIt.registerLazySingleton(() => MoviesRemoteDataSourceIMP());
    getIt.registerLazySingleton(() => MovieRepoImp(getIt<MoviesRemoteDataSourceIMP>()));
    getIt.registerLazySingleton(() => GetPopularUseCase(getIt<MovieRepoImp>()));
    getIt.registerLazySingleton(() => GetNowPlayingUseCase(getIt<MovieRepoImp>()));
    getIt.registerLazySingleton(() => GetUpComingUseCase(getIt<MovieRepoImp>()));
    getIt.registerLazySingleton(() => GetTopRatedUseCase(getIt<MovieRepoImp>()));
    getIt.registerLazySingleton(
        () => MoviesCubit(getIt<GetPopularUseCase>(), getIt<GetTopRatedUseCase>(), getIt<GetUpComingUseCase>(), getIt<GetNowPlayingUseCase>()));
  }
}
