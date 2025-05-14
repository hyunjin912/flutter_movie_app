import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:shimmer/shimmer.dart';

class MoviePoster extends StatelessWidget {
  final MovieDetail? movie;
  final String posterPath;
  final String heroTag;

  const MoviePoster({
    super.key,
    required this.movie,
    required this.posterPath,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
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
                  'https://image.tmdb.org/t/p/original$posterPath',
                  fit: BoxFit.cover,
                ),
      ),
    );
  }
}
