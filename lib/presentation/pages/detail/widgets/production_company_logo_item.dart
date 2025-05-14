import 'package:flutter/material.dart';

class ProductionCompanyLogoItem extends StatelessWidget {
  final int logoLength;
  final int index;
  final String logoPath;

  const ProductionCompanyLogoItem({
    super.key,
    required this.logoLength,
    required this.index,
    required this.logoPath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: index == logoLength - 1 ? null : const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

      color: Colors.white.withValues(alpha: 0.9),
      child: SizedBox(
        width: 110,
        height: 40,
        child: Image.network('https://image.tmdb.org/t/p/w200${logoPath}'),
      ),
    );
  }
}
