import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/home/home_view_model.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/most_popular_movie.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/move_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieMain extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mediaQuery = MediaQuery.of(context);
    final deviceSize = mediaQuery.size;
    final devicePadding = mediaQuery.padding;
    final homeState = ref.watch(homeViewModelProvider);

    return Container(
      width: double.infinity,
      height: deviceSize.height - devicePadding.top,
      padding: const EdgeInsets.only(top: 20, bottom: 5),
      child: Column(
        children: [
          MostPopularMovie(movie: homeState.popular?.first),
          SizedBox(height: 20),
          MoveList(
            label: '현재 상영중',
            isNumber: false,
            movies: homeState.nowPlaying,
          ),
        ],
      ),
    );
  }
}
