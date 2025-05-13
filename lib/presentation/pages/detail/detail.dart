import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_movie_app/domain/entity/movie.dart';
import 'package:flutter_movie_app/presentation/pages/%08widgets/my_scaffold.dart';
import 'package:flutter_movie_app/presentation/pages/home/widgets/movie_item.dart';
import 'package:shimmer/shimmer.dart';

class Detail extends StatelessWidget {
  final Movie? movie;
  final String heroTag;

  const Detail({required this.movie, required this.heroTag, super.key});

  @override
  Widget build(BuildContext context) {
    List list = List.filled(10, 0);
    print('Detail movie.id : ${movie?.id}');
    return MyScaffold(
      children: [
        Hero(
          tag: heroTag,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child:
                movie == null
                    ? Shimmer.fromColors(
                      baseColor: Colors.grey,
                      highlightColor: Colors.grey[600]!,
                      child: Container(color: Colors.white),
                    )
                    : Image.network(
                      'https://image.tmdb.org/t/p/original${movie?.posterPath}',
                      fit: BoxFit.cover,
                    ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 15,
            left: 20,
            right: 20,
            bottom: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Moana 2', style: TextStyle(fontSize: 24)),
                  Text('2024-11-27', style: Font.style.copyWith(fontSize: 16)),
                ],
              ),
              Text('The ocean is calling them back.', style: Font.style),
              Text('100분', style: Font.style),
              SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(color: Colors.grey),
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(list.length, (index) {
                        return Container(
                          margin:
                              index == list.length - 1
                                  ? null
                                  : const EdgeInsets.only(right: 6),
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color.fromARGB(255, 72, 72, 72),
                              width: 2,
                            ),
                          ),
                          child: Text(
                            'Animation',
                            style: TextStyle(color: Colors.blue),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey)),
                ),
                child: Text(
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like.',
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: Font.style,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 10),
                child: Text('흥행정보', style: TextStyle(fontSize: 20)),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(list.length, (index) {
                      return Container(
                        margin:
                            index == list.length - 1
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
                            Text('6.949', style: Font.style),
                            Text('평점', style: Font.style),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
              ),
              SizedBox(height: 30),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(list.length, (index) {
                      return Container(
                        margin:
                            index == list.length - 1
                                ? null
                                : const EdgeInsets.only(right: 15),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        color: Colors.white.withValues(alpha: 0.9),
                        // child: Image.network('https://picsum.photos/100/50'),
                        child: SizedBox(),
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Font {
  static final style = TextStyle(color: Colors.grey);
}
