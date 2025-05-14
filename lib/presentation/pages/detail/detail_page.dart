import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_app/presentation/pages/%08widgets/my_scaffold.dart';
import 'package:flutter_movie_app/presentation/pages/detail/widgets/box_office_info_list.dart';
import 'package:flutter_movie_app/presentation/pages/detail/widgets/genre_list.dart';
import 'package:flutter_movie_app/presentation/pages/detail/widgets/movie_poster.dart';
import 'package:flutter_movie_app/presentation/pages/detail/widgets/movie_title.dart';
import 'package:flutter_movie_app/presentation/pages/detail/widgets/overview.dart';
import 'package:flutter_movie_app/presentation/pages/detail/widgets/production_company_logo_list.dart';
import 'package:intl/intl.dart';

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
    List<List<dynamic>> boxOffceInfo = [
      ['평점', movie!.voteAverage],
      ['평점투표수', movie!.voteCount],
      ['인기점수', movie!.popularity],
      ['예산', NumberFormat('###,###,###,###').format(movie!.budget)],
      ['수익', NumberFormat('###,###,###,###').format(movie!.revenue)],
    ];

    return MyScaffold(
      children: [
        MoviePoster(movie: movie, posterPath: posterPath, heroTag: heroTag),
        Padding(
          padding: const EdgeInsets.only(
            top: 15,
            left: 20,
            right: 20,
            bottom: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MovieTitle(
                title: movie!.title,
                releaseDate: movie!.releaseDate,
                tagline: movie!.tagline,
                runtime: movie!.runtime,
              ),
              SizedBox(height: 10),
              GenreList(genres: movie!.genres),
              Overview(overview: movie!.overview),
              BoxOfficeInfo(boxOffceInfo: boxOffceInfo),
              SizedBox(height: 30),
              ProductionCompanyLogoList(logos: movie!.productionCompanyLogos),
            ],
          ),
        ),
      ],
    );
  }
}
