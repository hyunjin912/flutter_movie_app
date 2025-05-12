import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/%08widgets/my_scaffold.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/most_popular_movie.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/move_list.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final deviceSize = mediaQuery.size;
    final devicePadding = mediaQuery.padding;

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
                  MostPopularMovie(deviceSize),
                  SizedBox(height: 10),
                  MoveList(label: '현재 상영중', isNumber: false),
                ],
              ),
            ),
            SizedBox(height: 5),
            MoveList(label: '인기순', isNumber: true),
          ],
        ),
      ],
    );
  }
}
