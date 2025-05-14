import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/font.dart';

class Overview extends StatelessWidget {
  final String overview;

  const Overview({required this.overview, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Text(overview, style: Font.style),
    );
  }
}
