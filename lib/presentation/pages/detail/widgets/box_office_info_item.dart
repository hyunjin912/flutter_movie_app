import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/font.dart';

class BoxOfficeInfoItem extends StatelessWidget {
  final int boxOffceInfoLength;
  final int index;
  final List<dynamic> boxOffceInfo;

  const BoxOfficeInfoItem({
    super.key,
    required this.boxOffceInfoLength,
    required this.index,
    required this.boxOffceInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          index == boxOffceInfo.length - 1
              ? null
              : const EdgeInsets.only(right: 15),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
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
  }
}
