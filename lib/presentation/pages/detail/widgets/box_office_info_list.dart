import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/font.dart';

class BoxOfficeInfo extends StatelessWidget {
  final List<List<dynamic>> boxOffceInfo;

  const BoxOfficeInfo({required this.boxOffceInfo, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 30, bottom: 10),
          child: Text('흥행정보', style: TextStyle(fontSize: 20)),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(boxOffceInfo.length, (index) {
                return Container(
                  margin:
                      index == boxOffceInfo.length - 1
                          ? null
                          : const EdgeInsets.only(right: 15),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey, width: 2),
                  ),
                  child: Column(
                    children: [
                      Text('${boxOffceInfo[index].last}', style: Font.style),
                      Text(boxOffceInfo[index].first, style: Font.style),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
