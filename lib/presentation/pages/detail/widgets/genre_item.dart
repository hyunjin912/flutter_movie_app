import 'package:flutter/material.dart';

class GenreItem extends StatelessWidget {
  final int genreLength;
  final int index;
  final String genre;

  const GenreItem({
    super.key,
    required this.genreLength,
    required this.index,
    required this.genre,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: index == genreLength - 1 ? null : const EdgeInsets.only(right: 6),
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
