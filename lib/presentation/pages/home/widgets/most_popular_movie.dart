import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/presentation/pages/detail/detail.dart';
import 'package:flutter_movie_app/presentation/pages/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class MostPopularMovie extends StatelessWidget {
  final Movie? movie;

  const MostPopularMovie({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    print('MostPopularMovie : ${movie?.id}');
    final heroTag = '가장 인기있는_${movie?.id ?? ''}';
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => Detail(movie: movie, heroTag: heroTag),
                    ),
                  );
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Hero(
                    tag: heroTag,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child:
                          movie == null
                              ? Shimmer.fromColors(
                                baseColor: Colors.grey,
                                highlightColor: Colors.grey[600]!,
                                child: Container(color: Colors.white),
                              )
                              : Image.network(
                                'https://image.tmdb.org/t/p/original${movie?.posterPath}',
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
  }
}
