import 'package:go_router/go_router.dart';
import 'package:movies_app/features/movies/presentation/pages/movie_details_screen.dart';
import 'package:movies_app/features/movies/presentation/pages/on_boarding_screens.dart';

import '../../features/movies/presentation/pages/home_bage.dart';

class AppRouter {
  static String onBoardingRoute = '/';
  static String homeRoute = '/home';
  static String movieDetailsRoute = '/details';

  static final router = GoRouter(routes: [
    GoRoute(
        path: onBoardingRoute,
        builder: (context, state) => const HomePage()),
    GoRoute(
        path: homeRoute,
        builder: (context, state) => const HomePage()),
    GoRoute(
        path: movieDetailsRoute,
        builder: (context, state) => const MovieDetailScreen()),
  ]);
}
