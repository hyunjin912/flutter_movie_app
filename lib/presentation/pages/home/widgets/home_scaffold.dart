import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/home/home_view_model.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/move_list.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/movie_main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScaffold extends ConsumerStatefulWidget {
  @override
  ConsumerState<HomeScaffold> createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends ConsumerState<HomeScaffold> {
  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeViewModelProvider);

    return Column(
      children: [
        MovieMain(),
        SizedBox(height: 15), // 위 MovieMain의 컨테이너의 패딩 바텀 5 있기 때문에
        MoveList(label: '인기순', isNumber: true, movies: homeState.popular),
        SizedBox(height: 20),
        MoveList(label: '평점 높은 순', isNumber: false, movies: homeState.topRated),
        SizedBox(height: 20),
        MoveList(label: '개봉예정', isNumber: false, movies: homeState.upcoming),
      ],
    );
  }
}
