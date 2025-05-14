import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/presentation/pages/detail/detail_page.dart';
import 'package:flutter_movie_app/presentation/pages/detail/detail_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class MostPopularMovie extends ConsumerWidget {
  final Movie? movie;

  const MostPopularMovie({required this.movie, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                onTap: () async {
                  final detailVm = ref.read(detailViewModelProvider.notifier);
                  final detailMovie = await detailVm.fetchMovieDetail(
                    movie!.id,
                  );
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder:
                          (context) => DetailPage(
                            movie: detailMovie,
                            posterPath: movie!.posterPath,
                            heroTag: heroTag,
                          ),
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
