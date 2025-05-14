import 'package:flutter/material.dart';

class ProductionCompanyLogoList extends StatelessWidget {
  final List<String> logos;

  const ProductionCompanyLogoList({required this.logos, super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(logos.length, (index) {
            return Container(
              margin:
                  index == logos.length - 1
                      ? null
                      : const EdgeInsets.only(right: 15),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),

              color: Colors.white.withValues(alpha: 0.9),
              child:
                  logos.isEmpty
                      ? SizedBox()
                      : SizedBox(
                        width: 110,
                        height: 40,
                        child: Image.network(
                          'https://image.tmdb.org/t/p/original${logos[index]}',
                        ),
                      ),
            );
          }),
        ],
      ),
    );
  }
}
