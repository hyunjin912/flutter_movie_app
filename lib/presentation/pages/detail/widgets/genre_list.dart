import 'package:flutter/material.dart';

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
              return genreItem(
                categoryLength: genres.length,
                index: index,
                genre: genres[index],
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget genreItem({
    required int categoryLength,
    required int index,
    required String genre,
  }) {
    return Container(
      margin:
          index == categoryLength - 1 ? null : const EdgeInsets.only(right: 6),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: const Color.fromARGB(255, 72, 72, 72),
          width: 2,
        ),
      ),
      child: Text(genre, style: TextStyle(color: Colors.blue)),
    );
  }
}
