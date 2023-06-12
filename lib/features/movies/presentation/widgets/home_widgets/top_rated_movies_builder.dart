import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/components/erroe_massege_builder.dart';

import '../../movies_cubit/movies_cubit.dart';
import 'movies_list_builder.dart';

class TopRatedMoviesBuilder extends StatelessWidget {
  const TopRatedMoviesBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MoviesCubit, MoviesState>(
      listener: (context, state) {
        if (state is GetTopRatedMoviesErrorState) {
          errorMassageBuilder(state.message);
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
            condition: MoviesCubit.get(context).topRatedMovies.isNotEmpty,
            builder: (context) => MoviesListBuilder(
                movies: MoviesCubit.get(context).topRatedMovies),
            fallback: (context) => const SizedBox(
                  height: 140,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  ),
                ));
      },
    );
  }
}
