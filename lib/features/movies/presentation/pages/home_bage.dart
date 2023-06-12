import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utlis/service_locator.dart';
import 'package:movies_app/features/movies/presentation/movies_cubit/movies_cubit.dart';
import 'package:movies_app/features/movies/presentation/widgets/home_widgets/popluar_movies_builder.dart';

import '../../../../core/utlis/colors.dart';
import '../widgets/home_widgets/search_text_field.dart';
import '../widgets/home_widgets/title_text_builder.dart';
import '../widgets/home_widgets/top_rated_movies_builder.dart';
import '../widgets/home_widgets/upcoming_movies_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => getIt<MoviesCubit>()
        ..getPopularMovies()
        ..getTopRatedMovies()
        ..getUpcomingMovies()
        ..getNowPlayingMovies(),
      child: BlocBuilder<MoviesCubit, MoviesState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.blackColor,
            body: SafeArea(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: Text(
                        'What would you\n like to watch ?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 34,
                            color: AppColors.whiteColor.withOpacity(.8),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 34,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: SearchTextField(),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    const TitleTextBuilder('Popular Movies'),
                    const SizedBox(
                      height: 20,
                    ),

                    const PopularMoviesBuilder(),
                    const SizedBox(
                      height: 28,
                    ),
                    const TitleTextBuilder('Top rater Movies'),
                    const SizedBox(
                      height: 20,
                    ),
                    const TopRatedMoviesBuilder(),

                    const SizedBox(
                      height: 28,
                    ),
                    const TitleTextBuilder('Upcoming Movies'),
                    const SizedBox(
                      height: 20,
                    ),
                    const UpcomingMoviesBuilder(),
                    const SizedBox(height: 50,),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
