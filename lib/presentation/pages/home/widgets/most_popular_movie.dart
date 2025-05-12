import 'package:flutter/material.dart';
import 'package:flutter_movie_app/presentation/pages/detail/detail.dart';

class MostPopularMovie extends StatelessWidget {
  final Size deviceSize;

  const MostPopularMovie(this.deviceSize, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('가장 인기있는'),
            SizedBox(height: 10),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  print('가장 인기 있는');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Detail()),
                  );
                },
                child: SizedBox(
                  width: double.infinity,
                  child: Hero(
                    tag: 'movie',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://picsum.photos/400/600',
                        fit: BoxFit.cover,
                      ),
                    ),
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
