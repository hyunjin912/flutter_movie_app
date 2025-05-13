import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/detail/detail.dart';
import 'package:flutter_movie_app/presentation/pages/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class MostPopularMovie extends StatelessWidget {
  final Size deviceSize;

  const MostPopularMovie(this.deviceSize, {super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final homeState = ref.watch(homeViewModelProvider);
        print('✅');
        print(homeState.popular);
        print('✅');
        return Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('가장 인기있는'),
                SizedBox(height: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      print('가장 인기 있는');
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Detail()),
                      );
                    },
                    child: SizedBox(
                      width: double.infinity,
                      child: Hero(
                        tag: 'movie',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child:
                              homeState.popular?.isEmpty ?? true
                                  // true
                                  ? Shimmer.fromColors(
                                    baseColor: Colors.red,
                                    highlightColor: Colors.yellow,
                                    child: Container(color: Colors.white),
                                  )
                                  : Image.network(
                                    'https://image.tmdb.org/t/p/original${homeState.popular!.first.posterPath}',
                                    fit: BoxFit.cover,
                                  ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
