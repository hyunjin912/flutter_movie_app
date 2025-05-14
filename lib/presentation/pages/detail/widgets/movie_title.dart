import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/font.dart';
import 'package:intl/intl.dart';

class MovieTitle extends StatelessWidget {
  final String title;
  final DateTime releaseDate;
  final String tagline;
  final int runtime;

  const MovieTitle({
    super.key,
    required this.title,
    required this.releaseDate,
    required this.tagline,
    required this.runtime,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(title, style: TextStyle(fontSize: 24))),
            Text(
              DateFormat('yyyy-MM-dd').format(releaseDate),
              style: Font.style.copyWith(fontSize: 16),
            ),
          ],
        ),
        Text(tagline, style: Font.style),
        Text('$runtime분', style: Font.style),
      ],
    );
  }
}
