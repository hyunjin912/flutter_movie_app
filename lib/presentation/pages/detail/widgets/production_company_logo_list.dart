import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/detail/widgets/production_company_logo_item.dart';

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
            return ProductionCompanyLogoItem(
              logoLength: logos.length,
              index: index,
              logoPath: logos[index],
            );
          }),
        ],
      ),
    );
  }
}
