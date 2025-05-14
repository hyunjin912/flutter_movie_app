import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/detail/widgets/genre_item.dart';

class GenreList extends StatelessWidget {
  final List<String> genres;

  const GenreList({required this.genres, super.key});

  @override
  Widget build(Object context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border.symmetric(horizontal: BorderSide(color: Colors.grey)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ...List.generate(genres.length, (index) {
              return GenreItem(
                genreLength: genres.length,
                index: index,
                genre: genres[index],
              );
            }),
          ],
        ),
      ),
    );
  }
}
