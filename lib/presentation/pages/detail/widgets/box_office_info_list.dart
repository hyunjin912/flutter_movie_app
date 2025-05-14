import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/detail/widgets/box_office_info_item.dart';

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
                return BoxOfficeInfoItem(
                  boxOffceInfoLength: boxOffceInfo.length,
                  index: index,
                  boxOffceInfo: boxOffceInfo,
                );
              }),
            ],
          ),
        ),
      ],
    );
  }
}
