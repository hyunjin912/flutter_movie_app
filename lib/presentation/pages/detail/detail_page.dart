import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/presentation/pages/detail/widgets/detail_scaffold.dart';
import 'package:flutter_movie_app/presentation/pages/widgets/global_scaffold.dart';

class DetailPage extends StatelessWidget {
  final MovieDetail? movie;
  final String posterPath;
  final String heroTag;

  const DetailPage({
    required this.movie,
    required this.posterPath,
    required this.heroTag,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlobalScaffold(
      children: [
        DetailScaffold(movie: movie, posterPath: posterPath, heroTag: heroTag),
      ],
    );
  }
}
