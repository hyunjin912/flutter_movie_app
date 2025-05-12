import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/detail/detail.dart';

class MovieItem extends StatelessWidget {
  final bool isNumber;
  final String number;

  const MovieItem({required this.isNumber, required this.number, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Detail()),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(left: isNumber ? 35 : 0),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            AspectRatio(
              aspectRatio: 2 / 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://picsum.photos/200/300',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: -30,
              child: Visibility(
                visible: isNumber,
                child: Text(
                  number,
                  style: TextStyle(
                    letterSpacing: -10,
                    height: 1,
                    fontSize: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
