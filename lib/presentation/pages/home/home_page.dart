import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/%08widgets/my_scaffold.dart';
import 'package:flutter_movie_app/presentation/pages/home/home_view_model.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/most_popular_movie.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/move_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final deviceSize = mediaQuery.size;
    final devicePadding = mediaQuery.padding;
    final homeState = ref.watch(homeViewModelProvider);

    return MyScaffold(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: deviceSize.height - devicePadding.top,
              padding: const EdgeInsets.only(top: 20, bottom: 5),
              child: Column(
                children: [
                  MostPopularMovie(movie: homeState.popular?.first),
                  SizedBox(height: 10),
                  MoveList(
                    label: '현재 상영중',
                    isNumber: false,
                    movies: homeState.nowPlaying,
                  ),
                ],
              ),
            ),
            SizedBox(height: 5), // 위 컨테이너의 패딩 바텀 5 있기 때문에
            MoveList(label: '인기순', isNumber: true, movies: homeState.popular),
            SizedBox(height: 10),
            MoveList(
              label: '평점 높은 순',
              isNumber: false,
              movies: homeState.topRated,
            ),
            SizedBox(height: 10),
            MoveList(
              label: '개봉예정',
              isNumber: false,
              movies: homeState.upcoming,
            ),
          ],
        ),
      ],
    );
  }
}
