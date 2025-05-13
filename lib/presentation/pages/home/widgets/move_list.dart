import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/movie_item.dart';

class MoveList extends StatelessWidget {
  final String label;
  final bool isNumber;
  final List<Movie>? movies;

  const MoveList({
    super.key,
    required this.label,
    required this.isNumber,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(label),
        ),
        SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: movies?.length ?? 20,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MovieItem(
                label: label,
                movie: movies?[index],
                isNumber: isNumber,
                number: '${index + 1}',
              );
            },
            separatorBuilder: (context, index) {
              if (isNumber) {
                return SizedBox();
              } else {
                return SizedBox(width: 10);
              }
            },
          ),
        ),
      ],
    );
  }
}
