import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/presentation/pages/detail/detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

class MovieItem extends ConsumerStatefulWidget {
  final String label;
  final bool isNumber;
  final String number;
  final Movie? movie;

  const MovieItem({
    required this.label,
    required this.isNumber,
    required this.number,
    required this.movie,
    super.key,
  });

  @override
  ConsumerState<MovieItem> createState() => _MovieItemState();
}

class _MovieItemState extends ConsumerState<MovieItem>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    print('MovieItem movie.id : ${widget.movie?.id}');
    final heroTag = '${widget.label}_${widget.movie?.id ?? ''}';
    super.build(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(movie: widget.movie, heroTag: heroTag),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(left: widget.isNumber ? 35 : 0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AspectRatio(
              aspectRatio: 2 / 3,
              child: Hero(
                tag: heroTag,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child:
                      widget.movie == null
                          ? Shimmer.fromColors(
                            baseColor: Colors.grey,
                            highlightColor: Colors.grey[600]!,
                            child: Container(color: Colors.white),
                          )
                          : Image.network(
                            'https://image.tmdb.org/t/p/original${widget.movie?.posterPath}',
                            fit: BoxFit.cover,
                          ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: -30,
              child: Visibility(
                visible: widget.isNumber,
                child: Text(
                  widget.number,
                  style: TextStyle(
                    letterSpacing: -10,
                    height: 1,
                    fontSize: 100,
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
