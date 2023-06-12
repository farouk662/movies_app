import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/movie.dart';
import 'movie_item_builder.dart';

class MoviesListBuilder extends StatelessWidget {
  const MoviesListBuilder({Key? key, required this.movies})
      : super(key: key);
  final List<Movie> movies;


  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 240,
      child: ListView.separated(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            double left = 0, right = 0;
            if (index == 0) {
              left = 20;
              right = 0;
            } else if (index == movies.length - 1) {
              left = 0;
              right = 20;
            }
            String mask;
            if (index == 0) {
              mask = 'assets/masks/mask_firstIndex.png';
            } else if (index == movies.length - 1) {
              mask = 'assets/masks/mask_lastIndex.png';
            } else {
              mask = 'assets/masks/mask.png';
            }
            return FadeIn(
              child: MovieItemBuilder(
                  leftPadding: left,
                  rightPadding: right,
                  mask: mask,
                  image: movies[index].image),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                width: 6,
              ),
          itemCount: movies.length),
    );
  }
}
